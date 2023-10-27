ArticleReading.destroy_all
QuizAttempt.destroy_all
Quiz.destroy_all
Article.destroy_all
Category.destroy_all
Post.destroy_all
User.destroy_all

# ユーザー1の作成
user1 = User.create(
  email: "user1@example.com",
  password: "11111111",
  name: "User 1",
  occupation: "営業"
)
# ユーザー1の投稿
Post.create(
  title: "Sample Post 1",
  content: "This is the content for the first sample post.",
  genre: "メールの構成とフォーマット",
  user_id: user1.id
)

# ユーザー2の作成
user2 = User.create(
  email: "user2@example.com",
  password: "11111111",
  name: "User 2",
  occupation: "営業"
)
# ユーザー2の投稿
Post.create(
  title: "Sample Post 2",
  content: "This is the content for the first sample post.",
  genre: "件名の書き方",
  user_id: user2.id
)

# ユーザー3の作成
user3 = User.create(
  email: "user3@example.com",
  password: "11111111",
  name: "User 3",
  occupation: "営業"
)
# ユーザー3の投稿
Post.create(
  title: "Sample Post 3",
  content: "This is the content for the first sample post.",
  genre: "コミュニケーションとエチケット",
  user_id: user3.id
)

# ユーザー4の作成
user4 = User.create(
  email: "user4@example.com",
  password: "11111111",
  name: "User 4",
  occupation: "営業"
)
# ユーザー4の投稿
Post.create(
  title: "Sample Post 4",
  content: "This is the content for the first sample post.",
  genre: "メールのトーンやスタイル",
  user_id: user4.id
)

# ユーザー5の作成
user5 = User.create(
  email: "user5@example.com",
  password: "11111111",
  name: "User 5",
  occupation: "営業"
)
# ユーザー5の投稿
Post.create(
  title: "Sample Post 5",
  content: "This is the content for the first sample post.",
  genre: "フォローアップメールのテクニック",
  user_id: user5.id
)

# ユーザー6の作成
user6 = User.create(
  email: "user6@example.com",
  password: "11111111",
  name: "User 6",
  occupation: "営業"
)
# ユーザー6の投稿
Post.create(
  title: "Sample Post 6",
  content: "This is the content for the first sample post.",
  genre: "問い合わせや要求を行うメール",
  user_id: user6.id
)

# ユーザー7の作成
user7 = User.create(
  email: "user7@example.com",
  password: "11111111",
  name: "User 7",
  occupation: "営業"
)
# ユーザー7の投稿
Post.create(
  title: "Sample Post 7",
  content: "This is the content for the first sample post.",
  genre: "お礼や謝罪のメール",
  user_id: user7.id
)

# ユーザー8の作成
user8 = User.create(
  email: "user8@example.com",
  password: "11111111",
  name: "User 8",
  occupation: "営業"
)
# ユーザー8の投稿
Post.create(
  title: "Sample Post 8",
  content: "This is the content for the first sample post.",
  genre: "異文化間のコミュニケーション",
  user_id: user8.id
)

# ユーザー9の作成
user9 = User.create(
  email: "user9@example.com",
  password: "11111111",
  name: "User 9",
  occupation: "営業"
)
# ユーザー9の投稿
Post.create(
  title: "Sample Post 9",
  content: "This is the content for the first sample post.",
  genre: "ビジネスメールの語彙やフレーズ",
  user_id: user9.id
)

# ユーザー10の作成
user10 = User.create(
  email: "user10@example.com",
  password: "11111111",
  name: "User 10",
  occupation: "営業"
)
# ユーザー10の投稿
Post.create(
  title: "Sample Post 10",
  content: "This is the content for the first sample post.",
  genre: "緊急時やトラブル時のメール",
  user_id: user10.id
)

# ユーザー11の作成
user11 = User.create(
  email: "user11@example.com",
  password: "11111111",
  name: "User 11",
  occupation: "営業"
)
# ユーザー11の投稿
Post.create(
  title: "Sample Post 11",
  content: "This is the content for the first sample post.",
  genre: "同僚や上司へのメール",
  user_id: user11.id
)

# ユーザー12の作成
user12 = User.create(
  email: "user12@example.com",
  password: "11111111",
  name: "User 12",
  occupation: "営業"
)
# ユーザー12の投稿
Post.create(
  title: "Sample Post 12",
  content: "This is the content for the first sample post.",
  genre: "取引先や顧客へのメール",
  user_id: user12.id
)

# ユーザー13の作成
user13 = User.create(
  email: "user13@example.com",
  password: "11111111",
  name: "User 13",
  occupation: "営業"
)
# ユーザー13の投稿
Post.create(
  title: "Sample Post 13",
  content: "This is the content for the first sample post.",
  genre: "提案のメール",
  user_id: user13.id
)

# ユーザー14の作成
user14 = User.create(
  email: "user14@example.com",
  password: "11111111",
  name: "User 14",
  occupation: "営業"
)
# ユーザー14の投稿
Post.create(
  title: "Sample Post 14",
  content: "This is the content for the first sample post.",
  genre: "会議やイベントの調整メール",
  user_id: user14.id
)

# ユーザー15の作成
user15 = User.create(
  email: "user15@example.com",
  password: "11111111",
  name: "User 15",
  occupation: "営業"
)
# ユーザー15の投稿
Post.create(
  title: "Sample Post 15",
  content: "This is the content for the first sample post.",
  genre: "情報共有",
  user_id: user15.id
)

# ユーザー16の作成
user16 = User.create(
  email: "user16@example.com",
  password: "11111111",
  name: "User 16",
  occupation: "営業"
)
# ユーザー16の投稿
Post.create(
  title: "Sample Post 16",
  content: "This is the content for the first sample post.",
  genre: "その他",
  user_id: user16.id
)

