#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

extern int __ecereVMethodID_class_OnGetString;

static String countryNames[CountryCode] =
{
   "(none)",
   "Andorra", // 1974	
   "United Arab Emirates", // 1974	
   "Afghanistan", // 1974	
   "Antigua and Barbuda", // 1974	
   "Anguilla", // 1983	AI previously represented French Afar and Issas
   "Albania", // 1974	
   "Armenia", // 1992	
   "Netherlands Antilles", // 1974	
   "Angola", // 1974	
   "Antarctica", // 1974	Covers the territories south of 60° south latitude
   "Argentina", // 1974	
   "American Samoa", // 1974	
   "Austria", // 1974	
   "Australia", // 1974	Includes the Ashmore and Cartier Islands and the Coral Sea Islands
   "Aruba", // 1986	
   "Åland Islands", //	2004	
   "Azerbaijan", // 1992	
   "Bosnia and Herzegovina", // 1992	
   "Barbados", // 1974	
   "Bangladesh", // 1974	
   "Belgium", // 1974	
   "Burkina Faso", // 1984	Name changed from Upper Volta (HV)
   "Bulgaria", // 1974	
   "Bahrain", // 1974	
   "Burundi", // 1974	
   "Benin", // 1977	Name changed from Dahomey (DY)
   "Saint Barthélemy", //	2007	
   "Bermuda", // 1974	
   "Brunei Darussalam", // 1974	
   "Bolivia, Plurinational State of", // 1974	Previous country name used by ISO: Bolivia
   "Brazil", // 1974	
   "Bahamas", // 1974	
   "Bhutan", // 1974	
   "Bouvet Island", // 1974	
   "Botswana", // 1974	
   "Belarus", // 1974	Code taken from previous country name used by ISO: Byelorussian SSR
   "Belize", // 1974	
   "Canada", // 1974	
   "Cocos (Keeling) Islands", // 1974	
   "Congo, the Democratic Republic of the", // 1997	Name changed from Zaire (ZR)
   "Central African Republic", // 1974	
   "Congo", // 1974	i.e., Congo, the Republic of the
   "Switzerland", // 1974	Code taken from name in Latin: Confoederatio Helvetica
   "Côte d'Ivoire", // 1974	i.e., Ivory Coast
   "Cook Islands", // 1974	
   "Chile", // 1974	
   "Cameroon", // 1974	
   "China", // 1974	
   "Colombia", // 1974	
   "Costa Rica", // 1974	
   "Cuba", // 1974	
   "Cape Verde", // 1974	
   "Christmas Island", // 1974	
   "Cyprus", // 1974	
   "Czech Republic", // 1993	
   "Germany", // 1974	Code taken from name in German: Deutschland, Code used for West Germany before , // 1990 (previous country name used by ISO: Germany, Federal Republic of)
   "Djibouti", // 1977	Name changed from French Afar and Issas (AI)
   "Denmark", // 1974	
   "Dominica", // 1974	
   "Dominican Republic", // 1974	
   "Algeria", // 1974	Code taken from name in Kabyle: Dzayer
   "Ecuador", // 1974	
   "Estonia", // 1992	Code taken from name in Estonian: Eesti
   "Egypt", // 1974	
   "Western Sahara", // 1974	Disputed territory Previous country name used by ISO: Spanish Sahara (code taken from name in Spanish: Sahara español)
   "Eritrea", // 1993	
   "Spain", // 1974	Code taken from name in Spanish: España
   "Ethiopia", // 1974	
   "Finland", // 1974	
   "Fiji", // 1974	
   "Falkland Islands (Malvinas)", // 1974	
   "Micronesia, Federated States of", // 1986	Previous country name used by ISO: Micronesia
   "Faroe Islands", // 1974	
   "France", // 1974	Includes Clipperton Island
   "Gabon", // 1974	
   "United Kingdom", // 1974	Code taken from official name: United Kingdom of Great Britain and Northern Ireland
   "Grenada", // 1974	
   "Georgia", // 1992	GE previously represented Gilbert and Ellice Islands
   "French Guiana", // 1974	Code taken from name in French: Guyane française
   "Guernsey", //	2006	
   "Ghana", // 1974	
   "Gibraltar", // 1974	
   "Greenland", // 1974	
   "Gambia", // 1974	
   "Guinea", // 1974	
   "Guadeloupe", // 1974	
   "Equatorial Guinea", // 1974	Code taken from name in French: Guinée équatoriale
   "Greece", // 1974	
   "South Georgia and the South Sandwich Islands", // 1993	
   "Guatemala", // 1974	
   "Guam", // 1974	
   "Guinea-Bissau", // 1974	
   "Guyana", // 1974	
   "Hong Kong", // 1974	
   "Heard Island and McDonald Islands", // 1974	
   "Honduras", // 1974	
   "Croatia", // 1992	Code taken from name in Croatian: Hrvatska
   "Haiti", // 1974	
   "Hungary", // 1974	
   "Indonesia", // 1974	
   "Ireland", // 1974	
   "Israel", // 1974	
   "Isle of Man", //	2006	
   "India", // 1974	
   "British Indian Ocean Territory", // 1974	
   "Iraq", // 1974	
   "Iran, Islamic Republic of", // 1974	
   "Iceland", // 1974	Code taken from name in Icelandic: Ísland
   "Italy", // 1974	
   "Jersey", //	2006	
   "Jamaica", // 1974	
   "Jordan", // 1974	
   "Japan", // 1974	
   "Kenya", // 1974	
   "Kyrgyzstan", // 1992	
   "Cambodia", // 1974	Code taken from former name: Khmer Republic, Previous country name used by ISO: Kampuchea
   "Kiribati", // 1979	
   "Comoros", // 1974	Code taken from name in Comorian: Komori
   "Saint Kitts and Nevis", // 1974	Previous country name used by ISO: Saint Kitts-Nevis-Anguilla
   "Korea, Democratic People's Republic of", // 1974	i.e., North Korea
   "Korea, Republic of", // 1974	i.e., South Korea
   "Kuwait", // 1974	
   "Cayman Islands", // 1974	
   "Kazakhstan", // 1992	Previous country name used by ISO: Kazakstan
   "Lao People's Democratic Republic", // 1974	
   "Lebanon", // 1974	
   "Saint Lucia", // 1974	
   "Liechtenstein", // 1974	
   "Sri Lanka", // 1974	
   "Liberia", // 1974	
   "Lesotho", // 1974	
   "Lithuania", // 1992	
   "Luxembourg", // 1974	
   "Latvia", // 1992	
   "Libyan Arab Jamahiriya", // 1974	
   "Morocco", // 1974	Code taken from name in French: Maroc
   "Monaco", // 1974	
   "Moldova, Republic of", // 1992	Previous country name used by ISO: Moldova
   "Montenegro",  // 2006	
   "Saint Martin (French part)",	//2007	
   "Madagascar", // 1974	
   "Marshall Islands", // 1986	
   "Macedonia, the former Yugoslav Republic of", // 1993	Designated as such due to the Macedonia naming dispute, Code taken from name in Macedonian: Makedonija
   "Mali", // 1974	
   "Myanmar", // 1989	Name changed from Burma (BU)
   "Mongolia", // 1974	
   "Macao", // 1974	Previous country name used by ISO: Macau
   "Northern Mariana Islands", // 1986	
   "Martinique", // 1974	
   "Mauritania", // 1974	
   "Montserrat", // 1974	
   "Malta", // 1974	
   "Mauritius", // 1974	
   "Maldives", // 1974	
   "Malawi", // 1974	
   "Mexico", // 1974	
   "Malaysia", // 1974	
   "Mozambique", // 1974	
   "Namibia", // 1974	
   "New Caledonia", // 1974	
   "Niger", // 1974	
   "Norfolk Island", // 1974	
   "Nigeria", // 1974	
   "Nicaragua", // 1974	
   "Netherlands", // 1974	
   "Norway", // 1974	
   "Nepal", // 1974	
   "Nauru", // 1974	
   "Niue", // 1974	
   "New Zealand", // 1974	
   "Oman", // 1974	
   "Panama", // 1974	
   "Peru", // 1974	
   "French Polynesia", // 1974	Code taken from name in French: Polynésie française
   "Papua New Guinea", // 1974	
   "Philippines", // 1974	
   "Pakistan", // 1974	
   "Poland", // 1974	
   "Saint Pierre and Miquelon", // 1974	
   "Pitcairn", // 1974	
   "Puerto Rico", // 1974	
   "Palestinian Territory, Occupied", // 1999	Consists of the West Bank and the Gaza Strip
   "Portugal", // 1974	
   "Palau", // 1986	
   "Paraguay", // 1974	
   "Qatar", // 1974	
   "Réunion", // 1974	
   "Romania", // 1974	
   "Serbia", //	2006	Code taken from official name: Republic of Serbia (see Serbian country codes)
   "Russian Federation", // 1992	
   "Rwanda", // 1974	
   "Saudi Arabia", // 1974	
   "Solomon Islands", // 1974	Code taken from former name: British Solomon Islands
   "Seychelles", // 1974	
   "Sudan", // 1974	
   "Sweden", // 1974	
   "Singapore", // 1974	
   "Saint Helena, Ascension and Tristan da Cunha", // 1974	Previous country name used by ISO: Saint Helena
   "Slovenia", // 1992	
   "Svalbard and Jan Mayen", // 1974	Consists of Svalbard and Jan Mayen
   "Slovakia", // 1993	SK previously represented Sikkim
   "Sierra Leone", // 1974	
   "San Marino", // 1974	
   "Senegal", // 1974	
   "Somalia", // 1974	
   "Suriname", // 1974	
   "Sao Tome and Principe", // 1974	
   "El Salvador", // 1974	
   "Syrian Arab Republic", // 1974	
   "Swaziland", // 1974	
   "Turks and Caicos Islands", // 1974	
   "Chad", // 1974	Code taken from name in French: Tchad
   "French Southern Territories", // 1979	Covers the territory of the French Southern and Antarctic Lands except Adélie Land, Code taken from name in French: Terres australes françaises
   "Togo", // 1974	
   "Thailand", // 1974	
   "Tajikistan", // 1992	
   "Tokelau", // 1974	
   "Timor-Leste", //	2002	Name changed from East Timor (TP)
   "Turkmenistan", // 1992	
   "Tunisia", // 1974	
   "Tonga", // 1974	
   "Turkey", // 1974	
   "Trinidad and Tobago", // 1974	
   "Tuvalu", // 1979	
   "Taiwan, Province of China", // 1974	Covers the current jurisdiction of the Republic of China except Kinmen and Lienchiang, Designated as such due to its political status within the United Nations
   "Tanzania, United Republic of", // 1974	
   "Ukraine", // 1974	Previous country name used by ISO: Ukrainian SSR
   "Uganda", // 1974	
   // "United Kingdom",
   "United States Minor Outlying Islands", // 1986	Consists of Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island
   "United States", // 1974	
   "Uruguay", // 1974	
   "Uzbekistan", // 1992	
   "Holy See (Vatican City State)", // 1974	Territory of the Holy See Previous country name used by ISO: Vatican City State (Holy See)
   "Saint Vincent and the Grenadines", // 1974	
   "Venezuela, Bolivarian Republic of", // 1974	Previous country name used by ISO: Venezuela
   "Virgin Islands, British", // 1974	
   "Virgin Islands, U.S.", // 1974	
   "Viet Nam", // 1974	
   "Vanuatu", // 1980	Name changed from New Hebrides (NH)
   "Wallis and Futuna", // 1974	
   "Samoa", // 1974	Code taken from former name: Western Samoa
   "Yemen", // 1974	Previous country name used by ISO: Yemen, Republic of, Code used for North Yemen before 1990
   "Mayotte", // 1993	
   "South Africa", // 1974	Code taken from name in Dutch: Zuid-Afrika
   "Zambia", // 1974	
   "Zimbabwe" // 1980	Name changed from Southern Rhodesia (RH)
};

