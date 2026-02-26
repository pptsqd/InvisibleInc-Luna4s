return {

OPTIONS = {
    ONFILE = "ONFILE LUNA",
    ARCHIVE = "ARCHIVE LUNA",
    ONFILE_TIP = [[<c:FF8411>ONFILE LUNA</c>
Adds Luna4s (On-File) to rescueable agents.]],
    ARCHIVE_TIP = [[<c:FF8411>ARCHIVE LUNA</c>
Adds Luna4s (Archive) to rescueable agents.]],
},

ITEMS = {
    AUG_CLOAK = "Refraction Cloak",
    AUG_CLOAK_TIP = "Renders the user invisible until out of charge. Gains charge when looting a guard or safe. Loses charge in use when moving or ending turn.",
    AUG_CLOAK_FLAVOR = "This rig quickly burns through the same dispensable components as found in credit cards.",
},

REASON = {
    SHINY_CHARGES = "OUT OF CHARGES. STEAL SHINY.",
},

ABILITIES = {
    UNCLOAK = "Pause Cloak",
    CLOAK_DESC = "Any currently active cloaks will end. Does not trigger augments.",
    CHROMAKEY = "Chroma Key",
},

-- TOOLTIPS = {
--     HOOT = "HOOT",
--     HOOT_DESC = "Hoot."
-- },

AGENT = {
    NAME = "Luna",
    FULLNAME = "Luna Owl",
    FILE = "FILE #00-083695A-49827523",
    YEARS_OF_SERVICE = "2",
    HOMETOWN = "Amsterdam",
    RESCUED = "Hoot.",
    BIO_SPOKEN = "", -- unused (unless we hire Veena again)

    ALT_1 = {
        AGE = "32",
        BIO = "Please write your very own self-insert fanfic here, Luna.",
        TOOLTIP = "Cute Owl",
    },
    ALT_2 = {
        CODENAME = "ARCHIVED -- PIRATE",
        AGE = "26",
        BIO = "",
        TOOLTIP = "Cute Pirate",
    },

    BANTER = {
        START = {
            "Hoot.",
        },
        FINAL_WORDS =
        {
            "Hoot.",
        },
    },
},

TRANSISTOR = {
    NAME = "Stream()",
    DESC = "Hoot.",
    SHORT_DESC = "Hoot",
    ACTIVE_DESC = "HOOT",
},

}