import Builders
import SwiftUI
import TextBuilder

struct TermsView: View {
    @Binding var path: NavigationPath
    @AppStorage("isAcceptedAgreements") private var isAcceptedAgreements: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                termsAndConditions()
                Spacer().frame(height: 32)
                HStack {
                    Button(action: {
                        path = NavigationPath()
                    }) {
                        Text("decline").font(.custom("FCIconicBold", size: 24))
                            .foregroundColor(right_gradient)
                            .frame(maxWidth: .infinity, minHeight: 56)
                            .background(white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 56)
                                    .stroke(right_gradient, lineWidth: 2)
                            )
                    }.buttonStyle(.plain)
                    Spacer().frame(width: 16)
                    Button(action: {
                        isAcceptedAgreements = true
                        path = NavigationPath()
                    }) {
                        Text("accept").font(.custom("FCIconicBold", size: 24))
                            .foregroundColor(white)
                            .frame(maxWidth: .infinity, minHeight: 56)
                            .background(primary_gradient)
                            .clipShape(Capsule())
                    }.buttonStyle(.plain)
                }
            }.frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal)
        }.toolbar {
            ToolbarItem(placement: .principal) {
                Text("terms")
                    .font(.custom("FCIconicBold", size: 24)).foregroundColor(primary_black)
            }
        }.navigationBarTitleDisplayMode(.inline).toolbarBackground(white, for: .navigationBar).toolbarBackground(.visible, for: .navigationBar)
    }
}

@TextBuilder
func termsAndConditions() -> Text {
    Text(paragraph1)
        .font(.custom("FCIconicRegular", size: 18)).foregroundColor(neutral06)
    Text(company)
        .font(.custom("FCIconicBold", size: 18)).foregroundColor(neutral06)
    Text(paragraph2Ios)
        .font(.custom("FCIconicRegular", size: 18)).foregroundColor(neutral06)
    Text(thaidotid)
        .font(.custom("FCIconicBold", size: 18)).foregroundColor(neutral06)
    Text(paragraph3)
        .font(.custom("FCIconicRegular", size: 18)).foregroundColor(neutral06)
    Text(terms)
        .font(.custom("FCIconicBold", size: 18)).foregroundColor(neutral06)
    Text(paragraph4)
        .font(.custom("FCIconicRegular", size: 18)).foregroundColor(neutral06)
    Text(service)
        .font(.custom("FCIconicBold", size: 18)).foregroundColor(neutral06)
    Text(paragraph5)
        .font(.custom("FCIconicRegular", size: 18)).foregroundColor(neutral06)
    Text(section1)
        .font(.custom("FCIconicBold", size: 22)).foregroundColor(primary_black)
    Text(section11)
        .font(.custom("FCIconicRegular", size: 18)).foregroundColor(neutral06)
    Text(section2)
        .font(.custom("FCIconicBold", size: 22)).foregroundColor(primary_black)
    Text(section21)
        .font(.custom("FCIconicRegular", size: 18)).foregroundColor(neutral06)
    Text(section3)
        .font(.custom("FCIconicBold", size: 22)).foregroundColor(primary_black)
    Text(section31)
        .font(.custom("FCIconicRegular", size: 18)).foregroundColor(neutral06)
    Text(section4)
        .font(.custom("FCIconicBold", size: 22)).foregroundColor(primary_black)
    Text(section41)
        .font(.custom("FCIconicBold", size: 18)).foregroundColor(neutral06)
    Text(section411)
        .font(.custom("FCIconicRegular", size: 18)).foregroundColor(neutral06)
    Text(section42)
        .font(.custom("FCIconicBold", size: 18)).foregroundColor(neutral06)
    Text(section421)
        .font(.custom("FCIconicRegular", size: 18)).foregroundColor(neutral06)
    Text(section43)
        .font(.custom("FCIconicBold", size: 18)).foregroundColor(neutral06)
    Text(section431)
        .font(.custom("FCIconicRegular", size: 18)).foregroundColor(neutral06)
    Text(section44)
        .font(.custom("FCIconicBold", size: 18)).foregroundColor(neutral06)
    Text(section441)
        .font(.custom("FCIconicRegular", size: 18)).foregroundColor(neutral06)
    Text(section442)
        .font(.custom("FCIconicRegular", size: 18)).foregroundColor(neutral06)
    Text(agree)
        .font(.custom("FCIconicBold", size: 18)).foregroundColor(primary_black)

}

