

namespace Capstone_Xavier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Linq;
    using System.Web;
    public class LoginModel: BaseModel
    {
        [Required]
        public string username { get; set; }

        [Required(ErrorMessage = "Password is required.")]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[#@$%!?^&*\-+]).*$", ErrorMessage = "Invalid Password. Passwords must contain: " +
            "<br> &ensp; \u2022 One or more captial letters " +
            "<br> &ensp; \u2022 One or more lower case letters" +
            "<br> &ensp; \u2022 One or more numbers (0-9)" +
            "<br> &ensp; \u2022 One or more special characters (#, ?, !, @, $, %, ^, &, *, -, +)")]
        [StringLength(20, MinimumLength = 8, ErrorMessage = "Password must be at least 8 and no more than 20 characters long.")]
        public string password { get; set; }
    }
}