appointment = Category.create(category_name: 'アポイントメント')
schedule_one = Category.create(category_name: '日程調整(会議の参加依頼と日程打診)')
schedule_two = Category.create(category_name: '日程調整(日程決定の案内と出席依頼)')
basic = Category.create(category_name_article: '基礎チェック問題')

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
  appointment.quizzes.create(
    title: '1.訪問を打診する',
    sentence_japanese: sentence_japanese1_array.to_json,
    sentence_english: sentence_english1_array.to_json
  )

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
  appointment.quizzes.create(
    title: '2.訪問日程を決め、関連する質問をする',
    sentence_japanese: sentence_japanese2_array.to_json,
    sentence_english: sentence_english2_array.to_json
  )

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
  appointment.quizzes.create(
    title: '3.訪問予定を確定する',
    sentence_japanese: sentence_japanese3_array.to_json,
    sentence_english: sentence_english3_array.to_json
  )

# 日程調整1
sentence_japanese4 = <<~TEXT
件名：コリンズさんとの会議
アジア市場チームメンバーの皆さま
おはようございます。
グローバルセールスマネージャーのコリンズさんが、地域ごとの販売実績の振り返りのため、私たちと電話会議をしたいそうです。
16日火曜日までに、下記日程の皆さんのご都合をお知らせいただけますか？
23日（火）10時～11時
24日（水）15時～16時
26日（金）9時～10時または14時～15時
以上、よろしくお願いします。
田中 太郎
TEXT
sentence_japanese4_array = sentence_japanese4.split("\n")

sentence_english4 = <<~TEXT
Subject: Meeting with Mr. Collins
Dear Asian Market team members,
Good morning.
Our Global Sales Manager Mr Collins would like to have a call with us to go over the sales results by area.
Could you please let me know your availability at the following dates/times by Tuesday 16?
23rd Tue 10:00-11:00
24th Wed 15:00-16:00
26th Fri 9:00-10:00 or 14:00-15:00
Best regards,
Taro Tanaka
TEXT
sentence_english4_array = sentence_english4.split("\n")
schedule_one.quizzes.create(
title: '1.メールでの回答依頼',
sentence_japanese: sentence_japanese4_array.to_json,
sentence_english: sentence_english4_array.to_json
)


# 日程調整2
sentence_japanese5 = <<~TEXT
件名：コンセプト決定会議
プロジェクトメンバーの皆さん
こんにちは。
ご承知の通り、私たちは新製品のコンセプトを今月末までに最終化させるよう求められています。
ですから、結論を出すためにもう一回会議をする必要があります。
グループウェアで見たところ全員予定が空いているようだったので、23日（火）の午前10時～11時にミーティングを設定しました。
問題がなければよいのですが。もしどなたかご都合の合わないときはお知らせください。
ところで、このメールはアキラ、ボブ、チカ、デイヴィッドにお送りしています。もし他にお誘いしたい方がいましたらお知らせください。
よろしく。
鈴木 絵里
TEXT
sentence_japanese5_array = sentence_japanese5.split("\n")

sentence_english5 = <<~TEXT
Subject: Meeting to decide the concept
Dear project members,
Good afternoon.
As we are all aware, we have been requested to finalize the concept for the new product by the end of this month.
So, we need to have another meeting to make the final decision.
I've booked the meeting room from 10 am to 11 am on Tue 23rd on Groupware as it seems everyone is available at the time.
I hope it works for you. If this is not convenient for any of you, please let me know.
By the way, I'm writing to the four of you: Akira, Bob, Chika and David. If you would like to invite any additional people, please let me know.
Cheers,
Eri Suzuki
TEXT
sentence_english5_array = sentence_english5.split("\n")
schedule_one.quizzes.create(
title: '2.グループウェアで設定したスケジュールの確認',
sentence_japanese: sentence_japanese5_array.to_json,
sentence_english: sentence_english5_array.to_json
)


# 日程調整3
sentence_japanese6 = <<~TEXT
件名：コンセプト決定会議
プロジェクトメンバーの皆さん
こんにちは。
新製品のコンセプトを最終決定するミーティングを設定したく、皆さんにご連絡します。今月末までにもう一度議論する必要があるのは間違いありません。
オンラインの日程調整ツールでフォームを用意しました。
16日火曜日までに、以下のリンクを開いて、そちらから回答していただけますか？
オンラインスケジューリングツールはこちら
以上、よろしくお願いいたします。
鈴木 絵里
TEXT
sentence_japanese6_array = sentence_japanese6.split("\n")

sentence_english6 = <<~TEXT
Subject: Meeting to decide the concept
Dear project members,
Good afternoon.
I'm writing to you all to set up a meeting to finalize the concept for the new product. We definitely need another discussion before the end of the month.
I've prepared a form on Online Scheduling Tool to set the schedule.
Please visit the link below and fill in the form by Tuesday 16.
Click here to access Online Scheduling Tool
Best regards,
Eri Suzuki
TEXT
sentence_english6_array = sentence_english6.split("\n")
schedule_one.quizzes.create(
title: '3.日程調整ツールでの回答依頼',
sentence_japanese: sentence_japanese6_array.to_json,
sentence_english: sentence_english6_array.to_json
)


# 日程調整4
sentence_japanese7 = <<~TEXT
件名:Re: コンセプト決定会議
こんにちは、皆さん
早速のご回答ありがとうございます。1月23日火曜日 午前10時から11時まで、3番会議室にてコンセプト決定会議を開催いたします。
皆さんにもうすぐお会いできることを楽しみにしております。
よろしくお願いします。
鈴木 絵里
TEXT
sentence_japanese7_array = sentence_japanese7.split("\n")