let paragraph1 = "บริษัท ฟินีม่า จำกัด (ซึ่งต่อไปในประกาศนี้ เรียกว่า "
let company = "“บริษัท”"
let paragraph2Ios = ") ได้พัฒนาแอปพลิเคชัน Thai.ID (ซึ่งต่อไปนี้ในประกาศนี้ เรียกว่า "
let thaidotid = "“Thai.ID”"

let paragraph3 =
    ") เพื่ออำนวยความสะดวกแก่ผู้ใช้งานในการพิสูจน์และยืนยันตัวตน ซึ่งรวมไปถึงการทำสำเนาถูกต้องของเอกสารในรูปแบบอิเล็กทรอนิกส์และลงลายมือชื่ออิเล็กทรอนิกส์\n\nบริษัทขอเรียนให้ท่านทราบว่าการที่ท่านสมัครใช้และใช้บริการ Thai.ID ถือว่าท่านได้ตกลงยอมรับข้อตกลงและเงื่อนไขการใช้งาน Thai.ID ฉบันนี้ (ซึ่งต่อไปนี้เรียกว่า "

let terms = "“ข้อกำหนดและเงื่อนไขฯ”"

let paragraph4 =
    ") ตลอดจนข้อกำหนดและเงื่อนไขฯ ที่บริษัทได้แก้ไข เพิ่มเติม หรือเปลี่ยนแปลงในอนาคต กล่าวคือ ข้อกำหนดและเงื่อนไขฯ นี้มีผลผูกพันบริษัทในฐานะผู้ให้บริการและท่านซึ่งเป็นผู้ใช้บริการ โดยระบุถึงรายละเอียดข้อกำหนดและเงื่อนไขของบริการ Thai.ID ซึ่งได้แก่ บริการพื้นฐาน และบริการเสริมอื่น ๆ ของ Thai.ID ที่ท่านได้สมัครใช้บริการในภายหลัง (ซึ่งต่อไปนี้จะเรียกว่า "
let service = "“บริการ”"
let paragraph5 =
    " หากท่านไม่ยอมรับข้อกำหนดและเงื่อนไขฯ บริษัทจะไม่สามารถให้บริการ Thai.ID กับท่านได้ เมื่อท่านได้ยอมรับข้อกำหนดและเงื่อนไขฯ นี้แล้ว แต่ต่อมาให้ภายหลังท่านประสงค์จะที่ไม่ผูกพันตามข้อกำหนดและเงื่อนไขฯ ท่านสามารถทำได้โดยวิธีการลบบัญชีผู้ใช้งาน Thai.ID เท่านั้นซึ่งจะส่งผลให้ท่านไม่สามารถใช้งาน Thai.ID ได้อีกต่อไป\n\nบริษัทขอสงวนสิทธิ์แก้ไข เพิ่มเติม หรือเปลี่ยนแปลงข้อกำหนดและ เงื่อนไขฯ ได้ตลอดเวลาตามที่บริษัทเห็นสมควร โดยจะแจ้งให้ท่านทราบผ่านทาง Thai.ID และผ่านทางเว็บไซต์ https://www.thai.id/ หรืออาจแจ้งให้ทราบผ่านทางช่องทางอื่น ๆ ที่บริษัทเห็นสมควร\n\n"

let section1 = "1. การใช้บริการ Thai.ID"
let section11 =
    "\n\nในการใช้บริการ Thai.ID ท่านรับรองและยืนยันว่าท่านเป็นบุคคลที่มีความสามารถหรือได้รับอนุญาตตามกฎหมายในการเข้าทำสัญญาอันก่อภาระผูกพันภายใต้กฎหมายของประเทศไทยหากท่านเป็นผู้เยาว์ที่มีอายุต่ำกว่า 20 ปี ท่านรับรองและยืนยันว่าท่านได้รับความยินยอมจากผู้ปกครองตามกฎหมายแล้ว\n\n"