public class FlagCollection
{
   Array<BitmapResource> flags { };
   public property Window window { set { for(b : flags) { b.window = value; } } };
   FlagCollection()
   {
      CountryCode c;
      flags.size = CountryCode::enumSize;
      for(c = AD; c <= ZW; c++)
      {
         char tmp[10];
         char * s = ((char *(*)())(void *)class(CountryCode).base._vTbl[4])(class(CountryCode), &c, tmp, null, null);
         char fn[MAX_LOCATION];
         strlwr(s);
         sprintf(fn, ":types/countryCode/%s.png", s);
         flags[c] = { fn };
         incref flags[c];
      }      
   }
   ~FlagCollection() { flags.Free(); }
}


static CountryCode firstCountryCode = AD;
static CountryCode lastCountryCode = ZW;
public enum CountryCode
{
   none,
               AD, AE, AF, AG,     AI,         AL, AM, AN, AO,     AQ, AR, AS, AT, AU,     AW, AX,     AZ,
   BA, BB,     BD, BE, BF, BG, BH, BI, BJ,     BL, BM, BN, BO,         BR, BS, BT,     BV, BW,     BY, BZ,
   CA,     CC, CD,     CF, CG, CH, CI,     CK, CL, CM, CN, CO,         CR,         CU, CV,     CX, CY, CZ,
                   DE,                 DJ, DK,     DM,     DO,                                         DZ,
           EC,     EE,     EG, EH,                                     ER, ES, ET,
                                   FI, FJ, FK,     FM,     FO,         FR,
   GA, GB,     GD, GE, GF, GG, GH, GI,         GL, GM, GN,     GP, GQ, GR, GS, GT, GU,     GW,     GY,
                                           HK,     HM, HN,             HR,     HT, HU,
               ID, IE,                         IL, IM, IN, IO,     IQ, IR, IS, IT,
                   JE,                             JM,     JO, JP,
                   KE,     KG, KH, KI,             KM, KN,     KP,     KR,                 KW,     KY, KZ,
   LA, LB, LC,                     LI,     LK,                         LR, LS, LT, LU, LV,         LY,
   MA,     MC, MD, ME, MF, MG, MH,         MK, ML, MM, MN, MO, MP, MQ, MR, MS, MT, MU, MV, MW, MX, MY, MZ,
   NA,     NC,     NE, NF, NG,     NI,         NL,         NO, NP,     NR,         NU,                 NZ,
                                                   OM,
   PA,             PE, PF, PG, PH,         PK, PL, PM, PN,             PR, PS, PT,         PW,     PY,
   QA,
                   RE,                                     RO,             RS,     RU,     RW,
   SA, SB, SC, SD, SE,     SG, SH, SI, SJ, SK, SL, SM, SN, SO,         SR,     ST,     SV,         SY, SZ,
           TC, TD,     TF, TG, TH,     TJ, TK, TL, TM, TN, TO,         TR,     TT,     TV, TW,         TZ,
   UA,                     UG,                     UM,                     US,                     UY, UZ,
   VA,     VC,     VE,     VG,     VI,                 VN,                         VU,
                       WF,                                                 WS,
                   YE,                                                         YT,
   ZA,                                             ZM,                                     ZW            ;