sentence_english7 = <<~TEXT
Subject: Re: Meeting to decide the concept
Hello all,
Thank you for your prompt response. This is to announce that the concept decision meeting will be held in meeting room #3 from 10:00 a.m. to 11:00 a.m. on Tuesday, 23rd January.
I look forward to seeing you all then.
Best,
Eri Suzuki
TEXT
sentence_english7_array = sentence_english7.split("\n")
schedule_two.quizzes.create(
title: '1.会議室に集まる場合',
sentence_japanese: sentence_japanese7_array.to_json,
sentence_english: sentence_english7_array.to_json
)

# 日程調整5
sentence_japanese8 = <<~TEXT
件名:Re:コリンズさんとの会議
皆さま、ご返信くださりありがとうございました。
私たちの会議を1月24日の15時からに設定いたしました。
時間の数分前になりましたら、URLにアクセスしてください。
会議の議題は
1. 関東の販売実績 … 15分
2. 関西の販売実績 … 15分
3. 九州の販売実績 … 15分
4. 質疑応答、議論 … 15分
の予定です。
当日使用する資料やスライドを、24日の午後1時までに共有してください。
コリンズさんは私たちと話すのを楽しみにされています。
以上、よろしくお願いします。
田中 太郎

TEXT
sentence_japanese8_array = sentence_japanese8.split("\n")

sentence_english8 = <<~TEXT
Subject: Re: Meeting with Mr. Collins
Dear all,
Thank you very much for your replies.
Our meeting is scheduled from 15:00 on Wednesday 24th January.
Please access the following link a couple of minutes before the meeting is scheduled to start.
The agenda of the meeting is:
1. Kanto sales result … 15min
2. Kansai sales result … 15min
3. Kyushu sales result … 15min
4. Q&A, discussion … 15min
Please share any documents and/or slides you'll be using before 1 p.m. on 24th.
Mr Collins is looking forward to talking with us all then.
Kind regards,
Taro Tanaka

TEXT
sentence_english8_array = sentence_english8.split("\n")
schedule_two.quizzes.create(
title: '2.Web会議の場合',
sentence_japanese: sentence_japanese8_array.to_json,
sentence_english: sentence_english8_array.to_json
)

# 日程調整6
sentence_japanese9 = <<~TEXT
件名：コンセプト決定会議リスケ
皆さんこんにちは。
残念ながら、前日お伝えした日程では全員の都合が合うものが一つもありませんでした。代わりに、以下の提案の中で合うものはないでしょうか？
2月6日（火）10:00～または11:00～または14:00～の1時間
2月7日（水）14:00～または16:00～の1時間
1月19日までにご返信いただけるとありがたいです。
よろしく。
絵里

TEXT
sentence_japanese9_array = sentence_japanese9.split("\n")

sentence_english9 = <<~TEXT
Subject: Rescheduling our meeting to decide the concept
Hi everyone,
Unfortunately, none of the dates I mentioned work for all of us.Do any of the following alternative proposals suit you?
1hr from 10:00 or 11:00 or 14:00 on Tue, 6th Feb
1hr from 14:00 or 16:00 on Wed, 7th Feb
I'd appreciate your reply by Jan 19.
Cheers,
Eri

TEXT
sentence_english9_array = sentence_english9.split("\n")
schedule_two.quizzes.create(
title: '3.会議を再調整する場合',
sentence_japanese: sentence_japanese9_array.to_json,
sentence_english: sentence_english9_array.to_json
)


# 記事1
article_content1 = <<~TEXT
<<SPACE>>
  英文ビジネスメールの基本となるフォーマットを確認しましょう。  基本的には日本語のメールの構成とほとんど同じです。
<<SPACE>>
<<SPACE>>
①件名
Subject:New order request for (____).
②宛名
Dear Mr.Wirt,
③書き出し
Thank you for the quotation for (____).
④用件
As discussed internally,we would like to
place an order for (____).
⑤結び
Thank you for your continuous support.
⑥結語
Best Regards,
⑦差出人の会社名、名前
ABC Corporation
Hanako Tanaka
<<SPACE>>
次に①～⑦について詳細を解説していきます。
<<SPACE>>
<<SPACE>>

① 件名
英文ビジネスメールでの件名は、見てすぐに用件が分かるように具体的かつ端的に書くことがポイントです。例えば、次のように書くのが理想的です。
<<SPACE>>
<<SPACE>>
・Quotation request for (   )
(   )の見積り依頼
・Inquiry regarding the delivery time
納期についての問い合わせ
・Request for an appointment for a meeting
会議アポイントメントのご依頼
・Personnel announcement
人事発表
・Urgent delivery request for (   )
()について緊急発送依頼
<<SPACE>>
<<SPACE>>
注意点として、「Inquiry（問い合わせ）」や「Quotation（見積書）」など一言で済ませるのは避けましょう。スパムと間違えられ、メールを読まれずに削除されてしまう可能性があります。そのため件名は具体的に書くように工夫しましょう。また、緊急の依頼の場合は件名に「Urgent（緊急）」や、「Heads-up（注意喚起）」を入れると相手に注意を払ってもらうことができます。
<<SPACE>>
<<SPACE>>

