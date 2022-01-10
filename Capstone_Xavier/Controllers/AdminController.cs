

namespace Capstone_Xavier.Controllers
{
    using Capstone_BLL;
    using Capstone_Xavier.Filters;
    using Capstone_Xavier.Models;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.Mvc;

    public class AdminController : Controller
    {
        // GET: Admin
        [MustBeLoggedIn]
        [MustBeInRole(Roles = "Admin")]
        public ActionResult Admin()
        {
            Mapper map = new Mapper();
            AdminModel admin = new AdminModel();
            DBUse data = new DBUse();

            admin.users = map.UserBO_To_List(data.GetAllUsers());
            foreach (UserModel user in admin.users)
            {
                user.characters = map.CharacterModel_To_List(data.GetCharacters(user.userID));
            }

            admin.monsters = map.MonsterBO_To_List(data.GetAllMonsters());


            return View(admin);
        }
        //[MustBeLoggedIn]
        //[MustBeInRole(Roles = "Admin")]
        //public ActionResult Admin2(string alertText)
        //{
        //    Mapper map = new Mapper();
        //    AdminModel admin = new AdminModel();
        //    admin.alertMessage = alertText;
        //    DBUse data = new DBUse();

        //    admin.users = map.UserBO_To_List(data.GetAllUsers());
        //    foreach (UserModel user in admin.users)
        //    {
        //        user.characters = map.CharacterModel_To_List(data.GetCharacters(user.userID));
        //    }

        //    admin.monsters = map.MonsterBO_To_List(data.GetAllMonsters());


        //    return View(admin);
        //}

        [MustBeLoggedIn]
        [MustBeInRole(Roles = "GameMaster")]
        public ActionResult Gamemaster() {
            Mapper map = new Mapper();
            AdminModel admin = new AdminModel();
            DBUse data = new DBUse();

            admin.monsters = map.MonsterBO_To_List(data.GetAllMonsters());
            return View(admin);
        }

        #region users

        [HttpPost]
        public ActionResult GetAllUsers() {
            DBUse data = new DBUse();
            Mapper map = new Mapper();

            return View();
        }

        [HttpGet]
        [MustBeLoggedIn]
        [MustBeInRole(Roles = "Admin")]
        public ActionResult AdminUserAlter(int id) 
        {
            Mapper _map = new Mapper();
            DBUse _data = new DBUse();
            var _getUser = _data.GetAllUsers().Where(u => u.UserID == id).FirstOrDefault();

            UserModel _user = _map.UserBOToUserModel(_getUser);

            _user.roles = _map.RoleBO_To_List(_data.GetRoles());

            return View("AdminUserAlter", _user);
        }

        [HttpPost]
        [MustBeLoggedIn]
        [MustBeInRole(Roles = "Admin")]
        public ActionResult AdminUserAlter(UserModel user) 
        {

            DBUse _data = new DBUse();
            Mapper _map = new Mapper();

            if (ModelState.IsValid)
            {

                _data.UpdateUserInfo(_map.UserModel_To_BO(user));
                user.roles = _map.RoleBO_To_List(_data.GetRoles());
                user.alertMessage = "you have sucessfully updated "+user.username;
                //return RedirectToAction("Admin", "Admin");
                return View(user);
              
            }
            else 
            {
                user.roles = _map.RoleBO_To_List(_data.GetRoles());
                user.alertMessage = "";
                return View(user);

            }

         
        }

        [HttpPost]
        [MustBeLoggedIn]
        [MustBeInRole(Roles = "Admin")]
        public ActionResult RemoveUser(int id) 
        {
            DBUse data = new DBUse();

            data.RemoveUser(id);

            return RedirectToAction("Admin", "Admin");
        }

        #endregion users


        #region monster

        [HttpGet]
        [MustBeInRole(Roles = "Admin,GameMaster")]
        [MustBeLoggedIn]
        public ActionResult MonsterAlter(MonsterModel monster) {
            //monster.alertMessage = "";
            return View(monster);
        }

        [HttpPost]
        public ActionResult MonsterAlterPost(MonsterModel monster) {
            DBUse data = new DBUse();
            Mapper map = new Mapper();
            //monster.alertMessage = "";
            if (ModelState.IsValid)
            {
                data.UpdateMonster(map.MonsterModel_To_BO(monster));
                monster.alertMessage = "Sucessfully altered " + monster.monsterName;
                return RedirectToAction("MonsterAlter", "Admin", monster);
            }
            else {
                //monster.alertType = 2;
                monster.alertMessage = "";
                
                return RedirectToAction("MonsterAlter", "Admin", monster);
            }
            
            
        }

        public ActionResult RemoveMonster(MonsterModel monster) {
            DBUse data = new DBUse();
            string role = Session["Role"].ToString();

            data.RemoveMonster(monster.monsterID);

            if (role == "1")
            {
                return RedirectToAction("Admin", "Admin");
            }
            else {
                return RedirectToAction("GameMaster", "Admin");
            }

            
        }

        [HttpGet]
        [MustBeInRole(Roles ="Admin,GameMaster")]
        [MustBeLoggedIn]
        public ActionResult CreateMonster() {
            MonsterModel monster = new MonsterModel();

            return View(monster);
        }

        [HttpPost]
        public ActionResult CreateMonster(MonsterModel monster) {
            DBUse data = new DBUse();
            Mapper map = new Mapper();
            string role = Session["Role"].ToString();

            if (ModelState.IsValid)
            {
                data.CreateMonster(map.MonsterModel_To_BO(monster));
                if (role == "1")
                {
                    return RedirectToAction("Admin", "Admin", monster);
                }
                else {
                    return RedirectToAction("GameMaster", "Admin", monster);
                }
            }
            else {
                return RedirectToAction("CreateMonster", "Admin", monster);
            }

            

            
        }

        #endregion monster

    }
}