   // TODO: have a way to identify the first and the last value for loops and conditionals
   //static const CountryCode ::first = AD;
   //static const CountryCode ::last = ZW;

   char * OnGetString(char * tempString, void * fieldData, bool * needClass)
   {
      return name;
   }

   void OnDisplay(Surface surface, int x, int y, int width, FlagCollection flagCollection, Alignment alignment, DataDisplayFlags flags)
   {
      Bitmap icon = (this != none && flagCollection) ? flagCollection.flags[this].bitmap : null;
      int w = 8 + 16;
      if(icon)
         surface.Blit(icon, x + (16 - icon.width) / 2,y+2,0,0, icon.width, icon.height);
      class::OnDisplay(surface, x + w, y, width - w, null, alignment, flags);
   }

public:
   property char * { get { char * s = OnGetString(null, null, null); return s; } }
   property char * name { get { return countryNames[this]; } }
   // ATTENTION: allocated memory must be freed by caller
   property char * code
   {
      get
      {
         char * tmp = /*tempString ? tempString : */new char[4];
         tmp[0] = '\0';
         if(this >= firstCountryCode && this <= lastCountryCode)
         // if(this > none && this < CountryCode::enumSize) // TOCHECK: CountryCode.ec:338:21: error: couldn't find member enumSize in class CountryCode
            ((char *(*)())(void *)class(CountryCode).base._vTbl[__ecereVMethodID_class_OnGetString])(class(CountryCode), &this, tmp, null, null);
         return tmp;
      }
   }
};