② 宛名
宛名は、取引先との距離感によって使い分けが必要です。ここでは複数の例を紹介しますので、適切なものを選んでくださいね。
<<SPACE>>
<<SPACE>>
・Dear Mr. / Ms. ＋ラストネーム,
ラストネームとは苗字です。これが一番フォーマルです。初めての取引先や、社長や役員など位の高い人に対して使うとよいでしょう。英語には、既婚女性に対するMrs.や未婚女性に対するMiss. という敬称がありますが、ビジネスでは未婚・既婚に関わらずMs. が使われます。
・Dear ＋ファーストネーム,
ファーストネームとは名前です。すでにやり取りをしたことがあり、信頼関係が成り立っている相手に対してはファーストネームで構いません。
・To whom it may concern,
日本語の「ご担当者様」のように、担当者が不明の場合に使えます。
・Dear Sir or Madam,
これも担当者名が不明の場合に使いますが、「To whom it may concern」よりも一般的です。
・Dear Colleagues,
社内メールで複数人に一斉送信する際に使います。
<<SPACE>>
<<SPACE>>

③ 書き出し
英文ビジネスメールの書き出しは、挨拶や自己紹介から始めましょう。特に面識のない相手に送る場合は、しっかり自己紹介をすることが重要です。
<<SPACE>>
<<SPACE>>
・My name is Hiroshi Tanaka.
田中博と申します。
・My name is Hiroshi Tanaka. I am an overseas sales manager.
私は田中博と申します。国際営業部のマネージャーを担当しております。
・My name is Hiroshi Tanaka.
It was a great pleasure to meet you at the exhibition in Shanghai last week.
田中博と申します。
先週は、上海の展示会でお目にかかれて光栄でした。
・My name is Hiroshi Tanaka. I will be Mr. Suzuki's successor from April.
田中博と申します。4月より鈴木の後任をさせていただきます。
<<SPACE>>
<<SPACE>>
日本語の社内におけるビジネスメールでは、冒頭に「お疲れ様です。」と記載することがほとんどですが、英語には「お疲れ様」にあたる表現はありません。その代わりに、下記のような相手を気遣うフレーズを使いましょう。
<<SPACE>>
<<SPACE>>
・I hope this finds you well.
お元気でお過ごしでしょうか。
・I hope you had a nice holiday.
よい休暇を過ごされましたでしょうか。
<<SPACE>>
<<SPACE>>

④ 用件
メールの本文では、なぜこのメールを書いているかという理由を簡潔に述べてから本題に入りましょう。
・I am writing with regard to confirming the delivery time.
納期について確認したくご連絡しております。
・This is to inform you that we have received your payment on April 1st.
4月1日にご入金の確認ができましたことをご連絡いたします。
・I am writing this on behalf of Mr. Suzuki.
鈴木の代理でご連絡させていただいております。
<<SPACE>>
<<SPACE>>
⑤ 締めの言葉
本文の最後は、締めの文章でメールを締めましょう。締めの文章だからといって決まり文句ばかりを使うのではなく、「返信が欲しい」「スケジュール調整を依頼したい」など目的を明確にすることで、より効率的なやりとりが可能になります。
・I look forward to hearing from you soon.
ご返信お待ちしております。
・Should you have any questions, please contact us at any time.
ご不明な点がございましたら、いつでもご連絡ください。
・Thank you for your cooperation.
ご協力ありがとうございます。
・Thank you in advance.
よろしくお願いいたします。
<<SPACE>>
<<SPACE>>
⑥ 結語
日本語のビジネスレターに用いられる、「敬具」や「かしこ」にあたる結語（Sign-Off）が英語にも存在します。いくつか種類があるので、シチュエーション別に適切なものを選んで使いましょう。
フォーマル
・Yours sincerely,
・Sincerely,
ややフォーマル
・With best regards,
・With kindest regards,
・Best regards,
・Kind regards,
・Thank you and Best regards,
ビジネスでは Best regards, もしくは Kind regards, が最も多く使われます。Kind regards, は Best regards, よりもフォーマルな印象があります。
<<SPACE>>
<<SPACE>>

⑦ 差出人名
英文ビジネスメールの末尾には、差出人名として自分の会社名や名前、連絡先を記載します。日本語とは順番が逆で、英語では以下の順になるので注意しましょう。

1.個人名
2.役職
3.部署名
4.会社名
5.会社住所・郵便番号
6.メールアドレス
7.電話番号・（ファックス番号）
8.会社WebサイトURL
<<SPACE>>
<<SPACE>>
具体例
Hiroshi Tanaka (Mr.)
Sales manager
Overseas Sales Department
ABC Corporation
123 ABC, Shinjuku, Tokyo, Japan, 160-0000
h.tanaka@example.com
+81(0)3-1234-5678
URL:https://…


TEXT
article_content1_array = article_content1.split("\n")
basic.articles.create(
  title: '英文ビジネスメールの基本フォーマット',
  content: article_content1_array.to_json,
  icon_name: 'mdi-note'
)
# 記事2
article_content2 = <<~TEXT
<<SPACE>>
・I hope you are well.
お元気にお過ごしでしょうか。

・It was a pleasure meeting you last week.
先週はお会いできて光栄です。

TEXT
article_content2_array = article_content2.split("\n")
basic.articles.create(
  title: '挨拶のメール',
  content: article_content2_array.to_json,
  icon_name: 'mdi-human-greeting'
)
# 記事3
article_content3 = <<~TEXT
<<SPACE>>
<<SPACE>>
**１．訪問を打診する**
ここでは、一連のやり取りをリアルにシミュレーションする、ということで、あなたが海外の販売店候補を訪問する、という設定で進めてゆきます。契約内容についてはメールのやり取りで既に概ね合意しており、契約締結のサインをもらうにあたって、今一度対面して最終確認をしたい、という状況です。また、先方の販売ネットワークも実態を見ておきたい、という思惑もあります。

メールの例文を見てみましょう。

―――
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
―――
<<SPACE>>
（和訳）
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
―――

