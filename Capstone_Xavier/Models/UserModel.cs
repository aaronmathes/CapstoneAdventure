

namespace Capstone_Xavier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Linq;
    using System.Web;

    public class UserModel:BaseModel
    {
        public int userID { get; set; }
        public int roleID { get; set; }
        public bool changeRole { get; set; }

        [Required(ErrorMessage = "Username is required")]
        public string username { get; set; }

        [Required(ErrorMessage = "Password is required")]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[#@$%!?^&*\-+]).*$", ErrorMessage = "Invalid Password. Passwords must contain: " +
          "<br> &ensp; \u2022 One or more captial letters " +
          "<br> &ensp; \u2022 One or more lower case letters" +
          "<br> &ensp; \u2022 One or more numbers (0-9)" +
          "<br> &ensp; \u2022 One or more special characters (#, ?, !, @, $, %, ^, &, *, -, +)")]
        [StringLength(20, MinimumLength = 8, ErrorMessage = "Password must be at least 8 and no more than 20 characters long.")]
        public string password { get; set; }

        [Required(ErrorMessage = "Confirm password is required")]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[#@$%!?^&*\-+]).*$", ErrorMessage = "Invalid Password. Passwords must contain: " +
          "<br> &ensp; \u2022 One or more captial letters " +
          "<br> &ensp; \u2022 One or more lower case letters" +
          "<br> &ensp; \u2022 One or more numbers (0-9)" +
          "<br> &ensp; \u2022 One or more special characters (#, ?, !, @, $, %, ^, &, *, -, +)")]
        [StringLength(20, MinimumLength = 8, ErrorMessage = "Password must be at least 8 and no more than 20 characters long.")]
        [Compare(nameof(password), ErrorMessage = "Passwords don't match.")]
        public string confirmPassword { get; set; }

        [Required]
        [RegularExpression(@"^\w+@[A-z]+\.\w{2,3}$", ErrorMessage = "Email invlaid. Email must be in the form of: " +
            "<br> &ensp; \u2022 One or more letters " +
            "<br> &ensp; \u2022 @" +
            "<br> &ensp; \u2022 One or more letters" +
            "<br> &ensp; \u2022 One period" +
            "<br> &ensp; \u2022 Two or 3 ending letters (i.e. com, co, en, etc.)" +
            "<br> &ensp;  Example: example@email.com")]
        public string email { get; set; }
        public List<RoleModel> roles { get; set; }

        public List<CharacterModel> characters { get; set; }

        public UserModel() 
        {
            base.alertMessage = "";
            base.alertType = 0;
        
        }
        
    }
}