static String subdivisionCategoryNames[SubdivisionCategory] = 
{
   "(none)",
   "Administration", "Metropolitan Administration",
   "Area", "Council Area", "District Council Area", "Pakistan Administered Area",
   "Administrative Atoll",
   "Special Island Authority", "Unitary Authority",
   "Canton",
   "Capital",
   "Chain Of Islands",
   "City", "City Corporation", "City Of County Right", "Autonomous City", "Capital City",
      "Capital Metropolitan City", "Metropolitan City", "Special City", "Special Administrative City",
   "Overseas Territorial Collectivity",
   "Commune",
   "Autonomous Community", "Urban Community",
   "Island Council", "Local Council", "TownCouncil",
   "Country"/* ??? */,
   "County", "Two Tier County",
   "Department", "Metropolitan Department", "Overseas Region Department",
   "Dependency", "Federal Dependency",
   "District", "Autonomous District", "Capital District", "Federal District", "Metropolitan District",
      "Special District",
   "Division",
   "Emirate",
   "Entity",
   "Governorates"/* with an s? */,
   "Island", "Islands Group"/* with an s? */,
   "Federal Land",
   "London Borough",
   "Municipality", "Special Municipality",
   "Oblasts"/* with an s? */,
   "Parish",
   "Self Governed Part",
   "Popularate",
   "Prefecture", "Economic Prefecture",
   "Principality",
   "Province", "Autonomous Province", "Constitutional Province",
   "Quarters"/* with an s? */,
   "Rayon",
   "Region", "Administrative Region", "Autonomous Region", "Development Region", "Geographical Region",
      "Indigenous Region", "Metropolitan Region", "Special Administrative Region", "Special Region",
   "Republic", "Autonomous Republic",
   "Autonomous Sector",
   "State",
   "Territory", "Administrative Territory", "Federal Territory", "Federal Capital Territory",
      "Outlying Territory", "Union Territory",
   "Zone", "Special Zone",
   "Territorial Unit", "Autonomous Territorial Unit"
};