これはあくまで一つのサンプルですが、ここで意図しているのは以下の3点です。
１）現状の共通認識を作る（「契約に向けた準備が最終段階」）
２）訪問の意図と期待を伝える（「詳細を決定」、「直接対面」）
３）相手に確実に回答をもらう（質問を一つに絞る、クローズドクエスチョンを利用）
お互いに誤解が生じないような分かりやすい表現をするのもポイントですね。



さて、先方からは以下のようなメールが返ってきたとします。

―――
Subject: Re Request for an appointment

Dear Ms. Suzuki,

Thank you for your message. I hope things are going well at your end, too.
I appreciate your offer to visit us to finalize the agreement.
Unfortunately, I will be out of the office during the period you mention.
Would it be possible for you to stay two or three days from Wednesday June 21?
We would be happy to hold a meeting and be delighted to show you around our shops.

Best regards,

Andreas Gruber
Senior Marketing Manager
XYZ Corporation
―――
<<SPACE>>
（和訳）
件名:返信 アポイントメントのお願い

鈴木様

メッセージありがとうございます。あなたもご健勝のことと存じます。
契約の確定に向けてのあなたのご訪問のお申し出に心から感謝いたします。
残念ながら、いただいた期間ですと、私がオフィスを離れております。
6月21日水曜日から2、3日間、ご滞在されることは可能でしょうか？
ぜひ、ミーティングをしたり、店舗をご案内したりできればと思います。

アンドレアス・グルーバー
シニア・マーケティング・マネージャー
XYZコーポレーション
―――

こちらの提示した範囲の日程ではありませんでしたが、無事に日程の候補をもらうことができました。
<<SPACE>>
<<SPACE>>
**２．訪問日程を決め、関連する質問をする**
先方が提示した日程で問題がなければ、具体的に訪問時間や訪問先となる先方拠点などを定め、航空券や宿泊の手配を進めます。先方の拠点の所在地によっては、主要駅でのピックアップを依頼したり、先方付近のホテルを紹介してもらったりすることもあるでしょう。そんなときのメールの一例をご紹介します。

―――
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
―――
<<SPACE>>
（和訳）
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
―――

いかがでしたか？文例では、日程を確定させたうえで、フライトやホテルの手配が進めるのに必要な情報を質問しています。ここでは、質問に漏れなく答えてもらえるように箇条書きを利用しています。



このメールへの返信は例えば以下のようになります。

―――
Subject: Re Confirmation of appointment

Dear Ms. Suzuki,

We are glad to hear that those days work for you.
How about meeting at our headquarters in Linz at 15:00 on June 21?
Linz Central station is the nearest station to our office.
Please let me know your outbound and return flight schedule.
We will reserve a room at Hotel XXX for you.
I'm looking forward to meeting you.

Best regards,

Andreas Gruber
―――
<<SPACE>>
（和訳）
件名:返信 アポイントメントの確認

鈴木様

ご都合が合うとのこと、何よりです。
6月21日は15時にリンツにある弊社本社にて待ち合わせでいかがでしょうか。
リンツ中央駅が最寄り駅です。
往復のフライトのご予定をお知らせください。
そのうえでHotel XXXを予約させていただきます。
あなたにお会いできるのを楽しみにしております。

アンドレアス・グルーバー
―――

これで、訪問にあたり必要な情報が一通り揃いました。
<<SPACE>>
<<SPACE>>
**３．訪問予定を確定する**
あとは、返信で待ち合わせ時間を承諾する旨とフライト情報を伝えれば、事前のやり取りが完了しますね。どんなメールを書くか、イメージしてみてください。

・・・想像しましたか？以下は一例です。

―――
Subject: Re Re: Confirmation of appointment

Dear Mr. Gruber,

That sounds great - headquarters at 15:00 on June 21.
I'll be arriving at Linz Airport on XXX Airways Flight XX123 at 10:10 on 2017-06-21.
I've booked a return flight for 18:30 on Friday 23rd.
Thank you very much for your kindness in arranging the accommodation.
Would you mind reserving two nights from the 21st?
I'm looking forward to meeting you, too.

Sincerely,

Eri Suzuki
―――
<<SPACE>>
（和訳）
件名:返信 返信 アポイントメントの確認

グルーバー様

問題ございません。6月21日15:00に貴社本社でお会いしましょう。
私はXXX航空のXX123便で2017年6月21日10:10にリンツ空港に到着します。
帰りは23日金曜日18:30のフライトを予約しました。
宿泊に関して、ご厚情誠にありがとうございます。
お手数ですが21日から2晩のご手配をお願いできますでしょうか。
私もあなたにお会いできることを楽しみにしております。

鈴木絵里
―――

TEXT
article_content3_array = article_content3.split("\n")
basic.articles.create(
  title: 'アポイントメントのメール',
  content: article_content3_array.to_json,
  icon_name: 'mdi-calendar-text'
)


# 記事4
article_content4 = <<~TEXT
<<SPACE>>
ビジネスで通用する日程調整＆会議案内のメール文例を順を追って紹介します。回答を集めやすい件名の付け方、オンラインの日程調整ツールを利用する際の文例、会社のカルチャーに合わせたカジュアル表現とフォーマル表現までカバーしています。
<<SPACE>>
<<SPACE>>
**英語で会議の参加依頼と日程打診**

