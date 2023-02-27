//
//  Emoji.swift
//  memmo
//
//  Created by najin on 2023/02/27.
//

import Foundation

struct Emoji {
    static let types = ["얼굴 및 사람", "동물 및 자연", "식음료", "활동", "여행 및 장소", "개체", "기호", "깃발"]
    static let values = EmojiValues.allCases.map{ $0.rawValue.split(separator: "")}
}

enum EmojiValues: String, CaseIterable {
    case faceAndPerson = "😀😃😄😁😆😅😂🤣😇😉😊🙂🙃☺😋😌😍🥰😘😗😙😚🥲🤪😜😝😛🤑😎🤓🥸🧐🤠🥳🤡😏😶🫥😐🫤😑😒🙄🤨🤔🤫🤭🫢🫡🤗🫣🤥😳😞😟😤😠😡🤬😔😕🙁☹😬🥺😣😖😫😩🥱😪😮‍💨😮😱😨😰😥😓😯😦😧🥹😢😭🤤🤩😵😵‍💫🥴😲🤯🫠🤐😷🤕🤒🤮🤢🤧🥵🥶😶‍🌫️😴💤😈👿👹👺💩👻💀☠👽🤖🎃😺😸😹😻😼😽🙀😿😾🫶👐🤲🙌👏🙏🤝👍👎👊✊🤛🤜🤞✌🫰🤘🤟👌🤌🤏👈🫳🫴👉👆👇☝✋🤚🖐🖖👋🤙🫲🫱💪🦾🖕🫵✍🤳💅🦵🦿🦶👄🫦🦷👅👂🦻👃👁👀🧠🫀🫁🦴👤👥🗣🫂👶👧🧒👦👩🧑👨👩‍🦱🧑‍🦱👨‍🦱👩‍🦰🧑‍🦰👨‍🦰👱‍♀️👱👱‍♂️👩‍🦳🧑‍🦳👨‍🦳👩‍🦲🧑‍🦲👨‍🦲🧔‍♀️🧔🧔‍♂️👵🧓👴👲👳‍♀️👳👳‍♂️🧕👼👸🫅🤴👰👰‍♀️👰‍♂️🤵‍♀️🤵🤵‍♂️🙇‍♀️🙇🙇‍♂️💁‍♀️💁💁‍♂️🙅‍♀️🙅🙅‍♂️🙆‍♀️🙆🙆‍♂️🤷‍♀️🤷🤷‍♂️🙋‍♀️🙋🙋‍♂️🤦‍♀️🤦🤦‍♂️🧏‍♀️🧏🧏‍♂️🙎‍♀️🙎🙎‍♂️🙍‍♀️🙍🙍‍♂️💇‍♀️💇💇‍♂️💆‍♀️💆💆‍♂️🤰🫄🫃🤱👩‍🍼🧑‍🍼👨‍🍼🧎‍♀️🧎🧎‍♂️🧍‍♀️🧍🧍‍♂️💃🕺👫👭👬🧑‍🤝‍🧑👩‍❤️‍👨👩‍❤️‍👩💑👨‍❤️‍👨👩‍❤️‍💋‍👨👩‍❤️‍💋‍👩💏👨‍❤️‍💋‍👨❤🧡💛💚💙💜🤎🖤🤍💔❣💕💞💓💗💖💘💝❤️‍🔥❤️‍🩹💟"
    case animalAndNature = "🐶🐱🐭🐹🐰🐻🧸🐼🐻‍❄️🐨🐯🦁🐮🐷🐽🐸🐵🙈🙉🙊🐒🦍🦧🐔🐧🐦🐤🐣🐥🐺🦊🦝🐗🐴🦓🦒🦌🦘🦥🦦🦫🦄🐝🐛🦋🐌🪲🐞🐜🦗🪳🕷🕸🦂🦟🪰🪱🦠🐢🐍🦎🐙🦑🦞🦀🦐🦪🐠🐟🐡🐬🦈🦭🐳🐋🐊🐆🐅🐃🐂🐄🦬🐪🐫🦙🐘🦏🦛🦣🐐🐏🐑🐎🐖🦇🐓🦃🕊🦅🦆🦢🦉🦩🦚🦜🦤🪶🐕🦮🐕‍🦺🐩🐈🐈‍⬛🐇🐀🐁🐿🦨🦡🦔🐾🐉🐲🦕🦖🌵🎄🌲🌳🌴🪴🌱🌿☘🍀🎍🎋🍃🍂🍁🌾🪺🪹🌺🌻🌹🥀🌷🌼🌸🪷💐🍄🐚🪸🌎🌍🌏🌕🌖🌗🌘🌑🌒🌓🌔🌙🌚🌝🌛🌜⭐🌟💫✨☄🪐🌞☀🌤⛅🌥🌦🌧⛈🌩⚡🔥💥❄🌨☃⛄🌬💨🌪🌫🌈☔💧💦🌊"
    case food = "🍏🍎🍐🍊🍋🍌🍉🍇🍓🍈🍒🫐🍑🥭🍍🥥🥝🍅🥑🫒🍆🌶🫑🥒🥬🥦🧄🧅🌽🥕🥗🥔🍠🌰🥜🫘🍯🍞🥐🥖🫓🥨🥯🥞🧇🧀🍗🍖🥩🍤🥚🍳🥓🍔🍟🌭🍕🍝🥪🌮🌯🫔🥙🧆🍜🥘🍲🫕🥫🫙🧂🧈🍥🍣🍱🍛🍙🍚🍘🥟🍢🍡🍧🍨🍦🍰🎂🧁🥧🍮🍭🍬🍫🍿🍩🍪🥠🥮☕🍵🫖🥣🍼🥤🧋🧃🧉🥛🫗🍺🍻🍷🥂🥃🍸🍹🍾🍶🧊🥄🍴🍽🥢🥡"
    case activity = "⚽🏀🏈⚾🥎🎾🏐🏉🎱🥏🪃🏓🏸🥅🏒🏑🏏🥍🥌⛳🏹🎣🤿🥊🥋⛸🎿🛷⛷🏂🏋️‍♀️🏋🏋️‍♂️🤺🤼‍♀️🤼🤼‍♂️🤸‍♀️🤸🤸‍♂️⛹️‍♀️⛹⛹️‍♂️🤾‍♀️🤾🤾‍♂️🧗‍♀️🧗🧗‍♂️🏌️‍♀️🏌🏌️‍♂️🧘‍♀️🧘🧘‍♂️🧖‍♀️🧖🧖‍♂️🏄‍♀️🏄🏄‍♂️🏊‍♀️🏊🏊‍♂️🤽‍♀️🤽🤽‍♂️🚣‍♀️🚣🚣‍♂️🏇🚴‍♀️🚴🚴‍♂️🚵‍♀️🚵🚵‍♂️🎽🎖🏅🥇🥈🥉🏆🏵🎗🎫🎟🎪🤹‍♀️🤹🤹‍♂️🎭🎨🎬🎤🎧🎼🎹🪗🥁🪘🎷🎺🎸🪕🎻🎲🧩♟🎯🎳🪀🪁🛝🎮👾🎰👮‍♀️👮👮‍♂️👩‍🚒🧑‍🚒👨‍🚒👷‍♀️👷👷‍♂️👩‍🏭🧑‍🏭👨‍🏭👩‍🔧🧑‍🔧👨‍🔧👩‍🌾🧑‍🌾👨‍🌾👩‍🍳🧑‍🍳👨‍🍳👩‍🎤🧑‍🎤👨‍🎤👩‍🎨🧑‍🎨👨‍🎨👩‍🏫🧑‍🏫👨‍🏫👩‍🎓🧑‍🎓👨‍🎓👩‍💼🧑‍💼👨‍💼👩‍💻🧑‍💻👨‍💻👩‍🔬🧑‍🔬👨‍🔬👩‍🚀🧑‍🚀👨‍🚀👩‍⚕️🧑‍⚕️👨‍⚕️👩‍⚖️🧑‍⚖️👨‍⚖️👩‍✈️🧑‍✈️👨‍✈️💂‍♀️💂💂‍♂️🥷🕵️‍♀️🕵🕵️‍♂️🤶🧑‍🎄🎅🕴️‍♀️🕴🕴️‍♂️🦸‍♀️🦸🦸‍♂️🦹‍♀️🦹🦹‍♂️🧙‍♀️🧙🧙‍♂️🧝‍♀️🧝🧝‍♂️🧚‍♀️🧚🧚‍♂️🧞‍♀️🧞🧞‍♂️🧜‍♀️🧜🧜‍♂️🧌🧛‍♀️🧛🧛‍♂️🧟‍♀️🧟🧟‍♂️🚶‍♀️🚶🚶‍♂️👩‍🦯🧑‍🦯👨‍🦯🏃‍♀️🏃🏃‍♂️👩‍🦼🧑‍🦼👨‍🦼👩‍🦽🧑‍🦽👨‍🦽👯‍♀️👯👯‍♂️👪👨‍👩‍👧👨‍👩‍👧‍👦👨‍👩‍👦‍👦👨‍👩‍👧‍👧👩‍👩‍👦👩‍👩‍👧👩‍👩‍👧‍👦👩‍👩‍👦‍👦👩‍👩‍👧‍👧👨‍👨‍👦👨‍👨‍👧👨‍👨‍👧‍👦👨‍👨‍👦‍👦👨‍👨‍👧‍👧👩‍👦👩‍👧👩‍👧‍👦👩‍👦‍👦👩‍👧‍👧👨‍👦👨‍👧👨‍👧‍👦👨‍👦‍👦👨‍👧‍👧"
    case travel = "🚗🚙🚕🛺🚌🚎🏎🚓🚑🚒🚐🛻🚚🚛🚜🏍🛵🚲🦼🦽🛴🛹🛼🛞🚨🚔🚍🚘🚖🚡🚠🚟🚃🚋🚝🚄🚅🚈🚞🚂🚆🚇🚊🚉🚁🛩✈🛫🛬🪂💺🛰🚀🛸🛶⛵🛥🚤⛴🛳🚢🛟⚓⛽🚧🚏🚦🚥🛑🎡🎢🎠🏗🌁🗼🏭⛲🎑⛰🏔🗻🌋🗾🏕⛺🏞🛣🛤🌅🌄🏜🏖🏝🌇🌆🏙🌃🌉🌌🌠🎇🎆🛖🏘🏰🏯🏟🗽🏠🏡🏚🏢🏬🏣🏤🏥🏦🏨🏪🏫🏩💒🏛⛪🕌🛕🕍🕋⛩"
    case individual = "⌚📱📲💻⌨🖥🖨🖱🖲🕹🗜💽💾💿📀📼📷📸📹🎥📽🎞📞☎📟📠📺📻🎙🎚🎛⏱⏲⏰🕰⏳⌛🧮📡🔋🪫🔌💡🔦🕯🧯🗑🛢🛒💸💵💴💶💷💰🪙💳🪪🧾💎⚖🦯🧰🔧🪛🔨⚒🛠⛏🪓🪚🔩⚙⛓🪝🪜🧱🪨🪵🔫🧨💣🔪🗡⚔🛡🚬⚰🪦⚱🏺🔮🪄📿🧿🪬💈🧲⚗🧪🧫🧬🔭🔬🕳🩻💊💉🩸🩹🩺🌡🩼🏷🔖🚽🪠🚿🛁🛀🪥🪒🧴🧻🧼🫧🧽🧹🧺🪣🔑🗝🪤🛋🪑🛌🛏🚪🪞🪟🧳🛎🖼🧭🗺⛱🗿🛍🎈🎏🎀🧧🎁🎊🎉🪅🪩🪆🎎🎐🏮🪔✉📩📨📧💌📮📪📫📬📭📦📯📥📤📜📃📑📊📈📉📄📅📆🗓📇🗃🗳🗄📋🗒📁📂🗂🗞📰🪧📓📕📗📘📙📔📒📚📖🔗📎🖇✂📐📏📌📍🧷🪡🧵🧶🪢🔐🔒🔓🔏🖊🖋✒📝✏🖍🖌🔍🔎👚👕🥼🦺🧥👖👔👗👘🥻🩱👙🩲🩳💄💋👣🧦🩴👠👡👢🥿👞👟🩰🥾🧢👒🎩🎓👑⛑🪖🎒👝👛👜💼👓🕶🥽🧣🧤💍🌂☂"
    case sign = "🆔📳🈶🈚🈸🈺🈷🆚🆘⛔📛🚫❌⭕💢♨🚷🚯🚳🚱🔞📵🚭❗❕❓❔‼⁉💯🔅⚠🚸🔰♻🈯💹❇✳❎✅💠🌀➿🌐♾Ⓜ🏧🚾♿🅿🈳🈂🛂🛃🛄🛅🚰🛗🚹🚺🚼🚻🚮🎦📶🈁🆖🆗🆙🆒🆕🆓0️⃣1️⃣2️⃣3️⃣4️⃣5️⃣6️⃣7️⃣8️⃣9️⃣🔟🔢⏸⏯⏹⏺⏭⏮⏩⏪🔀🔁🔂🔼🔽⏫⏬🔄🔤🔡🔠🔣🎵🎶〰➰✔➕➖➗✖🟰💲💱🔚🔙🔛🔝🔜☑🔘🔴🟠🟡🟢🔵🟣🟤⚫⚪🟥🟧🟨🟩🟦🟪🟫⬛⬜🔺🔻🔲🔳🔈🔉🔊🔇📣📢🔔🔕🃏🀄♠♣♥♦🎴👁‍🗨🗨💭🗯💬"
    case flag = "🏳🏴🏁🚩🎌🏴‍☠️🏳️‍🌈🏳️‍⚧️🇦🇨🇦🇩🇦🇪🇦🇫🇦🇬🇦🇮🇦🇱🇦🇲🇦🇴🇦🇶🇦🇷🇦🇸🇦🇹🇦🇺🇦🇼🇦🇽🇦🇿🇧🇦🇧🇧🇧🇩🇧🇪🇧🇫🇧🇬🇧🇭🇧🇮🇧🇯🇧🇱🇧🇲🇧🇳🇧🇴🇧🇶🇧🇷🇧🇸🇧🇹🇧🇼🇧🇾🇧🇿🇨🇦🇨🇨🇨🇩🇨🇫🇨🇬🇨🇭🇨🇮🇨🇰🇨🇱🇨🇲🇨🇳🇨🇴🇨🇷🇨🇺🇨🇻🇨🇼🇨🇽🇨🇾🇨🇿🇩🇪🇩🇯🇩🇰🇩🇲🇩🇴🇩🇿🇪🇨🏴󠁧󠁢󠁥󠁮󠁧󠁿🇪🇪🇪🇬🇪🇭🇪🇷🇪🇸🇪🇹🇪🇺🇫🇮🇫🇯🇫🇰🇫🇲🇫🇴🇫🇷🇬🇦🇬🇧🇬🇩🇬🇪🇬🇫🇬🇬🇬🇭🇬🇮🇬🇱🇬🇲🇬🇳🇬🇵🇬🇶🇬🇷🇬🇸🇬🇹🇬🇺🇬🇼🇬🇾🇭🇰🇭🇳🇭🇷🇭🇹🇭🇺🇮🇨🇮🇩🇮🇪🇮🇱🇮🇲🇮🇳🇮🇴🇮🇶🇮🇷🇮🇸🇮🇹🇯🇪🇯🇲🇯🇴🇯🇵🇰🇪🇰🇬🇰🇭🇰🇮🇰🇲🇰🇳🇰🇵🇰🇷🇰🇼🇰🇾🇰🇿🇱🇦🇱🇧🇱🇨🇱🇮🇱🇰🇱🇷🇱🇸🇱🇹🇱🇺🇱🇻🇱🇾🇲🇦🇲🇨🇲🇩🇲🇪🇲🇬🇲🇭🇲🇰🇲🇱🇲🇲🇲🇳🇲🇴🇲🇵🇲🇶🇲🇷🇲🇸🇲🇹🇲🇺🇲🇻🇲🇼🇲🇽🇲🇾🇲🇿🇳🇦🇳🇨🇳🇪🇳🇫🇳🇬🇳🇮🇳🇱🇳🇴🇳🇵🇳🇷🇳🇺🇳🇿🇴🇲🇵🇦🇵🇪🇵🇫🇵🇬🇵🇭🇵🇰🇵🇱🇵🇲🇵🇳🇵🇷🇵🇸🇵🇹🇵🇼🇵🇾🇶🇦🇷🇪🇷🇴🇷🇸🇷🇺🇷🇼🇸🇦🏴󠁧󠁢󠁳󠁣󠁴󠁿🇸🇧🇸🇨🇸🇩🇸🇪🇸🇬🇸🇭🇸🇮🇸🇰🇸🇱🇸🇲🇸🇳🇸🇴🇸🇷🇸🇸🇸🇹🇸🇻🇸🇽🇸🇾🇸🇿🇹🇦🇹🇨🇹🇩🇹🇫🇹🇬🇹🇭🇹🇯🇹🇰🇹🇱🇹🇲🇹🇳🇹🇴🇹🇷🇹🇹🇹🇻🇹🇼🇹🇿🇺🇦🇺🇬🇺🇳🇺🇸🇺🇾🇺🇿🇻🇦🇻🇨🇻🇪🇻🇬🇻🇮🇻🇳🇻🇺🏴󠁧󠁢󠁷󠁬󠁳󠁿🇼🇫🇼🇸🇽🇰🇾🇪🇾🇹🇿🇦🇿🇲🇿🇼"
}