public enum SubdivisionCategory
{
   none,
   administration, metropolitanAdministration,
   area, councilArea, districtCouncilArea, pakistanAdministeredArea,
   administrativeAtoll,
   specialIslandAuthority, unitaryAuthority,
   canton,
   capital,
   chain/* of islands */,
   city, cityCorporation, cityOfCountyRight, autonomousCity, capitalCity,
      capitalMetropolitanCity, metropolitanCity, specialCity, specialAdministrativeCity,
   overseasTerritorialCollectivity,
   commune,
   autonomousCommunity, urbanCommunity,
   islandCouncil, localCouncil, townCouncil,
   country,
   county, twoTierCounty,
   department, metropolitanDepartment, overseasRegionDepartment,
   dependency, federalDependency,
   district, autonomousDistrict, capitalDistrict, federalDistrict, metropolitanDistrict,
      specialDistrict,
   division,
   emirate,
   entity,
   governorates,
   island, islandsGroup,
   federalLand,
   londonBorough,
   municipality, specialMunicipality,
   oblasts,
   parish,
   selfGovernedPart,
   popularate,
   prefecture, economicPrefecture,
   principality,
   province, autonomousProvince, constitutionalProvince,
   quarters,
   rayon,
   region, administrativeRegion, autonomousRegion, developmentRegion, geographicalRegion,
      indigenousRegion, metropolitanRegion, specialAdministrativeRegion, specialRegion,
   republic, autonomousRepublic,
   autonomousSector,
   state,
   territory, administrativeTerritory, federalTerritory, federalCapitalTerritory,
      outlyingTerritory, unionTerritory,
   zone, specialZone,
   territorialUnit, autonomousTerritorialUnit;

public:
   property char * name { get { return subdivisionCategoryNames[this]; } }
};

static String caSubdivisionNames[CASubdivisionCode] =
{
   "(none)",
   "Alberta",
   "British Columbia",
   "Manitoba",
   "New Brunswick",
   "Newfoundland and Labrador",
   "Nova Scotia",
   "Ontario",
   "Prince Edward Island",
   "Quebec",
   "Saskatchewan",
   "Northwest Territories",
   "Nunavut",
   "Yukon"
};
static SubdivisionCategory caSubdivisionCategories[CASubdivisionCode] =
{
   none, province, province, province, province, province, province, province, province, province, province, territory, territory, territory
};
static CASubdivisionCode firstCASubdivisionCode = AB;
static CASubdivisionCode lastCASubdivisionCode = YT;
public enum CASubdivisionCode
{
   none, AB, BC, MB, NB, NL, NS, ON, PE, QC, SK, NT, NU, YT;