**1. メールでの回答依頼**
Subject: Meeting with Mr. Collins
Dear Asian Market team members,
Good morning.
Our Global Sales Manager Mr Collins would like to have a call with us to go over the sales results by area.
Could you please let me know your availability at the following dates/times by Tuesday 16?
23rd Tue 10:00-11:00
24th Wed 15:00-16:00
26th Fri 9:00-10:00 or 14:00-15:00
Best regards,
Taro Tanaka
<<SPACE>>
（和訳）
件名：コリンズさんとの会議
アジア市場チームメンバーの皆さま
おはようございます。
グローバルセールスマネージャーのコリンズさんが、地域ごとの販売実績の振り返りのため、私たちと電話会議をしたいそうです。
16日火曜日までに、下記日程の皆さんのご都合をお知らせいただけますか？
23日（火）10時～11時
24日（水）15時～16時
26日（金）9時～10時または14時～15時
以上、よろしくお願いします。
田中 太郎
<<SPACE>>
<<SPACE>>
**2. グループウェアで設定したスケジュールの確認**
Subject: Meeting to decide the concept
Dear project members,
Good afternoon.
As we are all aware, we have been requested to finalize the concept for the new product by the end of this month.
So, we need to have another meeting to make the final decision.
I've booked the meeting room from 10 am to 11 am on Tue 23rd on Groupware as it seems everyone is available at the time.
I hope it works for you. If this is not convenient for any of you, please let me know.
By the way, I'm writing to the four of you: Akira, Bob, Chika and David. If you would like to invite any additional people, please let me know.
Cheers,
Eri Suzuki
<<SPACE>>
（和訳）
件名：コンセプト決定会議
プロジェクトメンバーの皆さん
こんにちは。
ご承知の通り、私たちは新製品のコンセプトを今月末までに最終化させるよう求められています。
ですから、結論を出すためにもう一回会議をする必要があります。
グループウェアで見たところ全員予定が空いているようだったので、23日（火）の午前10時～11時にミーティングを設定しました。
問題がなければよいのですが。もしどなたかご都合の合わないときはお知らせください。
ところで、このメールはアキラ、ボブ、チカ、デイヴィッドにお送りしています。もし他にお誘いしたい方がいましたらお知らせください。
よろしく。
鈴木 絵里
<<SPACE>>
<<SPACE>>
**3. 日程調整ツールでの回答依頼**
Subject: Meeting to decide the concept
Dear project members,
Good afternoon.
I'm writing to you all to set up a meeting to finalize the concept for the new product. We definitely need another discussion before the end of the month.
I've prepared a form on Online Scheduling Tool to set the schedule.
Please visit the link below and fill in the form by Tuesday 16.
Click here to access Online Scheduling Tool
Best regards,
Eri Suzuki
<<SPACE>>
（和訳）
件名：コンセプト決定会議
プロジェクトメンバーの皆さん
こんにちは。
新製品のコンセプトを最終決定するミーティングを設定したく、皆さんにご連絡します。今月末までにもう一度議論する必要があるのは間違いありません。
オンラインの日程調整ツールでフォームを用意しました。
16日火曜日までに、以下のリンクを開いて、そちらから回答していただけますか？
オンラインスケジューリングツールはこちら
以上、よろしくお願いいたします。
鈴木 絵里
<<SPACE>>
<<SPACE>>
**日程決定の案内と出席依頼**
<<SPACE>>
<<SPACE>>
**1. 会議室に集まる場合**
Subject: Re: Meeting to decide the concept
Hello all,
Thank you for your prompt response. This is to announce that the concept decision meeting will be held in meeting room #3 from 10:00 a.m. to 11:00 a.m. on Tuesday, 23rd January.
I look forward to seeing you all then.
Best,
Eri Suzuki
<<SPACE>>
（和訳）
件名:Re: コンセプト決定会議
こんにちは、皆さん
早速のご回答ありがとうございます。1月23日火曜日 午前10時から11時まで、3番会議室にてコンセプト決定会議を開催いたします。
皆さんにもうすぐお会いできることを楽しみにしております。
よろしくお願いします。
鈴木 絵里
<<SPACE>>
<<SPACE>>
**2. Web会議の場合**
Subject: Re: Meeting with Mr. Collins
Dear all,
Thank you very much for your replies.
Our meeting is scheduled from 15:00 on Wednesday 24th January. Please access the following link a couple of minutes before the meeting is scheduled to start.
(click here to join meeting)
The passcode is 1234.
The agenda of the meeting is:
1. Kanto sales result … 15min
2. Kansai sales result … 15min
3. Kyushu sales result … 15min
4. Q&A, discussion … 15min
Please share any documents and/or slides you'll be using before 1 p.m. on 24th.
Mr Collins is looking forward to talking with us all then.
Kind regards,
Taro Tanaka
<<SPACE>>
（和訳）
件名:Re:コリンズさんとの会議
皆さま、ご返信くださりありがとうございました。私たちの会議を1月24日の15時からに設定いたしました。
時間の数分前になりましたら、URLにアクセスしてください。パスコードは1234です。
会議の議題は
1. 関東の販売実績 … 15分
2. 関西の販売実績 … 15分
3. 九州の販売実績 … 15分
4. 質疑応答、議論 … 15分
の予定です。
当日使用する資料やスライドを、24日の午後1時までに共有してください。
コリンズさんは私たちと話すのを楽しみにされています。
以上、よろしくお願いします。
田中 太郎

<<SPACE>>
<<SPACE>>
**会議を再調整する場合**
Subject: Rescheduling our meeting to decide the concept
Hi everyone,
Unfortunately, none of the dates I mentioned work for all of us.Do any of the following alternative proposals suit you?
1hr from 10:00 or 11:00 or 14:00 on Tue, 6th Feb
1hr from 14:00 or 16:00 on Wed, 7th Feb
I'd appreciate your reply by Jan 19.
Cheers,
Eri
<<SPACE>>
（和訳）
件名：コンセプト決定会議リスケ
皆さんこんにちは。
残念ながら、前日お伝えした日程では全員の都合が合うものが一つもありませんでした。代わりに、以下の提案の中で合うものはないでしょうか？
2月6日（火）10:00～または11:00～または14:00～の1時間
2月7日（水）14:00～または16:00～の1時間
1月19日までにご返信いただけるとありがたいです。
よろしく。
絵里

