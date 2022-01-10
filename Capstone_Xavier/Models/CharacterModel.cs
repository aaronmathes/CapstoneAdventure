

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
        [StringLength(20, MinimumLength = 4, ErrorMessage = "Character name must be at least 4 and no more than 20 characters long.")]
        [RegularExpression(@"^[a-zA-Z0-9_-+()]{4,20}$", ErrorMessage = "Character name cannot contain spaces or special characters")]
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