   char * OnGetString(char * tempString, void * fieldData, bool * needClass)
   {
      return name;
   }

public:
   property char * { get { char * s = OnGetString(null, null, null); return s; } }
   // ATTENTION: allocated memory must be freed by caller
   property char * completeCode { get { return PrintString(CountryCode::CA, "-", this); } }
   property char * name { get { return caSubdivisionNames[this]; } }
   // ATTENTION: allocated memory must be freed by caller
   property char * code
   {
      get
      {
         char * tmp = /*tempString ? tempString : */new char[4];
         tmp[0] = '\0';
         // if(this > none && this < CASubdivisionCode::enumSize) // TOCHECK: CountryCode.ec:497:36: error: couldn't find member enumSize in class CASubdivisionCode
         if(this >= firstCASubdivisionCode && this <= lastCASubdivisionCode)
            ((char *(*)())(void *)class(CASubdivisionCode).base._vTbl[__ecereVMethodID_class_OnGetString])(class(CASubdivisionCode), &this, tmp, null, null);
         return tmp;
      }
   }
   property SubdivisionCategory category { get { return caSubdivisionCategories[this]; } }
   // TODO: OnDisplay and flag resources
};

static String usSubdivisionNames[USSubdivisionCode] =
{
   "(none)",
   "Alaska",
   "Alabama",
   "Arkansas",
   "American Samoa",
   "Arizona",
   "California",
   "Colorado",
   "Connecticut",
   "District of Columbia",
   "Delaware",
   "Florida",
   "Georgia",
   "Guam",
   "Hawaii",
   "Iowa",
   "Idaho",
   "Illinois",
   "Indiana",
   "Kansas",
   "Kentucky",
   "Louisiana",
   "Massachusetts",
   "Maryland",
   "Maine",
   "Michigan",
   "Minnesota",
   "Missouri",
   "Northern Mariana Islands",
   "Mississippi",
   "Montana",
   "North Carolina",
   "North Dakota",
   "Nebraska",
   "New Hampshire",
   "New Jersey",
   "New Mexico",
   "Nevada",
   "New York",
   "Ohio",
   "Oklahoma",
   "Oregon",
   "Pennsylvania",
   "Puerto Rico",
   "Rhode Island",
   "South Carolina",
   "South Dakota",
   "Tennessee",
   "Texas",
   "United States Minor Outlying Islands",
   "Utah",
   "Virginia",
   "Virgin Islands, U.S.",
   "Vermont",
   "Washington",
   "Wisconsin",
   "West Virginia",
   "Wyoming"
};
static SubdivisionCategory usSubdivisionCategories[USSubdivisionCode] =
{
   none,
   state, state, state, outlyingTerritory, state, state, state, state, district, state, state, state, outlyingTerritory, state, state, state,
   state, state, state, state, state, state, state, state, state, state, state, outlyingTerritory, state, state, state, state,
   state, state, state, state, state, state, state, state, state, state, outlyingTerritory, state, state, state, state, state,
   outlyingTerritory, state, state, outlyingTerritory, state, state, state, state, state
};
static USSubdivisionCode firstUSSubdivisionCode = AK;
static USSubdivisionCode lastUSSubdivisionCode = WY;
public enum USSubdivisionCode
{
   none,
   AK, AL, AR, AS, AZ, CA, CO, CT, DC, DE, FL, GA, GU, HI, IA, ID,
   IL, IN, KS, KY, LA, MA, MD, ME, MI, MN, MO, MP, MS, MT, NC, ND,
   NE, NH, NJ, NM, NV, NY, OH, OK, OR, PA, PR, RI, SC, SD, TN, TX,
   UM, UT, VA, VI, VT, WA, WI, WV, WY;

   char * OnGetString(char * tempString, void * fieldData, bool * needClass)
   {
      return name;
   }

public:
   property char * { get { char * s = OnGetString(null, null, null); return s; } }
   // ATTENTION: allocated memory must be freed by caller
   property char * completeCode { get { return PrintString(CountryCode::US, "-", this); } }
   property char * name { get { return usSubdivisionNames[this]; } }
   // ATTENTION: allocated memory must be freed by caller
   property char * code
   {
      get
      {
         char * tmp = /*tempString ? tempString : */new char[4];
         tmp[0] = '\0';
         // if(this > none && this < USSubdivisionCode::enumSize) // TOCHECK: CountryCode.ec:603:35: error: couldn't find member enumSize in class USSubdivisionCode
         if(this >= firstUSSubdivisionCode && this <= lastUSSubdivisionCode)
            ((char *(*)())(void *)class(USSubdivisionCode).base._vTbl[__ecereVMethodID_class_OnGetString])(class(USSubdivisionCode), &this, tmp, null, null);
         return tmp;
      }
   }
   property SubdivisionCategory category { get { return usSubdivisionCategories[this]; } }
   // TODO: OnDisplay and flag resources
};