<<SPACE>>
<<SPACE>>
**会議キャンセル・延期の連絡**
Subject: Meeting with Mr. Collins postponed
Everyone,
This is to inform you the sales meeting on 24th has been cancelled due to an urgent schedule change by Mr. Collins.
I'm sorry for such short notice. Thank you for your understanding. I will send out another e-mail to reschedule the meeting at a later date.
Kind regards,
Taro Tanaka
<<SPACE>>
（和訳）
件名：コリンズさんとの会議延期
皆さま、
コリンズさんの急な予定変更のため、24日の売上会議はキャンセルになりました。
直前のご連絡で申し訳ありません。ご理解いただけますと幸いです。後日、ミーティングを再設定するためのメールを別途お送りします。
以上、よろしくお願いします。
田中 太郎
TEXT
article_content4_array = article_content4.split("\n")
basic.articles.create(
  title: '日程調整',
  content: article_content4_array.to_json,
  icon_name: 'mdi-calendar-clock'
)

# 記事5
article_content5 = <<~TEXT
<<SPACE>>
ビジネスで見積書を依頼する場面は多いのではないでしょうか？英語で見積もりを依頼したり、依頼されたりする時のやり取りの仕方をを確認しましょう。見積もりを取って、最終的にお断りするシチュエーションを紹介します。
<<SPACE>>
登場人物・背景
浅沼さん:
日本のテレビゲーム会社に勤めています。今回見積もりを取る方。
<<SPACE>>
オンドラ・バビックさん:
チェコ共和国のゲーム制作会社に勤めています。今回見積もりを出す方。
<<SPACE>>
浅沼さんの会社アンプルゲームズは、この夏初めてケータイアプリでパズルゲームをリリースすることになりました。そこで、制作費用が日本の制作会社よりは低く、かつ実績のある企業が多いチェコ共和国でプログラミングやデザイン、サウンドの制作を請け負ってくれる会社を探しています。浅沼さんは多くの制作会社の中からいくつか有力な会社をリストアップし、相見積りを取って比較・検討しようと考えました。
<<SPACE>>
<<SPACE>>
**レッスン1. やり取り開始時点での期待値を同じに**
異文化とコミュニケーションを取る時、「相手が自分の発言の意図を察する」ことを期待してはいけません。日本での常識は世界では非常識にもなり得るからです。「一から十まで説明する」のが異文化対応の常識の一つです。次のメールで、浅沼さんが相見積もりを取っている事を正直に話しているところに注目しましょう。こうすることで、自分の中の期待値と相手の中の期待値を同じにし、後々話がこじれることを未然に防ぎます。次のメールで浅沼さんが簡潔にですが、しっかり詳細を書いているのを見てみましょう。
<<SPACE>>
<<SPACE>>
Dear whom this may concern,
Hello, I would like to inquire about your services. My name is Kenji Asanuma at Ample Games. We are a video game publisher based in Japan.
Ample Games is currently planning to develop a puzzle game application for smart phones similar to “Puzzle Meister” with character breeding aspects as an additional feature.
We are now looking into contracting out the design, programming and sound creation to a developer. To make comparisons with other developers, it would be great if we could have a rough idea of how much an investment it would be if we asked your company to work on such a project.
Would it be possible for us to receive an estimate?
Thank you for your consideration.

Best regards,

Ample Games
Executive Producer
Kenji Asanuma
<<SPACE>>
（和訳）
ご担当者様へ、
貴社が提供しているサービスについての問い合わせになります。私はアンプルゲームズ社の浅沼健二と申します。弊社は日本のテレビゲームメーカーです。
弊社は現在、スマートフォンアプリ「パズルマイスター」のようなパズルゲームにキャラクターの育成要素を加えたアプリの開発を考えております。
現在、同ゲームのデザイン、プログラミング、サウンド制作を制作会社に外注する方向で考えております。他社さまと比較・検討させていただきたく、貴社に依頼する場合の御見積りを出していただけますでしょうか。
どうぞよろしくお願い致します。
アンプルゲームズ
エグゼクティブ・プロデューサー
浅沼健二
<<SPACE>>
<<SPACE>>
**レッスン2. ファイルを添付する**
メールにファイルを添付する場合は、以下の3パターンの文言を使うのが一般的です。
下線の部分を添付したファイルの概要にすればOKです。
・Attached for your review is our company brochure.
・Please find attached our company brochure.
・I have attached our company brochure.
次のメールでバビックさんがどのようにこのような表現を使うかを見てみましょう。
<<SPACE>>
<<SPACE>>
Dear Mr. Asanuma,
Thank you for considering us as a candidate for partnership in your project.
In case we handle the design, programming and sound, we ask our clients to see approximately 643,000 CZK in total (approximately 3,000,000 JPY).
When we created a puzzle app called “Puzzle-rama” in the past, we handled the programming and design for approximately 429,000 CZK (approx. 2,000,000 JPY).
If we can receive more specifics, we will present a more detailed estimate. Please let us know. Attached for your review is our company brochure.
Sincerely,
Obius Games
Director of Development
Ondra Babic
<<SPACE>>
（和訳）
浅沼様、
この度は、弊社を共同開発の候補に入れていただき誠にありがとうございます。
弊社でお受けする場合、プログラミング、デザイン、サウンドを合わせまして3,000,000円ほど見ていただけると幸いです。
また、過去に「パズル-ラマ」というアプリの開発に携わった際は、プログラミングとデザインを担当し、2,000,000円ほどでした。
詳細な内容をお教えいただけましたら、細かい見積もりをお出しすることも可能ですので、必要があればご遠慮なくお申し付けください。
また、弊社の会社案内を添付致しますので、ご検討ください。