let section2 = "2. การจัดการข้อมูลและการคุ้มครองข้อมูลส่วนบุคคล"
let section21 =
    """
    \n\nบริษัทไม่มีการจัดเก็บข้อมูลส่วนบุคคลของท่าน ข้อมูลส่วนบุคคลของท่านสำหรับใช้พิสูจน์และยืนยันตัวตนผ่านการใช้งาน Thai.ID จะถูกจัดเก็บไว้ในโทรศัพท์มือถือของท่าน หากบริษัทมีการปรับปรุงการให้บริการ Thai.ID ในภายหลัง ซึ่งส่งผลให้บริษัทต้องจัดเก็บข้อมูลส่วนบุคคลของท่าน บริษัทจะแจ้งให้ท่านทราบถึงรายละเอียดเกี่ยวกับฐานทางกฎหมาย วัตถุประสงค์ และระยะเวลาในการเก็บรวบรวมและใช้ข้อมูลส่วนบุคคลของท่าน ตลอดจนข้อมูลส่วนบุคคลที่เก็บรวบรวมและใช้ รวมทั้งเงื่อนไขที่บริษัทจะเปิดเผยข้อมูลส่วนบุคคลของท่าน และสิทธิของท่านในฐานะเจ้าของข้อมูลส่วนบุคคลในการดำเนินการจัดการข้อมูลส่วนบุคคลของตน พร้อมทั้งกำหนดช่องทางสำหรับการใช้สิทธิดังกล่าว ใน "ประกาศความเป็นส่วนตัว (Privacy Notice) สำหรับการใช้งานแอปพลิเคชัน Thai.ID" ซึ่งจะปรากฏใน Thai.ID ก่อนที่ท่านจะกรอกข้อมูลสำหรับลงทะเบียนใช้งาน Thai.ID ที่บริษัทได้ปรับปรุงใหม่ \n\nส่วนข้อมูลที่บริษัทใช้วิเคราะห์เพื่อปรับปรุงการให้บริการ Thai.ID นั้น จะมาจากข้อมูลการใช้งานหรือพฤติกรรมการใช้งาน Thai.ID ของท่านเท่านั้น ซึ่งไม่ใช่ "ข้อมูลส่วนบุคคล" ตามนิยามในมาตรา 6 วรรค 2 แห่งพระราชบัญญัติคุ้มครองข้อมูลส่วนบุคคล พ.ศ. 2562\n\n
    """
let section3 = "3. ข้อสงวนสิทธิ"
let section31 =
    "\n\n3.1 บริษัทขอสงวนสิทธิในการแก้ไขหรือเปลี่ยนแปลงข้อกำหนดและเงื่อนไขฯ ทั้งหมดหรือแต่บางส่วน ตามที่บริษัทเห็นสมควร ทั้งนี้ โดยไม่ต้องบอกกล่าวล่วงหน้า\n\n3.2 บริษัทขอสงวนสิทธิในการจำกัดการเข้าถึงการใช้บริการของท่านทั้งหมดหรือเฉพาะบางส่วน โดยขึ้นอยู่กับเงื่อนไข ความจำเป็น หรือเหตุปัจจัยอื่นที่บริษัทเห็นสมควร\n\n3.3 บริษัทขอสงวนสิทธิในการหยุดการให้บริการทั้งหมดหรือเฉพาะบางส่วนโดยไม่ต้องบอกกล่าวล่วงหน้าแก่ท่านในกรณีดังต่อไปนี้\n\n• เมื่อทำการบำรุงรักษาและซ่อมแซมระบบ\n• เมื่อไม่สามารถให้บริการได้เนื่องจากเหตุสุดวิสัยบางประการ เช่น อุบัติเหตุ ปรากฏการณ์ธรรมชาติ สงคราม การจลาจล ข้อพิพาทแรงงาน ฯลฯ\n• เมื่อระบบเกิดความขัดข้อง หรือมีการใช้งานระบบมากเกินกำลัง(Overload)\n• เมื่อระบบถูกแทรกแซงการให้บริการหรือถูกเจาะเข้าระบบ (Hack)เพื่อรักษาความปลอดภัยของท่าน หรือบุคคลอื่น หรือเพื่อดำเนินภารกิจอันเป็นประโยชน์ต่อสาธารณะในกรณีฉุกเฉิน\n• เมื่อบริษัทเห็นว่ามีความจำเป็นและเป็นการสมควรนอกจากกรณีที่ได้ระบุไว้ข้างต้น\n\n3.4 บริษัทขอสงวนสิทธิที่ในการลงโฆษณาของ Thai.ID หรือของบุคคลภายนอกบนระบบการให้บริการ\n\n3.5 บริษัทขอสงวนสิทธิไม่รับรองการสำรองเนื้อหาหรือข้อมูลจากท่านแต่อย่างใด ไม่ว่าทั้งหมดหรือบางส่วน\n\n3.6 บริษัทขอยืนยันว่า บริษัทได้ปฏิบัติตามมาตรการที่กฎหมายกำหนดในการให้บริการ Thai.ID อย่างไรก็ตาม บริษัทของสงวนสิทธิไม่รับประกันใด ๆ ว่า บริการนั้นปราศจากข้อบกพร่อง มีความมั่นคงปลอดภัยทางสารสนเทศ หรือมีความถูกต้องสมบูรณ์\n\n3.7 บริษัทขอสงวนสิทธิในการลบเนื้อหาหรือข้อมูลจากท่าน โดยไม่ต้องบอกกล่าวล่วงหน้า หากบริษัทเห็นว่าท่านได้ฝ่าฝืนหรืออาจฝ่าฝืนกฎหมาย กฎ ระเบียบ ประกาศ หรือคำสั่งที่ออกโดยหน่วยงานราชการ หรือข้อกำหนดและเงื่อนไขฯ ฉบับนี้\n\n"
