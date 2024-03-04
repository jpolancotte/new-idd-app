namespace :db do
    namespace :seed do
      desc "Seed default state data"
        task orgs: :environment do
          orgs=[
  {
    "name": "Ralph Scott Lifeservices, Inc."
  },
  {
    "name": "Residential Treatment Services of Alamance, Inc."
  },
  {
    "name": "L & J Homes, Inc."
  },
  {
    "name": "Cozie's Supervised Living, Inc."
  },
  {
    "name": "Sheila C. Smith"
  },
  {
    "name": "Faiger Blackwell"
  },
  {
    "name": "Curtis E. Torain"
  },
  {
    "name": "Falcon Crest Residential Care Inc."
  },
  {
    "name": "Byron White"
  },
  {
    "name": "Todd Lewis Curry"
  },
  {
    "name": "Pamela A. Talley"
  },
  {
    "name": "Clara Yancey and Cherry Crisp"
  },
  {
    "name": "Clara S. Yancey"
  },
  {
    "name": "Genesis Residential Care Center, LLC"
  },
  {
    "name": "Just In Time Youth Services"
  },
  {
    "name": "Youth Builders, LLC"
  },
  {
    "name": "New Possibilities Home for Children, LLC"
  },
  {
    "name": "Cherry S. Crisp"
  },
  {
    "name": "All God's Children of Burlington, LLC"
  },
  {
    "name": "New Dimensions Interventions, Inc."
  },
  {
    "name": "New Dimensions Intervention, Inc."
  },
  {
    "name": "The Sharpe Road Adult Home Care, LLC"
  },
  {
    "name": "Blackwell's Community Living, LLC"
  },
  {
    "name": "Ceesons of Change, LLC"
  },
  {
    "name": "Vision of Therapeutic Development, Inc."
  },
  {
    "name": "Solutions Community Support Agency, LLC"
  },
  {
    "name": "Garnetta Enoch"
  },
  {
    "name": "Timmy Rogers and Jan Simpson Rogers"
  },
  {
    "name": "Rouse's Group Home II, Inc."
  },
  {
    "name": "Green Valley Haven, LLC"
  },
  {
    "name": "Murphy's Group Home LLC"
  },
  {
    "name": "Changing Lives Family Care Home, LLC"
  },
  {
    "name": "Alamance Home, LLC"
  },
  {
    "name": "Quality Care First Inc."
  },
  {
    "name": "Universal Mental Health Services, Inc."
  },
  {
    "name": "Lillies Place #2, Inc."
  },
  {
    "name": "R & S Independent Health Services, Inc."
  },
  {
    "name": "Gwendolyn C. Mebane"
  },
  {
    "name": "Legacy Living Center"
  },
  {
    "name": "Creative Directions, Inc."
  },
  {
    "name": "Garnetta Enoch McAdams"
  },
  {
    "name": "Always Love Group Home, LLC"
  },
  {
    "name": "House of Care, Inc."
  },
  {
    "name": "Creatively Renewed Living, LLC"
  },
  {
    "name": "Paul's Loving Care, Inc."
  },
  {
    "name": "Abundant Care Homes, LLC"
  },
  {
    "name": "House of Love of Alamance, Co"
  },
  {
    "name": "House of Hope II LLC"
  },
  {
    "name": "A Mother's Love L.L.C."
  },
  {
    "name": "Creative Directions, Inc"
  },
  {
    "name": "ComServ, Inc."
  },
  {
    "name": "VOCA Corporation of North Carolina"
  },
  {
    "name": "Luca's Hope, LLC"
  },
  {
    "name": "Abound Health, LLC"
  },
  {
    "name": "Julius Williams"
  },
  {
    "name": "New River Cottage, Inc."
  },
  {
    "name": "Alleghany County Group Homes, Inc."
  },
  {
    "name": "Summit Support Services of Ashe, Inc."
  },
  {
    "name": "Monarch"
  },
  {
    "name": "Cornerstone Treatment Facility, Inc."
  },
  {
    "name": "Easter Seals UCP North Carolina & Virginia, Inc."
  },
  {
    "name": "Community Alternatives NC"
  },
  {
    "name": "Community Alternatives of North Carolina"
  },
  {
    "name": "Avery Asso. For Exceptional Citizens, Inc."
  },
  {
    "name": "LIFE, Inc."
  },
  {
    "name": "Beaufort County Developmental Center, Inc."
  },
  {
    "name": "Country Living Guest Home, Inc."
  },
  {
    "name": "PORT Health Services"
  },
  {
    "name": "Country Living Guest Home, Inc"
  },
  {
    "name": "Solid Foundation Facilities, Inc."
  },
  {
    "name": "Community Innovations, Inc."
  },
  {
    "name": "Carolinas Home Care Agency, Inc."
  },
  {
    "name": "Focus-NC, LLC"
  },
  {
    "name": "Sheri Benya"
  },
  {
    "name": "HomeCare Management Corporation"
  },
  {
    "name": "First Step Farm of Western N.C., Inc."
  },
  {
    "name": "BlueWest Opportunities, Inc."
  },
  {
    "name": "Irene Wortham Residential Center, Inc."
  },
  {
    "name": "Mountain Area Residential Facilities, Inc."
  },
  {
    "name": "UMAR Services, Inc."
  },
  {
    "name": "Liberty Corner Enterprises, Inc."
  },
  {
    "name": "Summerland Homes, Inc."
  },
  {
    "name": "Eliada Homes, Inc."
  },
  {
    "name": "Davidson Homes, Inc."
  },
  {
    "name": "Autism Society of North Carolina, Inc."
  },
  {
    "name": "FIRST at Blue Ridge, Inc."
  },
  {
    "name": "Tender Loving Care Home"
  },
  {
    "name": "Universal MH/DD/SAS"
  },
  {
    "name": "CooperRiis, Inc."
  },
  {
    "name": "North Carolina Outreach Home Care, LLC"
  },
  {
    "name": "Steps for Success Family Services, LLC"
  },
  {
    "name": "New York Homes Residential Care Center, LLC"
  },
  {
    "name": "dba Community Alternatives of North Carolina"
  },
  {
    "name": "Mountain Area Community Services, Inc."
  },
  {
    "name": "Rebecca Shaw"
  },
  {
    "name": "Wilderness Training & Consulting, LLC"
  },
  {
    "name": "Skill Creations, Inc."
  },
  {
    "name": "Brandi Nichole Family Enrichment Center, Inc."
  },
  {
    "name": "Daymark Recovery Services, Inc."
  },
  {
    "name": "Reach for Independence, Inc."
  },
  {
    "name": "Community Companion Home Care, LLC"
  },
  {
    "name": "Asheville Detox, LLC"
  },
  {
    "name": "North Carolina Outreach Group Homes, LLC"
  },
  {
    "name": "Eliada Homes, Inc"
  },
  {
    "name": "The Kids Workshop, Inc"
  },
  {
    "name": "Tonia Carpenter Donnell"
  },
  {
    "name": "VOCA Corporation of NC dba Community Alternatives-NC 1"
  },
  {
    "name": "The Enola Group, Inc."
  },
  {
    "name": "Burke Council on Alcoholism & Chemical Dependency, Inc."
  },
  {
    "name": "FOCUS Behavioral Health Services, LLC"
  },
  {
    "name": "Dream Connections, Inc."
  },
  {
    "name": "Piedmont Residential Developmental Center, Inc."
  },
  {
    "name": "Piedmont Residential Development Center, Inc."
  },
  {
    "name": "Cabarrus County Group Homes, Inc."
  },
  {
    "name": "Newpath Youth Services, Inc."
  },
  {
    "name": "Unique Caring Network, Inc."
  },
  {
    "name": "The Unique Caring Network, Inc."
  },
  {
    "name": "Carewell of Charlotte, Inc."
  },
  {
    "name": "A Place of My Own, LLC"
  },
  {
    "name": "A World of Opportunity, LLC"
  },
  {
    "name": "The Kid's Workshop, Inc."
  },
  {
    "name": "Hinton's Group Home, LLC"
  },
  {
    "name": "Turning Point Homes, LLC"
  },
  {
    "name": "Com-Serv, Inc."
  },
  {
    "name": "Renewed Services, Inc."
  },
  {
    "name": "Comserv, Inc"
  },
  {
    "name": "United Support Services, Inc."
  },
  {
    "name": "Levan Place"
  },
  {
    "name": "Ruths Cove"
  },
  {
    "name": "David A. Humphrey"
  },
  {
    "name": "Catawba Valley Behavioral Healthcare"
  },
  {
    "name": "InReach"
  },
  {
    "name": "University of North Carolina at Chapel Hill"
  },
  {
    "name": "Chatham County Group Homes, Inc."
  },
  {
    "name": "CRC ED Treatment, LLC"
  },
  {
    "name": "Frankie Baldwin"
  },
  {
    "name": "Truly Blessed Residential, LLC"
  },
  {
    "name": "Sharpe and Williams"
  },
  {
    "name": "ARC Cherokee/Clay, Inc."
  },
  {
    "name": "ARC-Cherokee/Clay County, Inc."
  },
  {
    "name": "Cathy Davidson"
  },
  {
    "name": "Autumn Halls of Unaka, LLC"
  },
  {
    "name": "Pathways for the Future, Inc."
  },
  {
    "name": "LIFESPAN, Inc."
  },
  {
    "name": "NCG Acquisition, LLC"
  },
  {
    "name": "One on One Care Inc."
  },
  {
    "name": "Educare Community Living Corporation - North Carolina"
  },
  {
    "name": "Phoenix Counseling Center"
  },
  {
    "name": "One on One Care, Inc."
  },
  {
    "name": "Recovery Foundations, LLC"
  },
  {
    "name": "Voca Corp of N.C. dba Community Alternatives"
  },
  {
    "name": "RE Health Group, LLC"
  },
  {
    "name": "Covenant Case Management Services, LLC"
  },
  {
    "name": "Hughes Behavioral and Mental Health Services, Inc."
  },
  {
    "name": "Boundless Miracles, LLC"
  },
  {
    "name": "The Unique Caring Network, Inc"
  },
  {
    "name": "H.O.P.E. United Helping Others Progressively Excel, Inc"
  },
  {
    "name": "The Asbury Homes, Inc."
  },
  {
    "name": "Carolinas Home Care Agency Inc."
  },
  {
    "name": "Life Changing Behavioral Health Services, LLC"
  },
  {
    "name": "Carolyn Turner"
  },
  {
    "name": "Cleatrice Campbell"
  },
  {
    "name": "Harriett Amos"
  },
  {
    "name": "Angela B. Wright"
  },
  {
    "name": "Myrover-Reese Fellowship Homes, Inc."
  },
  {
    "name": "Mid State Health Services, Inc."
  },
  {
    "name": "Sophia B. Pierce & Associates, Inc."
  },
  {
    "name": "Cumberland Residential & Employment Services & Training"
  },
  {
    "name": "Spigner Management Systems, Inc."
  },
  {
    "name": "Precious Haven, Inc"
  },
  {
    "name": "S&T We Care"
  },
  {
    "name": "United Residential Services of N. C. Inc."
  },
  {
    "name": "Pearl's Angel Care, Inc."
  },
  {
    "name": "Lucy Sharp"
  },
  {
    "name": "The Loving Home, Inc."
  },
  {
    "name": "Sunlight Behavior Center, Inc."
  },
  {
    "name": "Rainbow of Sunshine, Inc."
  },
  {
    "name": "ShineLight, Inc."
  },
  {
    "name": "Fresh Start Residential Facility, Inc."
  },
  {
    "name": "D & L Health Care Services, Incorporated"
  },
  {
    "name": "Willa Dean McNeill"
  },
  {
    "name": "Elite Care Service, Inc."
  },
  {
    "name": "United Residential Services of North Carolina, Inc."
  },
  {
    "name": "The Loving Home, Incorporated"
  },
  {
    "name": "Serenity Therapeutic Services, Inc."
  },
  {
    "name": "Unity Home Care, Inc."
  },
  {
    "name": "Precious Haven, Inc."
  },
  {
    "name": "Professional Family Care Services, Inc."
  },
  {
    "name": "PTP-Lisbon, Inc."
  },
  {
    "name": "Upward Process, Inc."
  },
  {
    "name": "Above & Beyond Care, Inc."
  },
  {
    "name": "Carter Clinic, P.A."
  },
  {
    "name": "S & T WeCare Inc."
  },
  {
    "name": "Mac Bill Inc."
  },
  {
    "name": "Community Alternative Housing, Inc."
  },
  {
    "name": "Edwards Group Home V, Inc."
  },
  {
    "name": "Excel Care Agency Incorporated"
  },
  {
    "name": "Sophia B. Pierce & Associates, Incorporated"
  },
  {
    "name": "Brockett Investments, LLC"
  },
  {
    "name": "Heartfelt Homes of the Carolinas LLC"
  },
  {
    "name": "Mid-State Health Systems, Inc"
  },
  {
    "name": "Serenity Therapeutic Services, Inc"
  },
  {
    "name": "Viringia's Group Home LLC"
  },
  {
    "name": "Thompson Child & Family Focus"
  },
  {
    "name": "Above & Beyond Care, Inc"
  },
  {
    "name": "Brothers Helping Hand of N.C., Inc"
  },
  {
    "name": "Path of Hope, Inc."
  },
  {
    "name": "The Workshop of Davidson Group Homes, Inc."
  },
  {
    "name": "The ARC of Davidson County, Inc."
  },
  {
    "name": "Ambleside, Inc."
  },
  {
    "name": "Dream Makers Assisted Living Services, LLC"
  },
  {
    "name": "Omni Visions, Inc."
  },
  {
    "name": "Macs Village LLC"
  },
  {
    "name": "WesCare Professional Services, LLC"
  },
  {
    "name": "Hands LLC of Rowan"
  },
  {
    "name": "Brownstone Family, LLC"
  },
  {
    "name": "Macs Village LLC Phase II"
  },
  {
    "name": "Still Family, LLC"
  },
  {
    "name": "IMPACT of the Piedmont, Inc"
  },
  {
    "name": "Duplin Sampson Group Homes, Inc."
  },
  {
    "name": "Peace Healthcare Inc."
  },
  {
    "name": "The Keywest Center, Inc."
  },
  {
    "name": "Autism Services, Inc."
  },
  {
    "name": "P.H.P. of N.C., Inc."
  },
  {
    "name": "Devereux Residential Services, LLC"
  },
  {
    "name": "Comprehensive Community Care, Inc."
  },
  {
    "name": "Durham County Community Living Programs, Inc."
  },
  {
    "name": "Carol Johnson"
  },
  {
    "name": "Freedom House Recovery Center, Inc."
  },
  {
    "name": "P.H.P. of N.C. Inc."
  },
  {
    "name": "Hattie Joann Dunham"
  },
  {
    "name": "Triangle Residential Options for Substance Abusers, Inc"
  },
  {
    "name": "Triangle Residential Options for Substance Abusers, In"
  },
  {
    "name": "Derik Lee Abney"
  },
  {
    "name": "Rose's Castle Residential Services, Inc."
  },
  {
    "name": "Jennifer Williams"
  },
  {
    "name": "Destiny Home, Inc."
  },
  {
    "name": "Community Alternatives, Inc."
  },
  {
    "name": "Ben Ouma Nyabwa"
  },
  {
    "name": "Donald E. Brown, Sr."
  },
  {
    "name": "Hazel Clinkscales/ Hattie Carrington"
  },
  {
    "name": "Break Out, LLC"
  },
  {
    "name": "Michael's Place, Inc."
  },
  {
    "name": "Bridging the Gap Residential Services, LLC"
  },
  {
    "name": "Melody House, LLC"
  },
  {
    "name": "Securing Resources for Consumers, Inc."
  },
  {
    "name": "Sonja R Hazelwood"
  },
  {
    "name": "Fayetteville Street Community Living Home, LLC"
  },
  {
    "name": "RoShaun Williams"
  },
  {
    "name": "Destiny Pursuits, Inc."
  },
  {
    "name": "Caring Hands & Supplementary Enrichment Education, LLC"
  },
  {
    "name": "Enhancement Health Care, Inc."
  },
  {
    "name": "Gloria Clemens"
  },
  {
    "name": "Easter Seals UCP North Carolina and Virginia, Inc."
  },
  {
    "name": "Changing Lives Enrichment Center Inc."
  },
  {
    "name": "Elspeth V. Walker and Joseph T. Walker"
  },
  {
    "name": "Recovery Connections of Durham, Inc."
  },
  {
    "name": "Alberta Professional Services, Inc."
  },
  {
    "name": "PHP of NC, Inc."
  },
  {
    "name": "Recovery Innovations, Inc./DBA RI International"
  },
  {
    "name": "Absolute Home & Community Services, Inc."
  },
  {
    "name": "Dedove Homes, Inc."
  },
  {
    "name": "Lutheran Family Services in the Carolinas"
  },
  {
    "name": "Tower of Blessing A Refuge To Seek, Inc"
  },
  {
    "name": "Caring Hands and Supplementary Enrichment Education LLC"
  },
  {
    "name": "United Support Services, Inc"
  },
  {
    "name": "Alpha Management Services, Inc"
  },
  {
    "name": "Better Days Ahead of Rocky Mount Inc."
  },
  {
    "name": "Someone Does Care, LLC"
  },
  {
    "name": "Yvonne Williams"
  },
  {
    "name": "Albert Telfair and Debbie Telfair"
  },
  {
    "name": "Tracy Sherrod"
  },
  {
    "name": "Almarch Family Care, LLC"
  },
  {
    "name": "Michael's Angels Home of Healing, LLC"
  },
  {
    "name": "Quality Care Solutions, Inc."
  },
  {
    "name": "A Caring Hand, Inc."
  },
  {
    "name": "Better Days Ahead of Rocky Mount Inc"
  },
  {
    "name": "DA-Queens's Home, LLC"
  },
  {
    "name": "Addiction Recovery Care Association, Inc."
  },
  {
    "name": "The Fellowship Home, Inc."
  },
  {
    "name": "Horizons Residential Care Center, Inc."
  },
  {
    "name": "YWCA of  Winston-Salem and Forsyth County, Inc."
  },
  {
    "name": "Educare Community Living Corporation-North Carolina"
  },
  {
    "name": "Baptist Children's Home of NC, Inc. - DD Ministry"
  },
  {
    "name": "Baptist Children's Homes of NC, Inc. - DD Ministry"
  },
  {
    "name": "Community Assisted Residential Environment, LLC"
  },
  {
    "name": "Wilson's Constant Care, LLC"
  },
  {
    "name": "A Sure House, Inc."
  },
  {
    "name": "Multi-Therapeutic Services, Inc."
  },
  {
    "name": "King-Wendt Group Home, LLC"
  },
  {
    "name": "Inspirationz, LLC"
  },
  {
    "name": "Independent Living Group Home, LLC"
  },
  {
    "name": "Foundation Strong, LLC"
  },
  {
    "name": "Shawn Spencer"
  },
  {
    "name": "NOA Human Services, Inc"
  },
  {
    "name": "Wolfe & Jackson Group Home, Inc."
  },
  {
    "name": "Home Care Solutions of NC, LLC"
  },
  {
    "name": "Friendly People That Care, LLC"
  },
  {
    "name": "NOA Human Services II, Inc."
  },
  {
    "name": "Top Priority Care Services, LLC"
  },
  {
    "name": "Arcola Lewis"
  },
  {
    "name": "Sharpe and Williams, Inc."
  },
  {
    "name": "NOA Human Services III, Inc."
  },
  {
    "name": "Bottom Up Outreach Center"
  },
  {
    "name": "Community Alternatives of NC"
  },
  {
    "name": "Springwell Network, Inc."
  },
  {
    "name": "LSM Enterprizes Inc."
  },
  {
    "name": "NOA Human Services IV, Inc."
  },
  {
    "name": "Morgan Support Services, Inc."
  },
  {
    "name": "Elevated Family Services, LLC"
  },
  {
    "name": "Crystal E. Nickerson, LLC"
  },
  {
    "name": "Johnson Enrichment Services, LLC"
  },
  {
    "name": "GroMeds to go, Transportation Inc."
  },
  {
    "name": "QP Consulting, Inc."
  },
  {
    "name": "J & L Business Center, LLC"
  },
  {
    "name": "Juvonne Monique Johnson"
  },
  {
    "name": "QP Consulting, Inc"
  },
  {
    "name": "Herman Wanshiya"
  },
  {
    "name": "Eason Court Group Home LLC"
  },
  {
    "name": "Joan Hewitt"
  },
  {
    "name": "Alpha Management Services, Inc."
  },
  {
    "name": "Legacy Human Services, Inc."
  },
  {
    "name": "Higher Cause Residences, LLC"
  },
  {
    "name": "Advantage Care In Home Services, Inc"
  },
  {
    "name": "The Flynn Fellowship Home of Gastonia, Inc."
  },
  {
    "name": "Gaston Residential Services-ICF/MR, Inc."
  },
  {
    "name": "Holy Angels, Inc."
  },
  {
    "name": "Gaston Residential Services- ICF/MR, Inc."
  },
  {
    "name": "Gaston Residential Services - ICF/MR, Inc."
  },
  {
    "name": "Gaston Residential Services, Inc."
  },
  {
    "name": "Holy Angels Services, Inc."
  },
  {
    "name": "Innovative Compliance Solutions, LLC"
  },
  {
    "name": "Miracle Houses, Inc."
  },
  {
    "name": "Alternative Community Penalties Program, Inc."
  },
  {
    "name": "VOCA of North Carolina"
  },
  {
    "name": "Opportunity Awaits, Inc."
  },
  {
    "name": "Aspen Investment Group, LLC"
  },
  {
    "name": "Brighter Dayz, LLC"
  },
  {
    "name": "Pathways Group Homes, LLC"
  },
  {
    "name": "Adaptive Interventions Group, LLC"
  },
  {
    "name": "Cosby Counseling & Consulting, PLLC"
  },
  {
    "name": "Pathyways Group Homes, LLC"
  },
  {
    "name": "Urbanized, LLC"
  },
  {
    "name": "Intervention Concepts, Inc."
  },
  {
    "name": "Bliss Haven Group, LLC"
  },
  {
    "name": "Nu Visions Group, LLC"
  },
  {
    "name": "Care Well of Charlotte, Inc."
  },
  {
    "name": "Simtas Development Group, LLC"
  },
  {
    "name": "Nexx Phase, LLC"
  },
  {
    "name": "Megatouch Concepts, Inc."
  },
  {
    "name": "Royal Child Academy Company"
  },
  {
    "name": "Tender Living Care, LLC"
  },
  {
    "name": "Aubrey's Safe Haven, LLC"
  },
  {
    "name": "Exclusive Caring Partners, LLC"
  },
  {
    "name": "Mecca of Beacons, LLC"
  },
  {
    "name": "No Limits Residential Care, LLC"
  },
  {
    "name": "Home Professionals, LLC"
  },
  {
    "name": "Branmarc, Inc Family Services"
  },
  {
    "name": "R & S Youth Haven, LLC"
  },
  {
    "name": "Opportunity Awaits, Inc"
  },
  {
    "name": "Sure Chance, LLC"
  },
  {
    "name": "Mega Touch Concepts, Inc"
  },
  {
    "name": "Dyvine Care LLC"
  },
  {
    "name": "Sunny Journey Ahead, LLC"
  },
  {
    "name": "Learning Services Corporation"
  },
  {
    "name": "More Than Conquerors Youth Center, Inc."
  },
  {
    "name": "Advantage Care in Home Services, Inc."
  },
  {
    "name": "Edwards Group Home, Inc."
  },
  {
    "name": "Lucille's Behavioral, Inc."
  },
  {
    "name": "Edwards Group Home II, Inc."
  },
  {
    "name": "Edward's Group Home III, Inc."
  },
  {
    "name": "Edwards Group Home IV, Inc."
  },
  {
    "name": "Krystal's House, LLC"
  },
  {
    "name": "Edwards Group Home VI, Inc."
  },
  {
    "name": "Oasis: A Holistic Network, LLC"
  },
  {
    "name": "Addie A. Watson"
  },
  {
    "name": "Family Affair Care Group Management, Inc."
  },
  {
    "name": "Flying Start Creative Expressions, Inc."
  },
  {
    "name": "Dianne Nowlin"
  },
  {
    "name": "Fellowship Hall, Inc."
  },
  {
    "name": "Blessed New Beginnings, LLC"
  },
  {
    "name": "Lydia's Home LLC"
  },
  {
    "name": "Virpark, Inc."
  },
  {
    "name": "Letithia P. Parker"
  },
  {
    "name": "Zakiyyah Jones"
  },
  {
    "name": "Shealy Family Care, Inc."
  },
  {
    "name": "Royal Purnell"
  },
  {
    "name": "Loving Hearts Home, LLC"
  },
  {
    "name": "Gabriel Breier"
  },
  {
    "name": "JMJ Enterprises LLC"
  },
  {
    "name": "Quality Care III, LLC"
  },
  {
    "name": "M & S Supervised Living, LLC"
  },
  {
    "name": "Bonnie Watlington & Romulus Thurman Watlington"
  },
  {
    "name": "Community Support Service, LLC"
  },
  {
    "name": "JMJ Enterprises, LLC"
  },
  {
    "name": "Healing Hands Family Services, LLC"
  },
  {
    "name": "SHFP, Inc."
  },
  {
    "name": "Changing Lives Group Home II, LLC"
  },
  {
    "name": "Omniya S. Miller"
  },
  {
    "name": "Moravian Enterprises, LLC"
  },
  {
    "name": "AGAPE Home Living Care, LLC"
  },
  {
    "name": "Hicks House of Care, LLC"
  },
  {
    "name": "Lee Street Services, LLC"
  },
  {
    "name": "All About You Residential Home Care, LLC"
  },
  {
    "name": "Changing Lives Group Home IV, LLC"
  },
  {
    "name": "CareLink Solutions"
  },
  {
    "name": "United Living, LLC"
  },
  {
    "name": "Successful Visions, LLC"
  },
  {
    "name": "Sylvanglade Services, Inc."
  },
  {
    "name": "Alexander Youth Network"
  },
  {
    "name": "Tinikia Pettiford"
  },
  {
    "name": "Fresh Start Today, Inc."
  },
  {
    "name": "Premium Kare Corporation"
  },
  {
    "name": "Open Arms Community Services, LLC"
  },
  {
    "name": "Beautiful Beginnings Services, LLC"
  },
  {
    "name": "Sanctuary House"
  },
  {
    "name": "Happy Hearts LLC"
  },
  {
    "name": "Eli Group Home, LLC"
  },
  {
    "name": "Jonathan McCrary"
  },
  {
    "name": "Willows Place, LLC"
  },
  {
    "name": "Affluent Treasures, LLC"
  },
  {
    "name": "Curtis Royal"
  },
  {
    "name": "The Moses H. Cone Memorial Hospital Operating Corp"
  },
  {
    "name": "Frest Start Today, Inc."
  },
  {
    "name": "Agape Home Living Care Phase II, LLC"
  },
  {
    "name": "Timothy Joell Davis"
  },
  {
    "name": "Robbie Johnson"
  },
  {
    "name": "Creativity Works, LLC"
  },
  {
    "name": "Toya's Project, LLC"
  },
  {
    "name": "Life Champions, LLC"
  },
  {
    "name": "New Horizons Professional Services, Inc."
  },
  {
    "name": "Qumara Lee"
  },
  {
    "name": "Compassionate Care of North Carolina, LLC"
  },
  {
    "name": "Epic Life Family Care Home, LLC"
  },
  {
    "name": "Rhonda Fuller"
  },
  {
    "name": "New Horizons Professional Services, Inc"
  },
  {
    "name": "Henley Family Care, LLC"
  },
  {
    "name": "Ashley N. Haith"
  },
  {
    "name": "Frank & RAQ AFL & Associates, LLC"
  },
  {
    "name": "Rising Phoenix, Inc"
  },
  {
    "name": "Nicholas Slayton"
  },
  {
    "name": "CareLink Solutions, Inc"
  },
  {
    "name": "Kimberly Faith Williams"
  },
  {
    "name": "Legacy Residential & Community Services, LLC"
  },
  {
    "name": "Tri Support Systems, Inc"
  },
  {
    "name": "Debra M. Robinson"
  },
  {
    "name": "Community Support Service, L.L.C."
  },
  {
    "name": "Gentlehands of NC, Inc."
  },
  {
    "name": "Lathay L. Coltrane"
  },
  {
    "name": "Gregory Carter"
  },
  {
    "name": "Youth Enrichment Group Home, Inc."
  },
  {
    "name": "Virpark Inc."
  },
  {
    "name": "Alternative Behavioral Solutions, Inc."
  },
  {
    "name": "Dawn & Keith Milton"
  },
  {
    "name": "Rising Phoenix, Inc."
  },
  {
    "name": "Quality Life Services, Inc."
  },
  {
    "name": "United Living LLC"
  },
  {
    "name": "Adolescent Alternatives"
  },
  {
    "name": "Mercy Home Services, Inc."
  },
  {
    "name": "Tracey Johnson"
  },
  {
    "name": "Black & Associates Global, Inc."
  },
  {
    "name": "Virgina M Parker"
  },
  {
    "name": "Eva Lewis Washington and Victor Reuben Washington"
  },
  {
    "name": "First Genesis Family Services, Inc."
  },
  {
    "name": "A Place of Their Own, LLC"
  },
  {
    "name": "Griffin Home, Inc."
  },
  {
    "name": "AbleCare Corp."
  },
  {
    "name": "AbleCare Corp"
  },
  {
    "name": "Majestic Solutions, LLC"
  },
  {
    "name": "Comunity Support Service, LLC"
  },
  {
    "name": "Positive Connection Care, Inc."
  },
  {
    "name": "Triad Adult Day Care Center, Inc."
  },
  {
    "name": "Blackwell House, Inc."
  },
  {
    "name": "Sharon Marie Lyons"
  },
  {
    "name": "William Benjamin"
  },
  {
    "name": "Better Connections, Inc."
  },
  {
    "name": "Angie Richardson"
  },
  {
    "name": "New Beginning Day Treatment Center, LLC"
  },
  {
    "name": "ABC Care LP"
  },
  {
    "name": "Emma Alston"
  },
  {
    "name": "Family Advantage, LLC"
  },
  {
    "name": "Program Resource Institute, Inc."
  },
  {
    "name": "Sierra's Residential Services, Inc."
  },
  {
    "name": "Victor & Associates, Inc."
  },
  {
    "name": "Shirley Spears"
  },
  {
    "name": "Martin Living Corporation"
  },
  {
    "name": "Freedom Care Services, LLC"
  },
  {
    "name": "PAMCO Care - NC, LLC"
  },
  {
    "name": "Herbert and Senora Woodard"
  },
  {
    "name": "AMAT Group Homes, LLC"
  },
  {
    "name": "HOPE Inside, Inc"
  },
  {
    "name": "The Arc of Haywood County, Inc."
  },
  {
    "name": "Donald Ray Adams"
  },
  {
    "name": "Irene Wortham Center, Inc."
  },
  {
    "name": "Halcyon, LLC"
  },
  {
    "name": "Reach for Independence Inc."
  },
  {
    "name": "Equinox RTC, LLC"
  },
  {
    "name": "Twelve Oaks, LLC"
  },
  {
    "name": "Appalachian Outpatient Services, LLC"
  },
  {
    "name": "HomeCare Management"
  },
  {
    "name": "The Willow at Red Oak Recovery, LLC"
  },
  {
    "name": "Higher Horizons, Inc."
  },
  {
    "name": "Premier Healthcare Services, Inc."
  },
  {
    "name": "Therapeutic Alternatives, Inc."
  },
  {
    "name": "Multicultural Resources Center, Inc."
  },
  {
    "name": "Cyshelle Graham"
  },
  {
    "name": "Precious Haven Inc."
  },
  {
    "name": "Canyon Hills Treatment Facility, LLC"
  },
  {
    "name": "Amat Group Homes LLC"
  },
  {
    "name": "Makin' Choices, Inc."
  },
  {
    "name": "Rae's Playze Adult Day Center"
  },
  {
    "name": "Multicultural Resources Center, Inc"
  },
  {
    "name": "Roanoke Developmental Center, Inc."
  },
  {
    "name": "Carolina Residential Services, Inc."
  },
  {
    "name": "Rockwell Development Center, Inc."
  },
  {
    "name": "Life Alliance, LLC"
  },
  {
    "name": "Horizons Kids, LLC"
  },
  {
    "name": "PQA Healthcare, Inc"
  },
  {
    "name": "Macon Citizens Habilities, Inc."
  },
  {
    "name": "KMG Holdings, Inc."
  },
  {
    "name": "Passionate Care Group Homes"
  },
  {
    "name": "Robeson Health Care Corporation"
  },
  {
    "name": "United Family Network"
  },
  {
    "name": "Children Under Construction Treatment Center Barnes Inc"
  },
  {
    "name": "Savin Grace LLC"
  },
  {
    "name": "Ultimate Family Care Home, Inc."
  },
  {
    "name": "Ultimate Family Care Home Inc."
  },
  {
    "name": "Ultimate Family Care Home, Inc,"
  },
  {
    "name": "JMarie Loving Home, LLC"
  },
  {
    "name": "Shannon Mink"
  },
  {
    "name": "The Bear Enterprise, LLC"
  },
  {
    "name": "Helen King"
  },
  {
    "name": "Savin Grace, LLC"
  },
  {
    "name": "Peace Healthcare, Inc"
  },
  {
    "name": "Quality-Care Behavioral Health Services, Inc."
  },
  {
    "name": "Quality Care Behavioral Health Services, Inc."
  },
  {
    "name": "T.L.C. Homes, Inc."
  },
  {
    "name": "Lee County Group Homes, Inc."
  },
  {
    "name": "Baptist Children's Homes of NC, Inc."
  },
  {
    "name": "I Innovation, Inc."
  },
  {
    "name": "I Innovations, Inc."
  },
  {
    "name": "Nova IC, Inc."
  },
  {
    "name": "NOVA, Inc."
  },
  {
    "name": "NOVA, Inc"
  },
  {
    "name": "Advance Behavioral Health Services, Inc."
  },
  {
    "name": "With A Purpose Family Care, Inc."
  },
  {
    "name": "Advance Behavioral Health Services Inc."
  },
  {
    "name": "MacBill Inc."
  },
  {
    "name": "Barnes Group Homes LLC"
  },
  {
    "name": "Barnes Group Homes, LLC"
  },
  {
    "name": "A Caring Heart Case Management, Inc"
  },
  {
    "name": "Cynthia Loving Care Home, LLC"
  },
  {
    "name": "VIRTUE, Inc."
  },
  {
    "name": "Restored Bridges, LLC"
  },
  {
    "name": "WNC Madison County Housing Corporation"
  },
  {
    "name": "Martin Co. Res. Servs., Inc. d/b/a Martin Enterprises"
  },
  {
    "name": "Martin Co. Res. Serv., Inc. d.b.a. Martin Enterprises"
  },
  {
    "name": "Jeff Roberts"
  },
  {
    "name": "New Beginnings With Love, Inc."
  },
  {
    "name": "Uprising Homes, Inc."
  },
  {
    "name": "Recovery Ventures Corporation"
  },
  {
    "name": "East Court Group Care, Inc."
  },
  {
    "name": "Quality Adult Care, Inc."
  },
  {
    "name": "North Carolina Outreach HomeCare, LLC"
  },
  {
    "name": "Clear Sky Behavioral, LLC"
  },
  {
    "name": "A Caring Alternative, LLC"
  },
  {
    "name": "Univeral Mental Health Services, Inc."
  },
  {
    "name": "North Carolina Outreach Home Care"
  },
  {
    "name": "Gene & Stephanie McPeters"
  },
  {
    "name": "North Carolina Outreach Group Home, LLC"
  },
  {
    "name": "Lifespan Incorporated"
  },
  {
    "name": "Diamond's Community Based Services, Inc."
  },
  {
    "name": "Echelon Consulting, Inc."
  },
  {
    "name": "One Step Forward Outreach, Inc."
  },
  {
    "name": "HeartSpring, Inc."
  },
  {
    "name": "Primary Care Solutions, Inc."
  },
  {
    "name": "Kerr Homes, Inc."
  },
  {
    "name": "Kerr Homes, Incorporated"
  },
  {
    "name": "Autism Services of Mecklenburg County, Inc."
  },
  {
    "name": "McLeod Centers for Wellbeing"
  },
  {
    "name": "Hinds' Feet Farm, Inc."
  },
  {
    "name": "The Kids Workshop, Inc."
  },
  {
    "name": "Anuvia Prevention and Recovery Center, Inc."
  },
  {
    "name": "HopeWay Foundation"
  },
  {
    "name": "A Caring Home, Inc."
  },
  {
    "name": "New Place, Inc."
  },
  {
    "name": "Mentor ABI, LLC"
  },
  {
    "name": "Thompson Child and Family Focus"
  },
  {
    "name": "Heartspring Inc."
  },
  {
    "name": "Polished Path, LLC"
  },
  {
    "name": "Ropes, Inc. R.O.P.E.S.(Recovery Oriented Practices)"
  },
  {
    "name": "LifeSpan, Inc"
  },
  {
    "name": "Residential Adolescent Community Services, LLC"
  },
  {
    "name": "Choosing Change Residential Services, LLC"
  },
  {
    "name": "Life-Way Homes, LLC"
  },
  {
    "name": "Collaborative Hope"
  },
  {
    "name": "Transcending Heights, LLC"
  },
  {
    "name": "Affirmative Family Care Services, LLC"
  },
  {
    "name": "Supreme 6, LLC"
  },
  {
    "name": "Abound Health , LLC"
  },
  {
    "name": "jwigginsbusinessinabox, LLC"
  },
  {
    "name": "Extended Family Residences, LLC"
  },
  {
    "name": "MyHome, LLC"
  },
  {
    "name": "No Bounds Care, Inc."
  },
  {
    "name": "Covenant Case Management Services LLC"
  },
  {
    "name": "Ryan's Place, LLC"
  },
  {
    "name": "Next Level Family Solutions, LLC"
  },
  {
    "name": "Johnny B's, LLC"
  },
  {
    "name": "A Step In The Right Direction LLC"
  },
  {
    "name": "North Carolina Health Operations, LLC"
  },
  {
    "name": "Easter Seals UCP North Carolina & Virginia, Inc"
  },
  {
    "name": "Hope Haven, Inc."
  },
  {
    "name": "Autism Services of Mecklenburg County Inc."
  },
  {
    "name": "My B.R.O.T.H.E.R.'s House, Inc."
  },
  {
    "name": "Community Treatment Alternatives, Inc."
  },
  {
    "name": "My B.R.O.T.H.E.R.'s  House, Inc."
  },
  {
    "name": "New Leaf Adolescent Care, Inc."
  },
  {
    "name": "Dreams and Vision, LLC"
  },
  {
    "name": "Jireh's Place, Inc."
  },
  {
    "name": "Mitchell County Group Home, Inc."
  },
  {
    "name": "Bethesda, Inc."
  },
  {
    "name": "The Bethany House, Inc."
  },
  {
    "name": "Specialized Services & Personnel, Inc."
  },
  {
    "name": "Linden Lodge Foundation"
  },
  {
    "name": "Cornerstone Treatment Facility Program, Inc."
  },
  {
    "name": "Greater Image Healthcare, Corp."
  },
  {
    "name": "Diligent Care, Inc"
  },
  {
    "name": "BTW Home Care Services, LLC"
  },
  {
    "name": "Stacy Davenport Baird"
  },
  {
    "name": "Steve Avent"
  },
  {
    "name": "Darrell Frank Johnson II"
  },
  {
    "name": "Warren Harper and Deborah Harper"
  },
  {
    "name": "Calvin Brockington"
  },
  {
    "name": "Better Days Ahead Inc."
  },
  {
    "name": "Sheila M. McDowell-Ricks"
  },
  {
    "name": "Koody Health Care Services, Inc."
  },
  {
    "name": "Koody Healthcare Services, Inc."
  },
  {
    "name": "Lifetime Resources, Inc."
  },
  {
    "name": "Cape Fear Group Homes, Inc."
  },
  {
    "name": "GHA Autism Supports"
  },
  {
    "name": "A Caring Heart Case Management, Inc."
  },
  {
    "name": "Cape Fear Group Homes, Inc"
  },
  {
    "name": "Bright Light Counseling, PLLC"
  },
  {
    "name": "The Healing Place of New Hanover County, Inc"
  },
  {
    "name": "Carobell, Inc."
  },
  {
    "name": "Linda Shorts"
  },
  {
    "name": "Coastal Residential Services, Inc."
  },
  {
    "name": "People of Potential, Inc."
  },
  {
    "name": "FACT Specialized Services, LLC"
  },
  {
    "name": "Spirit of Excellence Community Outreach, Inc."
  },
  {
    "name": "William Harris & Joy Harris"
  },
  {
    "name": "IQUOLIOC, Inc."
  },
  {
    "name": "Helen C. Roush"
  },
  {
    "name": "Recovery Innovations, Inc."
  },
  {
    "name": "A Caring Heart Case Managemet, Inc."
  },
  {
    "name": "Residential Services, Inc."
  },
  {
    "name": "Apogee Homes, Inc."
  },
  {
    "name": "New Destinations, Inc."
  },
  {
    "name": "The Benjamin House, Inc."
  },
  {
    "name": "Better Connections Inc."
  },
  {
    "name": "Linda Newton, Susie Hayes & Cardell Hayes"
  },
  {
    "name": "Plumb Line Services, Inc."
  },
  {
    "name": "Autism Support and Programs, Inc."
  },
  {
    "name": "A Special Touch II, Inc."
  },
  {
    "name": "Karen Clarke"
  },
  {
    "name": "Person County Group Homes, Inc."
  },
  {
    "name": "McDaniel Homes, LLC"
  },
  {
    "name": "Thursher G. Winstead"
  },
  {
    "name": "Thursher G. Winstead Carehouse, Inc."
  },
  {
    "name": "Ronald D. Pettiford and Lisa S. Pettiford"
  },
  {
    "name": "Reed AFL Home, LLC"
  },
  {
    "name": "Ajinnda 13 Group Living Facility, LLC"
  },
  {
    "name": "Judges A.R. Johnson"
  },
  {
    "name": "Nicole Oshier"
  },
  {
    "name": "PORT Health Services, Inc."
  },
  {
    "name": "Paradigm, Inc."
  },
  {
    "name": "Keep Hope Alive, LLC"
  },
  {
    "name": "MAAL-CARE, LLC"
  },
  {
    "name": "Daryl Lewis"
  },
  {
    "name": "Todd Davis"
  },
  {
    "name": "Idella's Care Homes, LLC"
  },
  {
    "name": "Jacqueline L. Prayer"
  },
  {
    "name": "Amani Residential Human Services, Inc."
  },
  {
    "name": "Pinnacle Home Care, Inc"
  },
  {
    "name": "Paradigm, Inc"
  },
  {
    "name": "Pavillon International"
  },
  {
    "name": "Synergy in Action, Inc."
  },
  {
    "name": "Advanced Health Resources, Inc."
  },
  {
    "name": "Thyllis Smith"
  },
  {
    "name": "Youth Unlimited, Inc."
  },
  {
    "name": "Holly R. Legette"
  },
  {
    "name": "Marsh's Residential Living, LLC"
  },
  {
    "name": "Tymika Smith"
  },
  {
    "name": "Darryl D. Jones"
  },
  {
    "name": "Antonio Stroman and Brittny Murray"
  },
  {
    "name": "Community Support Service L.L.C."
  },
  {
    "name": "Melissa Hale"
  },
  {
    "name": "Samaritan Colony"
  },
  {
    "name": "Diligent Care, Inc."
  },
  {
    "name": "Creative Helping Hands, LLC"
  },
  {
    "name": "Angelo's Care Home, Inc."
  },
  {
    "name": "Life Opportunities, Inc."
  },
  {
    "name": "Riverbend Services, Inc."
  },
  {
    "name": "Chaparral Youth Services, LLC"
  },
  {
    "name": "The Johnson Center Home Incorporated"
  },
  {
    "name": "Robeson Health Care Corporation (RHCC)"
  },
  {
    "name": "Asbury Homes, Inc."
  },
  {
    "name": "Community Outreach Youth Services, LLC"
  },
  {
    "name": "REMMSCO, Inc."
  },
  {
    "name": "Rouse's Group Home, Inc."
  },
  {
    "name": "Youth Haven Services, LLC"
  },
  {
    "name": "Lillie P. Neal"
  },
  {
    "name": "Laverne's Haven Residential Services, LLC"
  },
  {
    "name": "Laverne's Haven Residential Home Services, LLC"
  },
  {
    "name": "Unique Souls LLC"
  },
  {
    "name": "Halicia's Haven of Hope LLC"
  },
  {
    "name": "Timber Ridge Treatment Center, Inc."
  },
  {
    "name": "Nazareth Children's Home"
  },
  {
    "name": "TGH Behavioral Health Services, Inc."
  },
  {
    "name": "Revive Housing, LLC"
  },
  {
    "name": "Stepping Stone Services, LLC"
  },
  {
    "name": "A-Mae's Solution, LLC"
  },
  {
    "name": "Nazareth Children's Home, Inc"
  },
  {
    "name": "Buffalo's Concerned For Youth, Inc"
  },
  {
    "name": "K D Support Services"
  },
  {
    "name": "KD Support Services, LLC"
  },
  {
    "name": "Peace in the City"
  },
  {
    "name": "Red Oak Adolescent Recovery, LLC"
  },
  {
    "name": "Renewed Services, Inc"
  },
  {
    "name": "Duplin-Sampson Group Homes, Inc."
  },
  {
    "name": "Mercy Care, Inc."
  },
  {
    "name": "Rainbow 66 Storehouse, Inc."
  },
  {
    "name": "TT & T Services, Inc."
  },
  {
    "name": "Rainbow 66 Storehouse, Inc"
  },
  {
    "name": "Premier Service of Carolina, Inc."
  },
  {
    "name": "North Carolina LIfe of Rehabilitation, Inc"
  },
  {
    "name": "Scott's Family Care Home, Inc"
  },
  {
    "name": "Pinnacle Homes, DDA, LLC"
  },
  {
    "name": "Hope Valley, Inc."
  },
  {
    "name": "Surry-Yadkin Residential Services, Inc."
  },
  {
    "name": "Peace Lily Development, Inc."
  },
  {
    "name": "Hawthorn Heights WNC, Inc."
  },
  {
    "name": "Transylvania Association for Disabled Citizens"
  },
  {
    "name": "TRAILS Carolina, LLC"
  },
  {
    "name": "Transylvania Vocational Services, Inc."
  },
  {
    "name": "Baptist Children's Homes of North Carolina, Inc."
  },
  {
    "name": "Anderson Behavioral Health, Inc."
  },
  {
    "name": "Amazing Love, LLC"
  },
  {
    "name": "Transformative Life Center, LLC dba Transcend ED"
  },
  {
    "name": "Opendors, LLC"
  },
  {
    "name": "Lifes Good Stay Here"
  },
  {
    "name": "P & W Group LLC"
  },
  {
    "name": "Guardian Angel Healthcare, LLC"
  },
  {
    "name": "Americares Health Services LLC"
  },
  {
    "name": "Alpha Residential Services LLC"
  },
  {
    "name": "Alpha Residential Services, LLC"
  },
  {
    "name": "Crandell's Enterprises Inc."
  },
  {
    "name": "Alpha Home Care Services, Inc."
  },
  {
    "name": "Pioneer HealthCare, Inc."
  },
  {
    "name": "Brightside Homes, Inc."
  },
  {
    "name": "Higher Aspiration Behavioral Heatlh Care, LLC"
  },
  {
    "name": "Hilltop Home, Inc."
  },
  {
    "name": "TLC Operations, Inc."
  },
  {
    "name": "Access Health System 1 Corp"
  },
  {
    "name": "Glenda Judd Evans-Walston"
  },
  {
    "name": "Suzan  Rouse"
  },
  {
    "name": "Rosa Marie Wilkins"
  },
  {
    "name": "Bradley Home,Caring For Wake Community & the Carolinas"
  },
  {
    "name": "St. Marks Manor, Inc."
  },
  {
    "name": "Eloise M. Dowtin"
  },
  {
    "name": "Herbert Reid"
  },
  {
    "name": "Clifford Thomas"
  },
  {
    "name": "Caring For Wake Community and the Carolinas, Inc."
  },
  {
    "name": "Mrs. Deborah Peebles"
  },
  {
    "name": "Ms. Kimberly Starkey"
  },
  {
    "name": "Dorothy Murchison"
  },
  {
    "name": "Healing Transitions, Inc."
  },
  {
    "name": "Mary McCullers-Jackson"
  },
  {
    "name": "Southlight Healthcare"
  },
  {
    "name": "Residential Support Services of Wake County, Inc."
  },
  {
    "name": "Mary Lilly McCullers"
  },
  {
    "name": "Agape Family Care Homes, LLC"
  },
  {
    "name": "Blessed Home, LLC"
  },
  {
    "name": "Ayodele Joy Oyelowo"
  },
  {
    "name": "Canaan Care Home, LLC"
  },
  {
    "name": "Eagle Healthcare Services Inc."
  },
  {
    "name": "The Bruson Group, Inc."
  },
  {
    "name": "Meeks Group Homes, LLC"
  },
  {
    "name": "United Family Network, Inc."
  },
  {
    "name": "Resources for Human Development, Inc."
  },
  {
    "name": "Bradley Home Caring for Wake Community & the Carolinas"
  },
  {
    "name": "JAG's Residential Services, LLC"
  },
  {
    "name": "Crandell's Enterprises, Inc."
  },
  {
    "name": "Victory Healthcare Services, Inc."
  },
  {
    "name": "Etta's Residential Services and Supports, LLC"
  },
  {
    "name": "Novella's Place, Inc."
  },
  {
    "name": "Alpha Home Care Services Inc."
  },
  {
    "name": "Clora Webb"
  },
  {
    "name": "Absolute Home and Community Services"
  },
  {
    "name": "Termaine Moore"
  },
  {
    "name": "Anthonia Ezuma"
  },
  {
    "name": "Ezekiel Wilson"
  },
  {
    "name": "Life Changez, Inc."
  },
  {
    "name": "Arleana Harrison"
  },
  {
    "name": "Johnson's House of Hope Family Care Home, LLC"
  },
  {
    "name": "Living With Autism, Inc."
  },
  {
    "name": "Daniel Saft"
  },
  {
    "name": "Favour Homes, Inc."
  },
  {
    "name": "Hannah Family Care Homes, Inc."
  },
  {
    "name": "Chuck B. Anumudu/Christiana O. Anumudu"
  },
  {
    "name": "Absolute Home and Community Services, Inc."
  },
  {
    "name": "Heavenly Place, LLC"
  },
  {
    "name": "University of North Carolina Hospitals at Chapel Hill"
  },
  {
    "name": "Harrison Group Homes, LLC"
  },
  {
    "name": "Russell Meadows Institute"
  },
  {
    "name": "Pioneer Healthcare Inc."
  },
  {
    "name": "JACE Healthcare Services, Inc."
  },
  {
    "name": "Brightside Homes Inc."
  },
  {
    "name": "Absolute Home & Community Services"
  },
  {
    "name": "Deanna Michelle Rose"
  },
  {
    "name": "Divine Supportive Homes, Inc."
  },
  {
    "name": "Absolute Care Assisted Living, LLC"
  },
  {
    "name": "Tony Cooke"
  },
  {
    "name": "Easter Seals UCP North Carolina & Virginia"
  },
  {
    "name": "Twinkle-Star Home Services LLC"
  },
  {
    "name": "Lindley Habilitation Services, Inc."
  },
  {
    "name": "Unlimitied Care Management Services, Inc."
  },
  {
    "name": "Allison Chisley"
  },
  {
    "name": "New Waters Recovery North Carolina, LLC"
  },
  {
    "name": "Skyywell Health Inc"
  },
  {
    "name": "Inez's House HC LLC"
  },
  {
    "name": "Novelty Healthcare Services, Inc"
  },
  {
    "name": "Dorothea Cox-Brown"
  },
  {
    "name": "Smith's Landing, Inc."
  },
  {
    "name": "ACI Support Specialists, LLC"
  },
  {
    "name": "Three Ds Family Living, LLC"
  },
  {
    "name": "Guardian Angels Healthcare, LLC"
  },
  {
    "name": "Watauga Opportunities, Inc."
  },
  {
    "name": "Baptist Children's Home of NC, Inc."
  },
  {
    "name": "ReNu Life, L.L.C."
  },
  {
    "name": "NOVA-IC, Inc."
  },
  {
    "name": "Country Pines, Inc."
  },
  {
    "name": "Gwendalyn Howell/Dorothy Howell"
  },
  {
    "name": "Betty Williams"
  },
  {
    "name": "Lisa W. Barwick"
  },
  {
    "name": "William Vaughn"
  },
  {
    "name": "Universal Group Home LLC"
  },
  {
    "name": "Renu Life Extended, Inc."
  },
  {
    "name": "Universal Group Home, LLC"
  },
  {
    "name": "Ambleside, Inc"
  },
  {
    "name": "Dontaes House, LLC"
  },
  {
    "name": "Synergy Recovery , Inc."
  },
  {
    "name": "Brushy Mountain Group Homes, Inc."
  },
  {
    "name": "Wanda Hinton"
  },
  {
    "name": "Larry Wellman"
  },
  {
    "name": "Miss Daisy's & Associates, Inc."
  },
  {
    "name": "Tonya Fuller Johnson"
  },
  {
    "name": "Bailey's Respite Care, Inc."
  },
  {
    "name": "Cynthia L. Powell"
  },
  {
    "name": "Herbert Reid Home, Inc."
  },
  {
    "name": "Kyseem's Unity Group Home, LLC"
  },
  {
    "name": "Grace 4 The Youth, LLC"
  },
  {
    "name": "Yadkin Home Place Six, Inc."
  }
]
Organization.create(orgs)
         
        
       end
     end
  end