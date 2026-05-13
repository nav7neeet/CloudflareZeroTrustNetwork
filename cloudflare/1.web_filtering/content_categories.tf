variable "content_categories" {
  description = "content categories"
  type        = map(number)
  default = {

    # --- Ads (Category 1) ---
    "Advertisements" = 66

    # --- Adult Themes (Category 2) ---
    "Adult Themes" = 67
    "Nudity"       = 125
    "Pornography"  = 133

    # --- Business & Economy (Category 3) ---
    # "Brokerage & Investing"                = 186
    # "Business"                             = 75
    # "Economy & Finance"                    = 89
    # "Cryptocurrency"                       = 183
    # "Personal Finance"                     = 185

    # --- Education (Category 6) ---
    # "Education"                            = 90
    # "Educational Institutions"             = 91
    # "Reference"                            = 189
    # "Science"                              = 144
    # "Space & Astronomy"                    = 150

    # --- Entertainment (Category 7) ---
    # "Arts"                                 = 70
    # "Audio Streaming"                      = 74
    # "Cartoons & Anime"                     = 76
    # "Comic Books"                          = 79
    # "Entertainment"                        = 92
    # "Fine Art"                             = 96
    # "Gaming"                               = 100
    # "Home Video/DVD"                       = 106
    # "Humor"                                = 107
    # "Magazines"                            = 116
    # "Movies"                               = 120
    # "Music"                                = 121
    # "News & Media"                         = 122
    # "Paranormal"                           = 127
    # "Radio"                                = 139
    # "Television"                           = 156
    # "Video Streaming"                      = 164

    # --- Gambling (Category 8) ---
    "Gambling" = 99

    # --- Government & Politics (Category 9) ---
    # "Charity and Non-profit"               = 190
    # "Government/Legal"                     = 101
    # "Politics, Advocacy, and Government-Related" = 137

    # --- Health (Category 10) ---
    # "Health & Fitness"                     = 103
    # "Sex Education"                        = 146

    # --- Internet Communication (Category 12) ---
    # "Chat"                                 = 77
    # "Forums"                               = 98
    # "Information Security"                 = 108
    # "Instant Messengers"                   = 110
    # "Internet Phone & VOIP"                = 111
    # "Messaging"                            = 118
    # "P2P"                                  = 128
    # "Personal Blogs"                       = 129
    # "Webmail"                              = 168
    # "Photo Sharing"                        = 172

    # --- Job Search & Careers (Category 13) ---
    # "Job Search & Careers"                 = 113

    # --- Miscellaneous (Category 15) ---
    "Login Screens"      = 115
    "Miscellaneous"      = 119
    "No Content"         = 124
    "URL Alias/Redirect" = 141
    "Unreachable"        = 161

    # --- Questionable Content (Category 17) ---
    "Deceptive Ads"               = 85
    "Drugs"                       = 87
    "Hacking"                     = 102
    "Profanity"                   = 135
    "Questionable Activities"     = 138
    "Militancy, Hate & Extremism" = 157
    "Unreliable Information"      = 162

    # --- Real Estate (Category 18) ---
    # "Real Estate"                          = 140

    # --- Religion (Category 19) ---
    # "Religion & Spirituality"              = 142

    # --- Safe for Kids (Category 20) ---
    # "Safe for Kids"                        = 143
    # --- Security threats (Category 21) ---
    "Anonymizer"                    = 68
    "Command and Control & Botnet"  = 80
    "Compromised Domain"            = 187
    "Cryptomining"                  = 83
    "Malware"                       = 117
    "Phishing"                      = 131
    "Potentially unwanted software" = 188
    # "Private IP Address"                   = 134
    "Spam"                        = 151
    "Spyware"                     = 153
    "DNS Tunneling"               = 175
    "Domain Generation Algorithm" = 176
    "Brand Embedding"             = 178
    "Scam"                        = 191

    # --- Shopping & Auctions (Category 22) ---
    # "Auctions & Marketplaces"              = 73
    # "Coupons"                              = 82
    # "Ecommerce"                            = 88
    # "Shopping"                             = 148

    # --- Society & Lifestyle (Category 24) ---
    # "Arts & Crafts"                        = 71
    # "Astrology"                            = 72
    # "Clothing"                             = 78
    # "Dating & Relationships"               = 84
    # "Digital Postcards"                    = 86
    # "Parenting"                            = 93
    # "Fashion"                              = 94
    # "Food & Drink"                         = 97
    # "Hobbies & Interests"                  = 104
    # "Home & Garden"                        = 105
    # "Lifestyle"                            = 114
    # "Pets"                                 = 130
    # "Photography"                          = 132
    # "Professional Networking"              = 136
    # "Sexuality"                            = 147
    "Social Networks" = 149
    # "Swimsuits"                            = 154
    # "Tobacco"                              = 158
    # "Body Art"                             = 173
    # "Lingerie & Bikini"                    = 174
    # "Alcohol"                              = 181

    # --- Sports (Category 25) ---
    # "Sports"                               = 152

    # --- Technology (Category 26) ---
    # "APIs"                                 = 69
    # "Content Servers"                      = 81
    # "File Sharing"                         = 95
    # "Information Technology"               = 109
    # "News, Portal & Search"                = 123
    # "Search Engines"                       = 145
    # "Technology"                           = 155
    # "Translator"                           = 159
    # "Artificial Intelligence"              = 184
    # "Remote Access"                        = 192
    # "Shareware/Freeware"                   = 193
    # "Keep Awake Software"                  = 194

    # --- Travel (Category 27) ---
    # "Travel"                               = 160

    # --- Vehicles (Category 28) ---
    # "Vehicles"                             = 163

    # --- Violence (Category 29) ---
    "Violence" = 165
    "Weapons"  = 166

    # --- Weather (Category 30) ---
    # "Weather"                              = 167

    # --- Always blocked (Category 31) ---
    "Child Abuse" = 170

    # --- Security Risks (Category 32) ---
    "Parked & For Sale Domains" = 128
    "New Domains"               = 169
    "Newly Seen Domains"        = 177

    # --- CIPA (Category 34) ---
    "CIPA Filter" = 182
  }
}