let section4 = "4. ข้อตกลงอื่น ๆ"
let section41 = "\n\n4.1. ทรัพย์สินทางปัญญา"
let section411 =
    "\nข้อกำหนดและเงื่อนไขฉบับนี้ไม่ถือเป็นการอนุญาตให้ท่านใช้ทรัพย์สินทางปัญญาใด ๆ ของบริษัท แม้ว่าอาจมีถ้อยคำดังต่อไปนี้ปรากฏบนหน้าจอในการใช้บริการ เช่น “การซื้อ” “การขาย” และถ้อยคำอื่น ๆ ซึ่งมีความหมายคล้ายคลึงกัน ในกรณีนี้บริษัทจะยังคงเป็นเจ้าของและเป็นผู้ดำรงซึ่งสิทธิ กรรมสิทธิ์ และส่วนได้ส่วนเสียทั้งหมดที่มีอยู่ในและที่มีต่อ Thai.ID รวมถึงทรัพย์สินทางปัญญาที่เกี่ยวข้องทั้งหมด สิทธิดังกล่าวจะไม่ถูกโอนไปให้แก่ท่านซึ่งเป็นผู้ใช้บริการแต่อย่างใด ท่านจะได้รับสิทธิในการใช้งานตามที่ได้ระบุไว้ข้างต้นเท่านั้น\n\n"
let section42 = "4.2. ข้อจำกัดความรับผิดของ Thai.ID"
let section421 =
    "\nบริษัทจะไม่รับผิดชอบใด ๆ ต่อความเสียหายอันเกิดจากการกระทำของท่านอันเกี่ยวเนื่องกับการใช้บริการ Thai.ID เว้นเสียแต่ความเสียหายดังกล่าวมีส่วนเกิดจากการกระทำโดยเจตนาหรือโดยประมาทเลินเล่ออย่างร้ายแรงของบริษัท โดยบริษัทมีหน้าที่ใช้ค่าสินไหมทดแทนอันเกิดจากการละเมิดนั้น\n\n"
let section43 = "4.3. ความรับผิดของผู้ใช้งาน"
let section431 =
    "\nในการใช้งาน Thai.ID หากท่านไม่ปฏิบัติตามหรือละเมิดข้อกำหนดและเงื่อนไขฯ นี้ หรือไม่ปฏิบัติตามหรือฝ่าฝืนกฎหมายที่เกี่ยวข้อง และส่งผลให้เกิดความเสียหายต่อบริษัทไม่ว่าทางตรงหรือทางอ้อม ท่านต้องชดใช้ค่าเสียหายตามที่บริษัทเรียกร้องโดยทันที\n\n"
let section44 = "4.4. กฎหมายที่ใช้บังคับและเขตอำนาจศาล"
let section441 =
    "\n4.4.1. การตีความข้อกำหนดและเงื่อนไขฯ ฉบับนี้ให้อยู่ภายใต้บังคับของกฎหมายแห่งราชอาณาจักรไทย หากข้อความใดของข้อกำหนดและเงื่อนไขฯ ละเมิดกฎหมายดังกล่าว ให้ข้อความนั้นไม่มีผลผูกพันระหว่างบริษัทและท่าน แต่ข้อความอื่นที่เหลืออยู่ยังคงมีผลผูกพัน\n\n"
let section442 = "4.4.2. ข้อพิพาทเกิดขึ้นจากการใช้บริการ Thai.ID ระหว่างบริษัทและท่านให้อยู่ภายใต้เขตอำนาจของศาลยุติธรรมแห่งราชอาณาจักรไทย\n\n"
let agree = "ข้าพเจ้าได้อ่านและรับทราบเนื้อหาของข้อกำหนดและเงื่อนไขฯ ฉบับนี้ จึงได้กด “ยินยอม” เพื่อยอมรับข้อกำหนดและรายละเอียดข้างต้นทั้งหมด"
