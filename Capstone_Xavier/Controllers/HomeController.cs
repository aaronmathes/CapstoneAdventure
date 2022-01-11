
namespace Capstone_Xavier.Controllers
{
    using Capstone_BLL;
    using Capstone_BLL.BusinessObjects;
    using Capstone_Xavier.Filters;
    using Capstone_Xavier.Models;
    using System.Collections.Generic;
    using System.Web.Mvc;
    using System.Web.Security;


    public class HomeController : Controller
    {

        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        #region register and login

        [HttpGet]
        public ActionResult Register()
        {
            RegisterModel register = new RegisterModel();
            return View(register);
        }

        [HttpPost]
        public ActionResult Register(RegisterModel register)
        {


            if (ModelState.IsValid)
            {
                Mapper mapper = new Mapper();

                UsersBO user = mapper.UIRegister_To_BO(register);
                DBUse data = new DBUse();

                data.AddUser(user);
                LoginModel login = new LoginModel();
                //For getting the userdata in creating the default character to use
                UsersBO _user = data.FindUser(user);
                CreateDefaultCharacter(_user.UserID);

                user = data.FindUser(user);
                Session["Username"] = user.Username;
                //user doesnt return password for security. Pass in login pass for use later.
                user.Password = register.password;
                Session["User"] = mapper.UserBO_To_Model(user);
                Session["Role"] = user.UserRole.ToString();
                Session["UserID"] = user.UserID;
                return RedirectToAction("Users", "Home");

            }
            else
            {//For if the modelstate isnt valid
                return View(register);
            }

        }

        [HttpGet]
        public ActionResult Login()
        {

            LoginModel _loginModel = new LoginModel();

            _loginModel.username = "";
            _loginModel.password = "";

            return View(_loginModel);
        }

        [HttpPost]
        public ActionResult Login(LoginModel login)
        {
            Mapper mapper = new Mapper();

            UsersBO user = mapper.UILogin_To_BO(login);
            DBUse data = new DBUse();

            if (ModelState.IsValid)
            {
                user = data.FindUser(user);
                login.alertMessage = user.ErrorMessage;

                if (login.alertMessage != "")
                {
                    return View(login);
                }
                else
                {
                    Session["Username"] = user.Username;
                    //user doesnt return password for security. Pass in login pass for use later.
                    user.Password = login.password;
                    Session["User"] = mapper.UserBO_To_Model(user);
                    Session["Role"] = user.UserRole.ToString();
                    Session["UserID"] = user.UserID;
                    return RedirectToAction("Users", "Home");
                }

            }
            else
            {
                return View(login);
            }

        }


        [HttpGet]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Abandon();

            return RedirectToAction("Index", "Home");
        }

        #endregion register and login


        [MustBeLoggedIn]
        public ActionResult Test() {
            return View();
        }

        //For sendin users to the home page. 
        [MustBeLoggedIn]
        [HttpGet]
        public ActionResult Users() {
            Mapper mapper = new Mapper();
            DBUse data = new DBUse();
            int userID = (int)Session["UserID"];

            var userCharacterBOs = data.GetCharacters(userID);
                        
            List<CharacterModel> characters = mapper.CharacterModel_To_List(userCharacterBOs);

            List<LevelBO> levels = data.GetListofLevels();
            
            foreach (CharacterModel model in characters)
            {
                var nextLevel = model.level + 1;
                foreach (LevelBO level in levels)
                {
                    if (level.CharacterLvl == nextLevel)
                    {
                        model.maxXp = level.MinXP;
                        break;
                    }
                }
            }

            return View(characters);
        }

        //-------------Misc-------------
        private bool ValidatePassword(string password) {
            bool _returnBool = false;
            char[] _password = password.ToCharArray();
            int numcount = 0;
            int specialCount = 0;
            int capCount = 0;
            int count = _password.Length;

            for (int i = 0; i < _password.Length; i++) {
                char temp = _password[i];
                if (char.IsLetterOrDigit(temp))
                {
                    if (char.IsDigit(temp))
                    {
                        numcount++;
                    }
                    else {
                        if (char.IsUpper(temp)) {
                            capCount++;
                        }
                    }
                }
                else {
                    specialCount++;
                }
            }

            if (numcount >= 1 && capCount >= 1 && specialCount >= 1 && count >= 8 && count <= 20)
            {
                _returnBool = true;
            }
            else {
                _returnBool = false;
            }


            return _returnBool;
        }

        public ActionResult FAQS() {
            return View();
        }

        private void CreateDefaultCharacter(int userID) {
            DBUse data = new DBUse();
            Mapper map = new Mapper();
            CharacterModel character = new CharacterModel();
            ClassModel _class = map.ClassBO_To_Model(data.GetClassInfo(4));

            character.health = _class.baseHP;
            character.userID = userID;
            character.name = "Default";
            character.classID = 4;
            

            data.CreateCharacter(map.CharacterModel_To_BO(character));
        }
    }
}