オビウスゲームズ
開発部部長
オンドラ・バビック
<<SPACE>>
<<SPACE>>

**レッスン3. 「先日はありがとうございました」**
メールの書き出しはよくお礼から入りますよね。「先日は～」と言いたい時には以下のようなフレーズを使います。
<<SPACE>>
先日（the other day）
・Thank you for visiting us the other day.
・Thank you for the wonderful dinner the other day.
今週の初め（earlier this week）
・Thank you for sending us your brochure earlier this week.
今月の初め（earlier this month）
・Thank you for inviting me out for lunch earlier this month.
次のメールでバビックさんがこのような表現を使うところを見てみましょう。
<<SPACE>>
<<SPACE>>
Dear Mr. Asanuma,
Thank you for sending us your development plan the other day. We have made a detailed estimate according to your plan.
Please let us know if we can be of any further assistance.
Sincerely,
Obius Games
Director of Development
Ondra Babic
<<SPACE>>
（和訳）
浅沼様、
先日は開発プランをお送りいただき、誠にありがとうございました。プランに沿って詳細な見積もりを作成致しましたので、ご確認ください。
私どもでお手伝いできることがございましたら、どうか遠慮なくお申し付けください。
オビウスゲームズ
開発部部長
オンドラ・バビック
<<SPACE>>
<<SPACE>>
Dear Ondra Babic,
We have received your estimate. Please allow us time to review it internally. I will write back by the 10th.
Best regards,
Ample Games
Executive Producer
Kenji Asanuma
<<SPACE>>
（和訳）
オンドラ・バビック様、
御見積書を拝受いたしました。一度社内で検討させていただき、10日までにはお返事いたしますので、もう少々お待ちいただければ幸いです。
アンプルゲームズ
エグゼクティブ・プロデューサー
浅沼健二
<<SPACE>>
<<SPACE>>

**レッスン4.最終的にお断りする**
浅沼さんは次のメールで、見積もりを出してくれたバビックさんに対し、今回は丁重に断らなければなりません。
<<SPACE>>
<<SPACE>>
**~ お断りするパターンA ~**
Dear Ondra Babic,
Thank you for your patience.
We regret to inform you that while we were in the process of considering candidates, a change in company policy caused postponement of the project. We sincerely appreciate your taking time out of your busy week to prepare an estimate for us.
We ask for your kind understanding and look forward to future collaboration opportunities.
Best regards,
Ample Games
Executive Producer
Kenji Asanuma
<<SPACE>>
（和訳）
オンドラ・バビック様、
お待たせしており恐れ入ります。
御見積りをいただき検討していたところ、社内の方針が変わり、企画が延期になりました。お忙しい中、御見積書を作成いただいて誠に感謝しております。
なにとぞ、ご理解いただけますようお願い申し上げます。また機会がございましたら、どうぞよろしくお願いいたします。
アンプルゲームズ
エグゼクティブ・プロデューサー
浅沼健二
<<SPACE>>
<<SPACE>>

**レッスン5. 丁重さを表すには、文を長く**
ビジネスシーンではどうしても改まった態度を取らないといけないこともありますよね。たとえば取引を断る時、以下のことを言いたいとします。貴社を含め数社からの御見積りについて検討してまいりましたが、残念ながら、今回は貴社とのお取引を見送らせていただく結論に至りました。要点だけを伝えると、以下のような英語になります。
<<SPACE>>
We considered several candidates and decided to work with another company for this project.
<<SPACE>>
しかしこれでは、かなり冷たい響きになってしまいます。今回は断ったものの、今後この会社と取引することがあるかもしれません。文を長くすることで、礼儀良く、丁重に断っている印象にしましょう。
<<SPACE>>
We regret to inform you that after careful consideration of candidates among several developers, we have decided to work with another company for this project.
<<SPACE>>
we have come to a conclusion to …」の部分に注目してください。これは、「we decided to …」から1段階改まった表現になります。

1.We decided to …
2.We have decided to …
メールなどの文書でよく使われる手法ですが、過去形の動詞を現在完了形の動詞に変えることで、文が長くなり、結果的に改まった響きになります。しかし条件として、文法的に違和感がない場合にのみ使える手法です。他の例を見てみましょう。

<<SPACE>>
○ We discussed this matter with the president.
○ We have discussed this matter with the president.
x We have discussed this matter with the president yesterday.
<<SPACE>>
(現在完了形を使う時は、「いつ行ったか」という情報を同じ文に入れるのは間違いになります。)
それでは浅沼さんがメールで取引を丁重に断るところを見てみましょう。
<<SPACE>>
<<SPACE>>
**~ お断りするパターンB ~**
Dear Ondra Babic,
Thank you for patiently waiting for our reply.
We regret to inform you that after careful consideration of candidates among several developers, we have decided to work with another company for this project.
We ask for your kind understanding and look forward to future collaboration opportunities.
Best regards,
Ample Games
Executive Producer
Kenji Asanuma
<<SPACE>>
（和訳）
オンドラ・バビック様、
御返事が遅くなってしまい申し訳ありません。
貴社を含め数社からの御見積りについて検討してまいりましたが、残念ながら、今回は貴社とのお取引を見送らせていただく結論に至りました。
なにとぞ、ご理解いただけますようお願い申し上げます。今後とも、どうぞよろしくお願いいたします。
アンプルゲームズ
エグゼクティブ・プロデューサー
浅沼健二


TEXT
article_content5_array = article_content5.split("\n")
basic.articles.create(
  title: '依頼のメール',
  content: article_content5_array.to_json,
  icon_name: 'mdi-calendar-clock'
)