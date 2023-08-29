QuizAttempt.destroy_all
Quiz.destroy_all
Category.destroy_all

appointment = Category.create(category_name: 'アポイントメント')
# schedule = Category.create(category_name: '日程調整')

# アポイント1
  sentence_japanese1 = <<~TEXT
    件名:アポイントメントのお願い

    グルーバー様

    ご健勝のことと存じます。
    販売店契約に向けた準備が最終段階に入ってきたように思います。
    詳細を決定するため、貴社を訪問させていただければと考えております。
    あなたの市場やあなたの会社、また、あなたについて、もっと知ることができるように、直接対面してのミーティングの機会をいただけましたら幸いです。
    6月の第2週または第3週でいくつかご都合のよいお日にちをお知らせいただけますでしょうか。

    鈴木絵里
    海外事業部
    ABCカンパニー
  TEXT
  sentence_japanese1_array = sentence_japanese1.split("\n")

  sentence_english1 = <<~TEXT
    Subject: Request for an appointment
    Dear Mr. Gruber,
    I hope you are well.
    It seems that preparations for the reseller agreement are entering the final phase.
    I was wondering if I could visit you to confirm and finalize the details.
    I'd be very interested in having a face-to-face meeting with you to learn more about your market, your company and you.
    May I ask you for some possible dates in the 2nd or 3rd week of June?
    Sincerely,
    Eri Suzuki
    Overseas Business Department
    ABC Company
  TEXT
  sentence_english1_array = sentence_english1.split("\n")
  appointment.quizzes.create(title: '１．訪問を打診する', sentence_japanese: sentence_japanese1_array.to_json, sentence_english: sentence_english1_array.to_json)

# アポイント2
  sentence_japanese2 = <<~TEXT
    件名: アポイントメントの確認

    グルーバー様

    早速のご返信どうもありがとうございます。
    6月21日から3日間、大丈夫です。喜んでその日程で伺います。
    いくつか質問させてください。
    - どちらのオフィスに伺えばよいでしょうか。本社か、他の拠点でしょうか。
    - そのオフィスの最寄り駅と、便利なホテルをお知らせいただけますでしょうか。
    - 6月21日は何時頃お会いできますでしょうか。
    親切なサポートに予め御礼申し上げます。

    鈴木絵里
  TEXT
  sentence_japanese2_array = sentence_japanese2.split("\n")

  sentence_english2 = <<~TEXT
    Subject: Confirmation of appointment
    Dear Mr. Gruber,
    Thank you very much for your prompt reply.
    Three days from June 21st works well for me. I'd be delighted to visit you on those dates.
    May I ask you a couple of questions?
    - Which office should I visit; HQ or another location?
    - Could you let me know the nearest station to your office and a convenient hotel?
    - At what time would you like to meet on June 21?
    Thanking you in advance for your help and advice.
    Sincerely,
    Eri Suzuki
  TEXT
  sentence_english2_array = sentence_english2.split("\n")
  appointment.quizzes.create(title: '２．訪問日程を決め、関連する質問をする', sentence_japanese: sentence_japanese2_array.to_json, sentence_english: sentence_english2_array.to_json)

# アポイント3
  sentence_japanese3 = <<~TEXT
    件名:アポイントメントの確認

    グルーバー様

    問題ございません。6月21日15:00に貴社本社でお会いしましょう。
    私はXXX航空のXX123便で2017年6月21日10:10にリンツ空港に到着します。
    帰りは23日金曜日18:30のフライトを予約しました。
    宿泊に関して、ご厚情誠にありがとうございます。
    お手数ですが21日から2晩のご手配をお願いできますでしょうか。
    私もあなたにお会いできることを楽しみにしております。

    鈴木絵里
  TEXT
  sentence_japanese3_array = sentence_japanese3.split("\n")

  sentence_english3 = <<~TEXT
    Subject: Confirmation of appointment
    Dear Mr. Gruber,
    That sounds great - headquarters at 15:00 on June 21.
    I'll be arriving at Linz Airport on XXX Airways Flight XX123 at 10:10 on 2017-06-21.
    I've booked a return flight for 18:30 on Friday 23rd.
    Thank you very much for your kindness in arranging the accommodation.
    Would you mind reserving two nights from the 21st?
    I'm looking forward to meeting you, too.
    Sincerely,
    Eri Suzuki
  TEXT
  sentence_english3_array = sentence_english3.split("\n")
  appointment.quizzes.create(title: '３．訪問予定を確定する', sentence_japanese: sentence_japanese3_array.to_json, sentence_english: sentence_english3_array.to_json)
