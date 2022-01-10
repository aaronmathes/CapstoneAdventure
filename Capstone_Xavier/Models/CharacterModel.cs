

namespace Capstone_Xavier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Linq;
    using System.Web;

    public class CharacterModel:BaseModel
    {
        public int id { get; set; }
        public int userID { get; set; }
        [Required]
        
        [RegularExpression(@"^[a-zA-Z0-9_\-+()]{4,20}$", ErrorMessage = "Character must be between 4 & 20 characters and not contain special characters or spaces")]
        public string name { get; set; }
        public int classID { get; set; }
        public string className { get; set; }
        public int classArmor { get; set; }
        public int location { get; set; }
        public string locationName { get; set; }
        public int gold { get; set; }
        public int level { get; set; }
        public int xp { get; set; }
        public int health { get; set; }
        public int maxHP { get; set; }
        public int maxXp { get; set; }
        public int armor { get; set; }
        public int damage { get; set; }
        public int stamina { get; set; }
        public int magica { get; set; }
        public List<ClassModel> classes = new List<ClassModel>();


    }
}