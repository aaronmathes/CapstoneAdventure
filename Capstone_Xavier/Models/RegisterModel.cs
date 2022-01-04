

namespace Capstone_Xavier.Models
{
    using System.ComponentModel.DataAnnotations;
    public class RegisterModel:BaseModel
    {
        [Required]
        [MaxLength(15, ErrorMessage = "Username cannot be above 15 characters")]
        public string username { get; set; }
        public int userValid = 0;


        [Required]
        public string password { get; set; }
        public int passValid = 0;

        [Required]
        [RegularExpression(@"^\w+@[A-z]+\.\w{2,3}$", ErrorMessage = "Email invlaid. Email must be in the form of: " +
            "<br> &ensp; \u2022 One or more letters " +
            "<br> &ensp; \u2022 @" +
            "<br> &ensp; \u2022 One or more letters" +
            "<br> &ensp; \u2022 One period" +
            "<br> &ensp; \u2022 Two or 3 ending letters (i.e. com, co, en, etc.)" +
            "<br> &ensp;  Example: example@email.com")]
        //[EmailAddress]
        public string email { get; set; }
        public int emailValid = 0;

    }
}