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
  name: "佐藤 明美",
  occupation: "営業"
)
# ユーザー1の投稿
Post.create(
  title: "効果的なフォーマットでメッセージをクリアに",
  content: <<~TEXT,
  エピソード:
  新しいプロジェクトの提案を行う際、私は詳細すぎる情報を前面に出しすぎて、重要なポイントが埋もれてしまっていた。数回の失敗を経て、私はメールのフォーマットを簡潔にし、要点を明確にすることで、相手に正確に伝える方法を学びました。

  初めのメール:
  Subject: About the new project proposal and some ideas

  Dear Ms. Anderson,

  I hope you're doing well. Last weekend, I had a brainstorming session with our team, and we came up with a new project idea that I believe could be beneficial. We've been doing a lot of research, and according to our findings, there's a gap in the market for...
  [Several paragraphs about the market, the research process, and various other details]
  ... so, I believe this is a project worth pursuing. Let me know your thoughts.
  Best,
  John

  改善後のメール:
  Subject: New Project Proposal: Addressing Market Gap

  Dear Ms. Anderson,

  I hope you're well. I'd like to present a new project proposal that addresses a specific market gap we've identified.

  Key Points:
  - Market Gap: [Brief description of the gap]
  - Proposed Solution: [Brief description of our idea]
  - Potential Benefits: [Brief list of benefits]

  I believe this project holds significant potential. Would you be available for a detailed discussion this week?

  Best regards,
  John
  この改善後のメールは、要点を簡潔に伝えることで、読み手の理解を助け、迅速な反応を促すことができるようになります。
  TEXT
  genre: "メールの構成とフォーマット",
  user_id: user1.id
)

# ユーザー2の作成
user2 = User.create(
  email: "user2@example.com",
  password: "11111111",
  name: "田中 一郎",
  occupation: "営業"
)
# ユーザー2の投稿
Post.create(
  title: "実体験をもとにした「件名の書き方」での効果的な英文ビジネスメール",
  content: <<~TEXT,
  私は以前、外国のビジネスパートナーとの初のプロジェクトを進行中だった時、メールの件名の書き方に悩んでいました。初対面の相手にどうアプローチするか、どれだけの情報を件名に含めるべきかを考えるのは難しく、初めは「Meeting」とだけ書いて送信しました。しかし、返信がなく、不安に感じました。
  そこで、メンターにアドバイスを求め、件名を具体的かつ関連性のある内容にすることの重要性を学びました。次回から、私は件名を「[Project Name] Meeting on [Date]」とするようにしました。これにより、迅速な返信が増え、コミュニケーションがスムーズになりました。

  あまりよくない例:
  Subject: Meeting

  Hello Mr. Tanaka,
  I hope this finds you well. I would like to discuss our upcoming project. Please let me know your availability.

  良い例:
  Subject: "XYZ Project" Meeting on Dec 5th

  Hello Mr. Tanaka,
  I hope this finds you well. I'd like to set up a meeting to discuss our XYZ project. Please let me know when you are available on Dec 5th.

  このように、具体的で関連性のある件名を使用することで、相手にメールの内容をすぐに理解してもらい、返信の可能性も高まります。
  TEXT
  genre: "件名の書き方",
  user_id: user2.id
)

# ユーザー3の作成
user3 = User.create(
  email: "user3@example.com",
  password: "11111111",
  name: "鈴木 花子",
  occupation: "営業"
)
# ユーザー3の投稿
Post.create(
  title: "ビジネスメールでのコミュニケーションとエチケットの実体験をもとにした指南",
  content: <<~TEXT,
  昔、私の同僚はビジネスパートナーからのメールに瞬時に返信し、そのスピード感から「迅速な対応者」として評価を受けていました。しかし、ある日、彼の迅速な返信が裏目に出る事態が発生しました。メールの内容を完全には読んでおらず、相手の質問に対して不適切な答えを返信してしまったのです。
  このエピソードから、迅速な返信は大切だが、それ以上に正確で適切な内容の返信が重要であること、そしてメールのエチケットを守ることの大切さを学びました。

  あまりよくない例:
  Subject: RE: Meeting Schedule

  Yes, I'm free.

  良い例:
  Subject: RE: Meeting Schedule for XYZ Project

  Dear Mr. Suzuki,

  Thank you for your email. I'm available for a meeting regarding the XYZ project on Dec 5th at 3pm. Please let me know if this time works for you.

  Best regards,
  [Your Name]

  簡潔さは大切ですが、相手への敬意やプロジェクトの具体的な内容を明確に伝えることで、相手とのコミュニケーションがよりスムーズになり、信頼関係も築きやすくなります。
  TEXT
  genre: "コミュニケーションとエチケット",
  user_id: user3.id
)

# ユーザー4の作成
user4 = User.create(
  email: "user4@example.com",
  password: "11111111",
  name: "高橋 大輔",
  occupation: "営業"
)
# ユーザー4の投稿
Post.create(
  title: "実体験で学んだビジネスメールのトーンとスタイル",
  content: <<~TEXT,
  ある日、新規のクライアントとのメールのやり取りを進めていた際、私はクライアントの反応が冷たいと感じました。その原因を探る中で、私のメールのトーンやスタイルがクライアントに合っていなかったことを悟りました。この経験から、以下の3つのポイントを心掛けるようになりました。

  1.相手を尊重する
  ビジネスメールにおいては、相手を尊重することが最も重要です。メールの冒頭や結びに、相手への敬意を示す言葉を忘れずに盛り込むことを心掛けましょう。

  例:
  Subject: Project Proposal Feedback
  Dear Dr. Kimura,
  I deeply appreciate your time and feedback on our recent project proposal...

  2.明確なコミュニケーション
  伝えたいことを明確に、そして簡潔にまとめることで、相手が理解しやすくなります。必要な情報だけを伝え、余分な情報は省きましょう。

  例:
  Subject: Request for Meeting on Nov 15th
  Dear Ms. Fujita,
  I'm writing to request a meeting on Nov 15th to discuss the upcoming campaign...

  3.適切なトーンの選択
  相手や状況に応じて、適切なトーンを選択します。新しいビジネスパートナーや上司にはフォーマルなトーン、長い間の取引先や同僚には少しカジュアルなトーンが適しています。

  例:
  Subject: Upcoming Conference Details
  Hello Tom,
  I've gathered the details for the upcoming conference in Kyoto. Let's go over them together...

  このように、実体験を元に具体的なポイントとそのポイントを活用したメール例を紹介することで、ビジネスメールのトーンやスタイルの重要性を伝えることができます。
  TEXT
  genre: "メールのトーンやスタイル",
  user_id: user4.id
)

# ユーザー5の作成
user5 = User.create(
  email: "user5@example.com",
  password: "11111111",
  name: "伊藤 美咲",
  occupation: "営業"
)
# ユーザー5の投稿
Post.create(
  title: "返答を引き出す！効果的なフォローアップメールの実例とポイント",
  content: <<~TEXT,
  数年前、私は大きなプロジェクトの提案を新規のクライアントに提出しました。
  しかし、提出から一週間経っても返答がありませんでした。不安に感じつつも、フォローアップメールを送ることで情報のアップデートを受け取ることができました。
  この経験から、フォローアップメールの重要性と、その際の適切な手法について学びました。

  1.主要な情報の再確認を行う
  再度、自分の提案やリクエストの要点を簡潔にまとめて、相手に思い出させることが効果的です。

  例:
  Subject: Follow-up on Project Alpha Proposal
  Dear Mr. Nakamura,
  I hope this email finds you well. I'm reaching out to follow up on our Project Alpha proposal sent on October 1st. The proposal highlights our strategy for improving your company's online presence...

  2.具体的な行動を求める
  次にどのような行動を求めるのかを明確に示すことで、相手に返答の方向性を示すことができます。

  例:
  Subject: Awaiting Your Feedback on the Contract
  Dear Ms. Kobayashi,
  I hope you've had a chance to review the contract sent last week. Could you please confirm if everything is in order or if there are any points you'd like to discuss?

  3.感謝の気持ちを忘れずに
  忙しいビジネスパーソンに対して、その時間を尊重する姿勢を示すことが大切です。

  例:
  Subject: Checking in on the Document Review
  Hello Mr. Tanaka,
  I understand that everyone has a busy schedule, and I appreciate your time and effort. I wanted to check in regarding the documents sent two weeks ago. Your insights would be invaluable to us.

  このようなテクニックを用いることで、フォローアップメールがスムーズに相手に伝わり、効果的なコミュニケーションを図ることができます。
  TEXT
  genre: "フォローアップメールのテクニック",
  user_id: user5.id
)

# ユーザー6の作成
user6 = User.create(
  email: "user6@example.com",
  password: "11111111",
  name: "渡辺 裕太",
  occupation: "営業"
)
# ユーザー6の投稿
Post.create(
  title: "「応答率UP」の秘訣。わかりやすい問い合わせメールの書き方",
  content: <<~TEXT,
  初めての大型プロジェクトを担当した時、私は外部のベンダーに複数の資料を要求する必要がありました。
  最初のメールは情報が多すぎて、返答に時間がかかりました。
  その経験から、問い合わせや要求を明確かつ効果的に伝える方法を学びました。

  1.明確な件名
  問い合わせや要求の内容が一目でわかるような件名を考えることで、相手がメールを早めに開く可能性が上がります。

  例:
  Subject: Urgent: Documents Needed for Project X

  2.情報の階層化
  最も重要な情報を最初に記載し、それに続いて詳細を記述することで、相手が要点をすぐに掴むことができます。

  例:
  Dear Mr. Yamada,

  I hope this finds you well. For the upcoming Project X, we urgently require the following documents:

  Design blueprint
  Cost estimation sheet
  Supplier contract
  Kindly provide these by the end of this week, as they are crucial for our next phase.

  3.具体的な期日の指定
  問い合わせや要求に対して、具体的な期日を設定することで、返答の優先度を明確にします。

  例:
  ...
  The deadline for these documents is Friday, November 10th. We appreciate your prompt attention to this matter.

  4.感謝の気持ちを表現
  協力を求める際には、相手の助力を感謝することで、良好な関係を築きます。

  例:
  ...
  Thank you for your understanding and cooperation. Looking forward to your prompt response.

  このようなアプローチを取ることで、問い合わせや要求を含むビジネスメールが効果的になり、高い応答率を得ることが期待できます。

  TEXT
  genre: "問い合わせや要求を行うメール",
  user_id: user6.id
)

# ユーザー7の作成
user7 = User.create(
  email: "user7@example.com",
  password: "11111111",
  name: "小林 良太",
  occupation: "営業"
)
# ユーザー7の投稿
Post.create(
  title: "実務で学んだ！感謝と謝罪を伝えるビジネスメールのコツ",
  content: <<~TEXT,
  クライアントへのレポート提出に遅れた際、適切な謝罪メールを速やかに送ったことで、信頼を回復し、さらに締め切りを延長してもらえました。
  また、あるプロジェクトで特別な支援を受けた際、心からの感謝をメールで伝えたところ、その後の交渉が驚くほどスムーズに運んだ経験があります。
  謝罪のメール:

  Subject: Apology for the Delay in the Report Submission
  Dear [Recipient's Name],

  I regret to inform you that the submission of the report due today has been delayed due to unforeseen circumstances. I apologize for any inconvenience this may cause.
  We are working diligently to complete the report and will have it ready by [new deadline]. Your understanding is greatly appreciated, and we are committed to maintaining the highest standards of service moving forward.

  Sincerely,
  [Your Name]

  お礼のメール:
  Subject: Thank You for Your Support on the [Project Name]

  Dear [Recipient's Name],

  I am writing to express my heartfelt gratitude for your exceptional support during the [Project Name]. Your insights and assistance were crucial to our success.
  We value the collaborative spirit of our partnership and look forward to future endeavors together.
  Warm regards,
  [Your Name]

  謝罪メールでは、誠実に状況を説明し、新しい締め切りを提供することで、責任感を伝えています。
  お礼のメールでは、具体的なプロジェクト名とサポートの詳細を挙げ、相手の貢献を明確に評価しています。
  これらのメールは、ビジネス関係での信頼と尊敬を維持し、さらに深めるために効果的です。

  TEXT
  genre: "お礼や謝罪のメール",
  user_id: user7.id
)

# ユーザー8の作成
user8 = User.create(
  email: "user8@example.com",
  password: "11111111",
  name: "加藤 真由",
  occupation: "営業"
)
# ユーザー8の投稿
Post.create(
  title: "シンプルなメール交流のススメ",
  content: <<~TEXT,
  異文化間のコミュニケーションでは簡潔さが重要です。
  ある時、私は日本のクライアントにとって複雑な英語表現を使いすぎたことがあり、メールの意図が伝わらない事態になりました。
  それ以来、シンプルで直接的な言葉を使うようにしています。

  Subject: Meeting Schedule Confirmation

  Hi [Recipient's Name],

  I hope this message finds you well.

  Could we set a date for our next meeting? How is next Wednesday at 10 AM for you?

  Please let me know if this works or suggest another time that suits you better.

  Thank you,

  [Your Name]

  このメールは、異文化間コミュニケーションにおけるシンプルさを保つために作られました。
  件名は明確で目的がはっきりしています。メール本文は、敬意を表しつつ、次の行動への確認を求めています。
  相手に対する配慮を示しつつ、彼らの返信や提案を歓迎する態度が伝わります。これにより、相手は快適に返信しやすくなり、
  効果的なコミュニケーションが促進されます。
  TEXT
  genre: "異文化間のコミュニケーション",
  user_id: user8.id
)

# ユーザー9の作成
user9 = User.create(
  email: "user9@example.com",
  password: "11111111",
  name: "山田 隆",
  occupation: "営業"
)
# ユーザー9の投稿
Post.create(
  title: "ビジネスメールで使える！シンプル英語フレーズ集",
  content: <<~TEXT,
  海外のパートナーとのプロジェクトで初めてメール交換を行った時、複雑な表現や専門用語を避けて、基本的なフレーズを使ったことで、スムーズなコミュニケーションが取れました。
  相手にも明確に伝わり、効率よく情報交換ができるようになりました。

  Subject: Meeting Time Confirmation

  Hello [Recipient's Name],
  I hope you are doing well.
  Could we meet on Friday at 3 PM?
  Please let me know if this time works for you.
  Thank you,
  [Your Name]

  このメールは非常に簡潔に書かれています。
  件名「Meeting Time Confirmation」は、メールの目的をすぐに理解できるようにしています。
  メール本文では、「I hope you are doing well.」で始まり、親しみやすさを示しています。
  「Could we meet on Friday at 3 PM?」という短い質問は、直接的で相手に対する選択肢を与えています。
  「Please let me know if this time works for you.」で返信を促しており、ビジネスシーンにおいてよく使われる礼儀正しい表現です。
  このようなシンプルな英語は、非母国語話者とのコミュニケーションでも齟齬を生じさせにくいです。

  TEXT
  genre: "ビジネスメールの語彙やフレーズ",
  user_id: user9.id
)

# ユーザー10の作成
user10 = User.create(
  email: "user10@example.com",
  password: "11111111",
  name: "中村 しのぶ",
  occupation: "営業"
)
# ユーザー10の投稿
Post.create(
  title: "緊急事態における冷静な対応。ビジネスメールでの効果的な伝達法。",
  content: <<~TEXT,

  かつてサーバーダウンという緊急事態が発生した際、慌てずに明確かつ迅速に情報を伝える必要がありました。
  私は以下のようなメールを使用し、事態の深刻さを理解してもらいつつ、必要な行動を促すことができました。

  Subject: Urgent: Server Downtime - Immediate Action Required

  Dear [Team or Individual's Name],

  I regret to inform you that we are currently experiencing unexpected server downtime, which began at approximately [Time]. Our IT team is actively working to resolve this issue.

  Impact:

  ・[List critical services affected]
  ・[Estimated time of resolution if known]
  Immediate actions needed:

  ・Please refrain from attempting to access [affected systems].
  ・Notify your teams and halt any dependent activities.
  We understand the inconvenience this may cause and are doing our utmost to restore services as quickly as possible. We will provide updates every [Time Frame, e.g., hour] or when significant progress has been made.

  Thank you for your understanding and cooperation.

  Best,
  [Your Name]

  このメール例では、緊急時におけるコミュニケーションの3つの要素が取り入れられています
  明確さ、簡潔さ、指示の明示。件名は緊急性を伝え、本文は問題とその影響を具体的に述べ、必要な行動を指示しています。
  また、定期的なアップデートを約束することで、受信者の不安を和らげるとともに、信頼性を保つ努力が伝わります。
  緊急時のメールでは、このように冷静かつ具体的な情報を伝えることが、混乱を避け、迅速な解決に繋がります。

  TEXT
  genre: "緊急時やトラブル時のメール",
  user_id: user10.id
)

# ユーザー11の作成
user11 = User.create(
  email: "user11@example.com",
  password: "11111111",
  name: "小野 大輝",
  occupation: "営業"
)
# ユーザー11の投稿
Post.create(
  title: "上司や同僚へのメールで好印象を残すポイント",
  content: <<~TEXT,
  私は新入社員として配属されたばかりの頃、上司へのメール一通で信頼関係を築くきっかけを作りました。
  ポイントは尊敬を示しつつ、簡潔に必要な情報を提供することでした。
  また、自分の提案や質問に対して、上司がどれだけ容易に反応できるかを常に意識しました。

  Subject: Request for Meeting: Project X Timeline Review

  Dear Mr./Ms. [Last Name],

  I hope this message finds you well.
  I am writing to request a brief meeting to discuss the timeline of Project X. There are a few areas where I believe we could optimize our approach, particularly regarding [specific task or phase].
  Would it be possible to schedule a 15-minute meeting this week to go over these points? I am confident that with a few adjustments, we can enhance our project's efficiency.
  Thank you for your guidance and support. I look forward to your feedback.
  Warm regards,

  [Your First Name] [Your Last Name]
  [Your Position]

  このメールでは、以下の要素が取り入れられています：

  敬意 - 上司に対して"Mr./Ms. [Last Name]"を使用し、敬意を表しています。
  目的の明確化 - メールの目的を直接的かつ丁寧に伝えています。
  具体的提案 - 会議の目的とその必要性を具体的な例を挙げて説明しています。
  柔軟性と尊重 - 会議の時間を上司に合わせることを提案し、上司のスケジュールを尊重しています。
  感謝の表現 - 上司のサポートに感謝を示し、ポジティブな印象を与えています。
  上司や同僚へのメールでは、このようなバランスの取れたアプローチが、協力関係を築く上で効果的です。

  TEXT
  genre: "同僚や上司へのメール",
  user_id: user11.id
)

# ユーザー12の作成
user12 = User.create(
  email: "user12@example.com",
  password: "11111111",
  name: "斎藤 絵里",
  occupation: "営業"
)
# ユーザー12の投稿
Post.create(
  title: "短くても心を込めた取引先へのメールのコツ",
  content: <<~TEXT,
  急な注文変更を要求された際に、簡潔かつ丁寧なメールを送ることで、取引先の信頼を保ちつつ、要求に対応しました。
  すぐに対応することで、プロフェッショナルな関係を維持することができました。

  Subject: Order #12345 Adjustment Confirmation

  Dear [Customer's Name],

  I hope this email finds you well.
  Your request to change order #12345 has been processed. The updated delivery date is [Date].
  Thank you for your business.
  Best,
  [Your Name]

  このメールは以下の要素を含んでいます：

  具体性 - 注文番号と変更が確定したことを簡潔に述べています。
  明確性 - 更新された配送日をはっきりと伝えています。
  礼儀 - 開始と結びの言葉で敬意を表しています。
  取引先や顧客へのメールでは、これらの要素を短くまとめることで、忙しいビジネスシーンにおいても効率的にコミュニケーションを取ることが可能です。
  TEXT
  genre: "取引先や顧客へのメール",
  user_id: user12.id
)

# ユーザー13の作成
user13 = User.create(
  email: "user13@example.com",
  password: "11111111",
  name: "井上 優子",
  occupation: "営業"
)
# ユーザー13の投稿
Post.create(
  title: "スマートに提案する短いメールで大きなインパクトを",
  content: <<~TEXT,
  あるプロジェクトで、新しいソフトウェアツールの導入を提案したいときがありました。
  直接会議で話す前に、上司に短いメールで提案の概要を送りました。
  これにより、会議での議論のための足がかりを作ることができました。

  Subject: Proposal for New Software Tool to Enhance Efficiency

  Hi [Supervisor's Name],

  I've found a software tool that could improve our workflow. Can we discuss this at the next team meeting?

  Best,
  [Your Name]

  このメールは以下のポイントを抑えています：

  明確な目的 - 件名でメールの目的を明確にしています。
  簡潔さ - 本文は提案を短く、直接的に述べています。
  アクションの呼びかけ - 具体的な次のステップ（チームミーティングでの討議）を提案しています。
  短いメールで提案をする際には、具体的で直接的なコミュニケーションが鍵となります。
  TEXT
  genre: "提案のメール",
  user_id: user13.id
)

# ユーザー14の作成
user14 = User.create(
  email: "user14@example.com",
  password: "11111111",
  name: "木村 達也",
  occupation: "営業"
)
# ユーザー14の投稿
Post.create(
  title: "迅速な対応で会議調整。効率的なメールの秘訣。",
  content: <<~TEXT,
  複数の部門が参加する重要な会議をセットアップする際に、参加者全員のスケジュールを調整する必要がありました。
  短いメールを使って、各参加者の利用可能な日時を確認し、迅速に会議をセットアップすることができました。

  Subject: Scheduling Multi-Department Meeting

  Dear Team,

  To coordinate our upcoming strategy meeting, could you please reply with your availability for next week?
  Looking forward to your prompt responses.
  Best regards,
  [Your Name]
  このメールには以下の要素が含まれています：

  簡潔な件名 - メールの目的がはっきりとしています。
  明確な要求 - 利用可能な日時を伝えるように依頼しています。
  迅速な回答の促進 - 素早い返信を促して、プロセスを加速しています。
  会議やイベントの調整メールを送る際は、参加者が簡単に対応できるような明確で簡潔なコミュニケーションが重要です。
  TEXT
  genre: "会議やイベントの調整メール",
  user_id: user14.id
)

# ユーザー15の作成
user15 = User.create(
  email: "user15@example.com",
  password: "11111111",
  name: "林 雅之",
  occupation: "営業"
)
# ユーザー15の投稿
Post.create(
  title: "情報共有のためのクリア＆コンサイスなメール",
  content: <<~TEXT,
  あるプロジェクトにおいて、私たちのチームはプロジェクトの進捗状況をクライアントに定期的に報告する必要がありました。
  情報過多で読みにくい報告書ではなく、要点を抑えた、分かりやすいメールの形式を取り入れることで、クライアントからの信頼と満足を得ることができました。

  Subject: Weekly Progress Update on Project X

  Dear [Client's Name],

  I hope this message finds you well. Here's our weekly progress update on Project X:

  Completed the design phase ahead of schedule.
  Initiated the first stage of development.
  Identified potential risks, outlined in the attached risk assessment.
  Please review the attached files for detailed insights and let us know if you have any questions.

  Warm regards,
  [Your Name]

  このメールは次のような特徴を持っています:

  パーソナライズされた挨拶 - 受信者に対する配慮を示しています。
  ポイント別の進捗状況の報告 - 読み手がすぐに理解できるよう、進捗を簡潔にまとめています。
  リスクの提示と資料の添付 - 問題点を先回りして伝え、対処方法を示すことで信頼性を高めています。
  フィードバックの促進 - 質問や懸念に対してオープンであることを伝え、対話を促しています。
  情報共有を目的としたビジネスメールでは、受信者が必要な情報を迅速に摘み取れるように、ポイントを明確にし、余計な情報は省略することが重要です。

  TEXT
  genre: "情報共有",
  user_id: user15.id
)

# ユーザー16の作成
user16 = User.create(
  email: "user16@example.com",
  password: "11111111",
  name: "山本 早紀",
  occupation: "営業"
)
# ユーザー16の投稿
Post.create(
  title: "万能ビジネスメール。短く、シンプルに、ポイントを抑えて。",
  content: <<~TEXT,
  新人の時、上司から「メールは短く、シンプルに」と教わりました。
  初めてのプロジェクト報告では、長々としたメールを書いてしまい、結果的に受信者が大事なポイントを見落としてしまいました。
  その失敗から、メールは簡潔に情報を伝えることの重要性を学びました。
  Subject: Quick Update - Project Alpha

  Hi Team,

  Quick highlights:

  Project Alpha is on track for the December deadline.
  Minor issues resolved last week; no delays expected.
  Next step: final review on Nov 20th.
  Questions? Let's talk at the Monday meeting.

  Thanks,
  [Your Name]

  このメールでは以下のポイントに注意しています:

  明確な件名 - 受信者がメールの内容を即座に理解できるように、件名を簡潔かつ具体的にしています。
  情報の要約 - プロジェクトの進捗状況を点で簡単にまとめ、重要な情報を瞬時に伝えています。
  コミュニケーションの促進 - 質問があれば会議で話し合いましょうと提案することで、受信者が次のアクションを取りやすくしています。
  シンプルでありながら、必要な情報を網羅しているこのメールは、忙しいビジネス環境において読み手に負担をかけません。
  TEXT
  genre: "その他",
  user_id: user16.id
)

#並び替え問題 以下
basic = Category.create(category_name_article: '基礎チェック問題')
appointment = Category.create(category_name: 'アポイントメント')
schedule_one = Category.create(category_name: '日程調整(会議の参加依頼と日程打診)')
schedule_two = Category.create(category_name: '日程調整(日程決定の案内と出席依頼)')
apology = Category.create(category_name: '謝罪メール')
inquiry = Category.create(category_name: '問い合わせメール')
report = Category.create(category_name: '報告メール')

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

# 謝罪のメール1
sentence_japanese10 = <<~TEXT
件名:RE: 次回ミーティング
皆さま、
次の月例Webミーティングの時間を間違って書いてしまったことをお詫びします。
4月6日木曜日、日本時間の15時～16時になります。
サマータイムが始まるのを失念していました。ご都合が合うと良いのですが。
不都合ございましたらお知らせください。
TEXT
sentence_japanese10_array = sentence_japanese10.split("\n")

sentence_english10 = <<~TEXT
Subject: RE: next meeting
Dear All,
I apologize that I shared the wrong time for the next monthly web meeting.
The correct time is from JST 15:00-16:00 on Thursday, April 6.
I forgot about the start of Daylight Savings Time.I hope this works with your schedules. 
Please let me know if this change will cause any inconvenience.
TEXT
sentence_english10_array = sentence_english10.split("\n")
apology.quizzes.create(
title: '1.案内に誤りがあったことを詫びる（社内）',
sentence_japanese: sentence_japanese10_array.to_json,
sentence_english: sentence_english10_array.to_json
)
# 謝罪のメール2
sentence_japanese11 = <<~TEXT
件名:RE: 見積書について
スミス様
5月8日にお送りしている不備のある見積書について、謝罪申し上げます。
それは、旧来の価格表に基づいて算出されておりました。
添付にて訂正した見積書をお送りしますのでご確認ください。
混乱させてしまったことを重ねてお詫びいたします。
TEXT
sentence_japanese11_array = sentence_japanese11.split("\n")

sentence_english11 = <<~TEXT
Subject: RE: about the invoice
Dear Ms. Smith,
Please accept our sincere apology for the incorrect estimate we sent you on 8th May.
It was calculated based on the old price list.
Please find attached the revised estimate with the price we have agreed upon.
Again, I apologize for the confusion.
TEXT
sentence_english11_array = sentence_english11.split("\n")
apology.quizzes.create(
title: '2.見積もりの不備を詫びる（取引先、顧客）',
sentence_japanese: sentence_japanese11_array.to_json,
sentence_english: sentence_english11_array.to_json
)
# 謝罪のメール3
sentence_japanese12 = <<~TEXT
件名:5月2日付ABCユーザー向けメッセージについて
お客様各位
5月2日の14時に、私たちの製品の一つ、ABCをご利用のお客様向けに発信されたメッセージをご受信されたかもしれません。
こちらは、誤ってABCをご利用のお客様以外のお客様にも配信されてしまったものです。
もし、あなたがABCをご利用されていない場合、何卒ご容赦くださいますよう、また、該当のメールをご放念いただけますよう、よろしくお願い申し上げます。
TEXT
sentence_japanese12_array = sentence_japanese12.split("\n")

sentence_english12 = <<~TEXT
Subject: about our message to ABC users on 2nd May
Dear Customer,
You may have received an e-mail at 2:00 pm on May 2nd that was intended to be sent to customers who use ABC, one of our products.
It was accidentally sent not only to ABC users but also partially to other customers.
Please accept our deepest apology and kindly disregard the email if you are not an ABC user.
TEXT
sentence_english12_array = sentence_english12.split("\n")
apology.quizzes.create(
title: '3.宛先を間違えてしまったことを詫びる（顧客、不特定多数）',
sentence_japanese: sentence_japanese12_array.to_json,
sentence_english: sentence_english12_array.to_json
)
# 謝罪のメール4
sentence_japanese13 = <<~TEXT
件名：RE: 弊社セミナーへのご招待
ヘンリーさん
セミナーへのお誘いありがとうございます。
あいにく、その日は都合がつきませんでした。
正直なところ、興味のあるトピックです。
次回がございましたら、ぜひお知らせください。
TEXT
sentence_japanese13_array = sentence_japanese13.split("\n")

sentence_english13 = <<~TEXT
Subject: RE: invitation to our seminar
Dear Henry,
Thank you for your invitation to the seminar.
Unfortunately, I’ve found that I can’t make it on that day.
However, I’m very interested in the topics to be covered.
Please let me know if the seminar will be held again..
TEXT
sentence_english13_array = sentence_english13.split("\n")
apology.quizzes.create(
title: '4.セミナーへの招待に欠席の連絡をする（取引先）',
sentence_japanese: sentence_japanese13_array.to_json,
sentence_english: sentence_english13_array.to_json
)
# 謝罪のメール5
sentence_japanese14 = <<~TEXT
件名：RE: 25周年記念式典へのご招待
パーカー様
はじめに、貴社の25周年記念式典へのお誘いをいただきましたことに心より感謝申し上げます。
あいにく、変更のできない先約のため、パーティに列席することができません。
ご招待をお受けできないことを大変残念に思います。
素晴らしい25周年になりますよう、心よりお祈り申し上げます。
TEXT
sentence_japanese14_array = sentence_japanese14.split("\n")

sentence_english14 = <<~TEXT
Subject: RE: invitation to the jubilee celebration
Dear Mr. Parker,
First of all, I would like to express my sincere gratitude for your kind invitation to your company’s jubilee celebration.
Unfortunately, due to a prior engagement that cannot be rescheduled, I will not be able to attend the party.
I very much regret that I cannot accept your invitation,
and wish you the best on company’s your 25th anniversary.
TEXT
sentence_english14_array = sentence_english14.split("\n")
apology.quizzes.create(
title: '5.招待に欠席する非礼を詫びる（顧客、取引先）',
sentence_japanese: sentence_japanese14_array.to_json,
sentence_english: sentence_english14_array.to_json
)
# 謝罪のメール6
sentence_japanese15 = <<~TEXT
件名：本日のアポイントメント
オリヴィアさん
直前のご連絡で申し訳ありませんが、インフルエンザにかかってしまったため、本日の打合せをキャンセルしなければなりません。今朝、医者にかかり、そこで発覚しました。
代わりの日程を来週中でいくつかお知らせいただけますと大変ありがたいです。
かさねがさね申し訳ございません。
TEXT
sentence_japanese15_array = sentence_japanese15.split("\n")

sentence_english15 = <<~TEXT
Subject: Today’s appointment
Dear Olivia,
I’m very sorry for such short notice, but I have to cancel our meeting today because I’ve got the flu. I found out this morning when I went to see my doctor.
I’d much appreciate it if you could let me know some possible dates you are available next week.
Again, please accept my apology.
TEXT
sentence_english15_array = sentence_english15.split("\n")
apology.quizzes.create(
title: '6.訪問予定を当日キャンセルすることを詫びる（顧客、取引先）',
sentence_japanese: sentence_japanese15_array.to_json,
sentence_english: sentence_english15_array.to_json
)
# 問い合わせのメール1
sentence_japanese16 = <<~TEXT
件名：貴社製品について
ご担当者様
田中太郎と申しまして日本からメールを書いております。
貴社オンラインショップについて質問がございます。
貴社WEBページ（www.berlitz.com/ja-jp/）をみて、商品ナンバーA001に興味があります。
こちらは日本からの注文は可能でしょうか？
ご返信をお待ちしております。
田中太郎
TEXT
sentence_japanese16_array = sentence_japanese16.split("\n")

sentence_english16 = <<~TEXT
Subject: Additional information regarding your product
My name is Taro Tanaka and I am writing you from Japan.
I have a question regarding your online shop.
I visited your webpage (www.berlitz.com/ja-jp/) and I am interested in purchasing item #A001.
Is it possible to purchase it from Japan?
I look forward to hearing from you soon.
Yours sincerely,
Taro Tanaka
TEXT
sentence_english16_array = sentence_english16.split("\n")
inquiry.quizzes.create(
title: '1.検討中の製品について問い合わせる',
sentence_japanese: sentence_japanese16_array.to_json,
sentence_english: sentence_english16_array.to_json
)
# 問い合わせのメール2
sentence_japanese17 = <<~TEXT
件名：購入した製品が届きません
ご担当者様
田中太郎と申しまして日本からメールを書いております。
2023年7月30日に注文したタブレット（注文番号♯12345）ですが、まだ届いておりません。
いつごろ届くか教えていただけますか？
ご返信をお待ちしております。
田中太郎
TEXT
sentence_japanese17_array = sentence_japanese17.split("\n")

sentence_english17 = <<~TEXT
Subject: Delivery delay
Dear Sir or Madam,
My name is Taro Tanaka and I am writing you from Japan.
I ordered a tablet (order #12345) on July 30th 2023 but I haven’t received it yet.
Could you tell me when it will be delivered?
I look forward to hearing from you soon.
Yours sincerely,
Taro Tanaka
TEXT
sentence_english17_array = sentence_english17.split("\n")
inquiry.quizzes.create(
title: '2.注文済み製品について問い合わせる(製品が届かない)',
sentence_japanese: sentence_japanese17_array.to_json,
sentence_english: sentence_english17_array.to_json
)
# 問い合わせのメール3
sentence_japanese18 = <<~TEXT
件名：購入した製品の不具合について
ご担当者様
田中太郎と申しまして日本からメールを書いております。
2023年7月30日に新品のタブレット（注文番号♯12345）を注文しました。製品が届き箱を開けてみるとディスプレイに傷がありました。（写真を添付したので確認してください。）
保証期間内ですので、こちら交換か返金をしていただきたいです。
手続きを教えていただけないでしょうか？
ご返信をお待ちしております。
田中太郎
TEXT
sentence_japanese18_array = sentence_japanese18.split("\n")

sentence_english18 = <<~TEXT
Subject: Problem with purchased product
Dear Sir or Madam,
My name is Taro Tanaka and I am writing you from Japan.
I ordered a brand new tablet (order #12345) on July 30th 2023.
I received the product but when I opened the box, there was a scratch on the screen (please the see attached picture).
Since it is under warranty I would like to exchange it or get a refund.
Could you tell me how to do this?
I look forward to hearing from you soon.
Yours sincerely,
Taro Tanaka
TEXT
sentence_english18_array = sentence_english18.split("\n")
inquiry.quizzes.create(
title: '3.注文済み製品について問い合わせる(製品の不具合)',
sentence_japanese: sentence_japanese18_array.to_json,
sentence_english: sentence_english18_array.to_json
)
# 報告メール
sentence_japanese19 = <<~TEXT
マーティンへ、
お元気ですか。
4月1日に開始予定の春のキャンペーンの近況報告をさせていただきます。多少の問題はあるものの、プロジェクトは進んでいます。
1. 広告デザインの第一稿が出来上がりました。添付のファイルをご覧ください。
– 広告デザインに着手して1ヵ月になります。2月末日までにはデザインを完成させる予定です。
2. 販売員の研修が開始されましたが、厳しい状況です。
– 早い時期から研修を開始する予定でしたが、講師の不調により、予定より2週間遅れています。
– ギリギリになってしまいますが、3月28日には全ての店舗スタッフの研修を完了する予定です。
3. 電車広告枠を調整中です。
– 東京と大阪の全ての主要な沿線の広告枠を押さえる予定です。
まとめとして、スケジュールは厳しいですが今のところ予定どおりに進んでいます。このプロジェクトについてまた随時報告させていただきます。
よろしくお願いします。
大輔
TEXT
sentence_japanese19_array = sentence_japanese19.split("\n")

sentence_english19 = <<~TEXT
Hello Martin,
I hope you are doing well.
This is an update of the spring campaign scheduled for launch on April 1st. We are making progress although there are some difficulties.
The first draft of our new ad design has been made. Please see the attached file.
– We have been working on our new ad design for a month now. We expect to complete the design by the end of February.
Sales training of store staff has started but is under difficult circumstances.
– We expected to start training earlier, but had to delay the start for 2 weeks due to a trainer falling ill.
– Although it will be close to launch, we plan to complete training of all store staff by March 28th.
Search for train ad space is underway.
– We plan to buy in-train ad space on all major train lines in Tokyo and Osaka.
In summary, we are on schedule so far, although the schedule is tight, we are currently on schedule. I will keep you updated with the progress of the project.
Take care,
Daisuke
TEXT
sentence_english19_array = sentence_english19.split("\n")
report.quizzes.create(
title: '1.近況報告メール',
sentence_japanese: sentence_japanese19_array.to_json,
sentence_english: sentence_english19_array.to_json
)


#基礎チェック問題

# 記事1
article_content1 = <<~TEXT
<<SPACE>>
<<SPACE>>
ユウタ:　「リサ、英文ビジネスメールって結構難しいよね。」
<<SPACE>>
リサ:　「そうだね、でも基本的なフォーマットさえ覚えれば、日本語のメールとほとんど同じよ。例えば、①件名、②宛名、③書き出し、④用件、⑤結び、⑥結語、⑦差出人の会社名、名前という順番で進めるのは、日本語のメールと同じだよ。」
<<SPACE>>
ユウタ:　「そうなの？具体的に教えてくれる？」
<<SPACE>>
リサ:　「もちろん！」
「①件名は、例えば「Subject:New order request for ().」とか「Urgent delivery request for ().」みたいに具体的に書くのがいいんだ。」
<<SPACE>>
ユウタ:　「Urgent delivery request」って緊急発送依頼だよね。具体的に書かないとスパム扱いされちゃうの？」
<<SPACE>>
リサ:　「そう、一言で「Inquiry」だけとかだとスパムと間違えられる可能性があるからね。」
<<SPACE>>
ユウタ:　「なるほど、②宛名はどうやって書けばいいの？」
<<SPACE>>
リサ:　「それは取引先との関係によるけど、初めての取引先や上司には「Dear Mr./Ms.＋ラストネーム,」と書くのが基本。でも、もう少し親しい相手なら「Dear＋ファーストネーム,」って書いてもいいよ。」
<<SPACE>>
ユウタ:　「そして、③書き出しは？」
<<SPACE>>
リサ:　「書き出しは自己紹介から始めることが多いよ。「My name is Hiroshi Tanaka.」や、「It was a pleasure to meet you at the exhibition」などのフレーズを使うことが多いよ。」
<<SPACE>>
ユウタ:　「じゃあ、メールの本題は？」
<<SPACE>>
リサ:　「それが④の用件ね。例えば「I am writing with regard to confirming the delivery time.」って感じで、理由を簡潔に述べてから本題に入ることが多いよ。」
<<SPACE>>
ユウタ:　「なるほど、最後はどう締めるの？」
<<SPACE>>
リサ:　「⑤締めの言葉で、「I look forward to hearing from you soon.」や「Thank you for your cooperation.」といったフレーズを使って締めるのが一般的。そして、⑥結語では「Best regards,」や「Kind regards,」を使って結びの言葉を添えることが多いよ。」
<<SPACE>>
ユウタ:　「最後に名前と連絡先を書くんだよね？」
<<SPACE>>
リサ:　「そう、それが⑦差出人名。順番に、名前、役職、部署名、会社名という順で書くのが一般的だよ。」
<<SPACE>>
ユウタ:　「リサ、ありがとう！これで英文メールもバッチリだ！」
<<SPACE>>
リサ:　「いつでも聞いてね。頑張ってね！」
<<SPACE>>
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
<<SPACE>>
ユウタ:「リサ、英文メールの最初によく使う挨拶のフレーズを教えてもらえる？特に、相手の健康や前回の会合を振り返るような表現が知りたいんだ。」
リサ:「もちろん、ユウタ。基本的には、相手の健康や気持ちを気遣うフレーズや、前回の接触を思い出させるフレーズが役立つよ。」
<<SPACE>>
<<SPACE>>

１．相手の健康や気持ちを気遣うフレーズ
<<SPACE>>
<<SPACE>>
リサ:「一番基本的なのは、相手の健康を気遣う表現だね。」
ユウタ:「それはどんなフレーズになるの？」
リサ:「例えばこんな感じ。」

<<SPACE>>
<<SPACE>>
I hope you are well.
お元気にお過ごしでしょうか。
<<SPACE>>
<<SPACE>>

ユウタ:「なるほど、シンプルで使いやすそうだね！」
リサ:「そうだね。このフレーズはどんなビジネスメールでも適しているから、よく使われるよ。」

<<SPACE>>
<<SPACE>>
２．前回の接触を思い出させるフレーズ
<<SPACE>>
<<SPACE>>

リサ:「前回の接触や会合を思い出させるフレーズもあるよ。」
ユウタ:「前回会った時のことを思い出させることで、相手との関係性を強化するんだよね？」
リサ:「その通り！それによって、相手に安心感や信頼感を与えることができるんだ。」

<<SPACE>>
<<SPACE>>
It was a pleasure meeting you last week.
先週はお会いできて光栄です。
<<SPACE>>
<<SPACE>>

ユウタ:「あ、このフレーズ、先日のビジネスミーティングで使えそうだ！」
リサ:「そうだね、ユウタ。相手との関係性を築くために、これらのフレーズをうまく使ってみてね。」
ユウタ:「リサ、ありがとう！これでメールがもっとスムーズに書けそうだよ。」
リサ:「いつでも相談してね。ちゃんとした準備をして、相手に心地よい印象を与えるメールを書こうね！」
<<SPACE>>

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
１．訪問を打診する
<<SPACE>>
<<SPACE>>
リサ:「ユウタ、英文メールの書き方に少し迷ってる顔してるね。何か困ってることある？」
ユウタ:「実は、海外の取引先を訪問したいんだけど、どうメールでお願いしたらいいかわからないんだ…」
リサ:「わかった。じゃあ、こんな感じで書いてみるのはどうかな？」
<<SPACE>>
<<SPACE>>
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

<<SPACE>>
<<SPACE>>

ユウタ:「なるほど、これなら分かりやすいし、失礼もしないと思う。」
リサ:「そうだよね。ポイントは、目的を明確にし、相手に質問をすることで返信を促すこと。それに、丁寧な言葉遣いも大事だよ。」

<<SPACE>>
<<SPACE>>
２．訪問日程を決め、関連する質問をする
<<SPACE>>
<<SPACE>>
ユウタ:「先方から返信が来て、訪問日を提案してくれたよ。でも、具体的な場所や時間はまだ決まってないんだ…」
リサ:「そういう時は、自分から日程を提案して、その他の詳細を問い合わせるといいよ。」
<<SPACE>>
<<SPACE>>
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
<<SPACE>>
<<SPACE>>
ユウタ:「箇条書きで質問するの、わかりやすくていいね。」
リサ:「そう、直接的な質問は箇条書きにすると、相手も答えやすいんだよ。」
<<SPACE>>
<<SPACE>>
３．訪問予定を確定する
<<SPACE>>
<<SPACE>>
ユウタ:「じゃあ、最後に訪問の詳細を確定させるメールはどうすればいい？」
リサ:「具体的な日程やフライト情報、滞在期間を伝えるのが大事だよ。それと、感謝の気持ちを忘れずに。」
<<SPACE>>
<<SPACE>>
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
<<SPACE>>
（和訳）
グルーバー様

問題ございません。6月21日15:00に貴社本社でお会いしましょう。
私はXXX航空のXX123便で2017年6月21日10:10にリンツ空港に到着します。
帰りは23日金曜日18:30のフライトを予約しました。
宿泊に関して、ご厚情誠にありがとうございます。
お手数ですが21日から2晩のご手配をお願いできますでしょうか。
私もあなたにお会いできることを楽しみにしております。

鈴木絵里

<<SPACE>>
<<SPACE>>
ユウタ:「リサ、ありがとう！これで安心してメールが書けるよ。」
リサ:「いつでも相談してね。ちゃんとした準備をして、訪問が成功するように頑張って！」
<<SPACE>>

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
<<SPACE>>
ユウタ:「リサ、英語での会議の参加依頼や日程調整のメールってどうすればいいの？」
リサ:「いい質問だね。際の文例を使って説明するね。」
<<SPACE>>
<<SPACE>>
英語で会議の参加依頼と日程打診
<<SPACE>>
<<SPACE>>
リサ:「まず、メールでの回答依頼。具体的な日程を提案して、相手の利用可能な時間を確認する形が一般的だよ。」
<<SPACE>>
<<SPACE>>

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
ユウタ:「シンプルでわかりやすいね。」
リサ:「次に、グループウェアでのスケジュール確認。これはすでに予定が入っていることを伝え、その日程で問題ないか確認する形になるよ。」
<<SPACE>>
<<SPACE>>
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
ユウタ:「オンラインの日程調整ツールを使いたいときは？」
リサ:「それには、オンラインツールのリンクを共有して、日程の選択を依頼する形を取ることが多いよ。」
<<SPACE>>
<<SPACE>>
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

日程決定の案内と出席依頼
<<SPACE>>
<<SPACE>>
リサ:「会議室での会議の場合、会場と時間を明示的に伝えることが重要よ。」
<<SPACE>>
<<SPACE>>
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
ユウタ:「Web会議の場合はどうするの？」
リサ:「Web会議の場合は、アクセスリンクやパスコード、アジェンダなどを具体的に記載することが大切。」
<<SPACE>>
<<SPACE>>
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

ユウタ:「でも、日程が合わない場合や会議を再調整したいときは？」
リサ:「そういう場合は、再度、提案する日程を挙げて、返信をもらうように促す形になるよ。」
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
リサ:「会議をキャンセルや延期する場合は、その事実と理由を伝え、後日再度調整する旨を伝えるといいよ。」
<<SPACE>>
<<SPACE>>
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
<<SPACE>>
<<SPACE>>
ユウタ:「リサ、これで安心してメールが書けるようになったよ！本当にありがとう！」
リサ:「いつでも質問してね、ユウタ！頑張って！」
<<SPACE>>

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
<<SPACE>>
ユウタ:「リサ、新しいプロジェクトで外部のゲーム制作会社に見積もりを依頼したいんだけど、どうやって英語のメールを書けばいいか分からない…」
リサ:「大丈夫、ユウタ。効果的な英文メールのやり取りを学ぶ良い機会だね。具体的なシチュエーションを元に、一緒に見ていこう。」
<<SPACE>>
<<SPACE>>
レッスン1: やり取り開始時点での期待値を同じに
<<SPACE>>
<<SPACE>>
リサ:「異文化間のコミュニケーションでは、相手に自分の意図を察してもらうことを期待しないことが大切。詳細をしっかりと伝えることで、話がこじれることを防ぐよ。」
ユウタ:「具体的にはどんな内容を伝えるべき？」
リサ:「例えばこんなメールだね。」
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
レッスン2: ファイルを添付する
<<SPACE>>
<<SPACE>>
リサ:「メールにファイルを添付する際のフレーズにも注意が必要だよ。」
ユウタ:「何か良いフレーズはある？」
リサ:「例えば、「Attached for your review is our company brochure.」や「Please find attached our company brochure.」などがあるよ。」
<<SPACE>>
<<SPACE>>
レッスン3: 「先日はありがとうございました」
<<SPACE>>
<<SPACE>>
リサ:「メールの書き出しにお礼のフレーズを入れることで、相手に好印象を与えることができるわ。」
ユウタ:「具体的な例を見せてくれる？」
リサ:「もちろん、こちらを見て。」
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
リサ:「「先日は～」と言いたい時には以下のようなフレーズを使えるね。」
<<SPACE>>
<<SPACE>>
先日（the other day）
・Thank you for visiting us the other day.
・Thank you for the wonderful dinner the other day.
今週の初め（earlier this week）
・Thank you for sending us your brochure earlier this week.
今月の初め（earlier this month）
・Thank you for inviting me out for lunch earlier this month.


<<SPACE>>
<<SPACE>>
レッスン4: 最終的にお断りする
<<SPACE>>
<<SPACE>>
ユウタ:「リサ、でも見積もりをもらった後でお断りしなきゃいけない場面もあるよね？」
リサ:「そのときは丁寧にお断りすることが大切。例として、以下の２つのパターンが考えられるわ。」
ユウタ:「それぞれどういった内容でお断りするんだ？」
リサ:「一つ目のパターンは、会社の方針変更を理由にプロジェクトを延期する場合、二つ目のパターンは他の企業との取引を決定した場合のお断りの仕方だよ。」
<<SPACE>>
<<SPACE>>
お断りするパターンA:
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
お断りするパターンB:
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
<<SPACE>>
<<SPACE>>

リサ:「ビジネスメールでの断り文は、文を少し長くして丁寧な印象を与えるのがコツ。」
ユウタ:「文を長くすることでより礼儀正しい印象になるんだね。」
リサ:「その通り。要点だけを伝えると、短くて冷たい印象になりかねない。例えば、“We considered several candidates and decided to work with another company for this project.”という短い文だと、相手に対してあまり礼儀正しくない印象を与える可能性があるわ。」
ユウタ:「なるほど、それは避けたいよね。」
リサ:「そうなの。今回断っても、将来的にはその会社と取引する可能性があるかもしれないから、文を少し長くし、改まった表現を使うことで、相手に感謝と理解を求めるニュアンスを強調することが大切よ。例えば、“We regret to inform you that after careful consideration of candidates among several developers, we have decided to work with another company for this project.”というようにね。」
ユウタ:「確かにその方が丁寧に感じる。文の構造を変えることで、もっと礼儀正しい印象になるんだね。」
リサ:「正確に言うと、過去形の動詞を現在完了形に変えることで、文が長くなり、丁寧な響きになるのよ。ただ、文法的に違和感がない場合に限り使える手法なので、注意が必要よ。」
ユウタ:「リサ、ありがとう！これで効果的なビジネスメールが書けそうだ。」
リサ:「大丈夫。何か質問があれば、いつでも聞いてね。」

<<SPACE>>


TEXT
article_content5_array = article_content5.split("\n")
basic.articles.create(
  title: '依頼のメール',
  content: article_content5_array.to_json,
  icon_name: 'mdi-briefcase'
)



# 記事6
article_content6 = <<~TEXT
<<SPACE>>
<<SPACE>>
ユウタ:「リサ、ちょっと困ってるんだ。英文のビジネスメールで、どうやって間違いやミスを謝罪すればいいか分からないんだ…」
リサ:「心配しないで、ユウタ。誰でも間違えることはあるものよ。でも、それぞれのミスのレベル感に合わせた謝罪の方法があるわ。例を見てみる？」
ユウタ:「うん、お願い！」
リサ:「まず、ファイルの添付を忘れた場合。社内なら、こんな感じ。」
<<SPACE>>
<<SPACE>>
１）ファイルの添付漏れを詫びる（社内）：
Subject: RE: revised document
John,
Sorry, I forgot the attachment.
<<SPACE>>
（和訳）
件名:RE: 書類修正
ジョン、
すみません、添付を忘れました。
<<SPACE>>
<<SPACE>>
ユウタ:「取引先や顧客にはどうすればいいの？」
リサ:「取引先や顧客にはもう少し丁寧に。」
<<SPACE>>
<<SPACE>>


２）ファイルの添付漏れを丁寧に詫びる（取引先、顧客）：
Subject: RE: revised document
Dear Ms. Craig,
I'm very sorry. I forgot to include the attachment.
<<SPACE>>
（和訳）
件名:RE: 書類修正
クレイグ様、
申し訳ありません。添付を付けるのを忘れました。
<<SPACE>>

リサ:「他にも色々な状況での謝罪の方法があるわ。例えば…」

<<SPACE>>
<<SPACE>>
３）案内に誤りがあったことを詫びる（社内）：
Subject: RE: next meeting

Dear All,
I apologize that I shared the wrong time for the next monthly web meeting.
The correct time is from JST 15:00-16:00 on Thursday, April 6. I forgot about the start of Daylight Savings Time.
I hope this works with your schedules. Please let me know if this change will cause any inconvenience.
<<SPACE>>
（和訳）
件名:RE: 次回ミーティング

皆さま、
次の月例Webミーティングの時間を間違って書いてしまったことをお詫びします。
4月6日木曜日、日本時間の15時～16時になります。
サマータイムが始まるのを失念していました。ご都合が合うと良いのですが。
不都合ございましたらお知らせください。
<<SPACE>>
<<SPACE>>


ユウタ:「すごく参考になる！他にも教えて！」
リサ:「もちろん、他の例もあるわ。」
<<SPACE>>
<<SPACE>>


４）見積もりの不備を詫びる（取引先、顧客）：
Subject: RE: about the invoice

Dear Ms. Smith,
Please accept our sincere apology for the incorrect estimate we sent you on 8th May.
It was calculated based on the old price list.
Please find attached the revised estimate with the price we have agreed upon.
Again, I apologize for the confusion.
<<SPACE>>
（和訳）
件名:RE: 見積書について

スミス様
5月8日にお送りしている不備のある見積書について、謝罪申し上げます。
それは、旧来の価格表に基づいて算出されておりました。
添付にて訂正した見積書をお送りしますのでご確認ください。
混乱させてしまったことを重ねてお詫びいたします。
<<SPACE>>
<<SPACE>>

５）宛先を間違えてしまったことを詫びる（顧客、不特定多数）：
Subject: about our message to ABC users on 2nd May

Dear Customer,
You may have received an e-mail at 2:00 pm on May 2nd that was intended to be sent to customers who use ABC, one of our products.
It was accidentally sent not only to ABC users but also partially to other customers.
Please accept our deepest apology and kindly disregard the email if you are not an ABC user.

<<SPACE>>
（和訳）
件名:5月2日付ABCユーザー向けメッセージについて

お客様各位
5月2日の14時に、私たちの製品の一つ、ABCをご利用のお客様向けに発信されたメッセージをご受信されたかもしれません。
こちらは、誤ってABCをご利用のお客様以外のお客様にも配信されてしまったものです。
もし、あなたがABCをご利用されていない場合、何卒ご容赦くださいますよう、また、該当のメールをご放念いただけますよう、よろしくお願い申し上げます。

<<SPACE>>
<<SPACE>>
ユウタ:「打ち合わせやイベントへの欠席も謝罪のメールが必要だよね。」
リサ:「その通り。こういった場合も、相手の心情に配慮した表現が大切よ。」
<<SPACE>>
<<SPACE>>

１）セミナーへの招待に欠席の連絡をする（取引先）：
Subject: RE: invitation to our seminar

Dear Henry,
Thank you for your invitation to the seminar.
Unfortunately, I’ve found that I can’t make it on that day.
However, I’m very interested in the topics to be covered.
Please let me know if the seminar will be held again..
<<SPACE>>
（和訳）
件名：RE: 弊社セミナーへのご招待

ヘンリーさん
セミナーへのお誘いありがとうございます。
あいにく、その日は都合がつきませんでした。
正直なところ、興味のあるトピックです。
次回がございましたら、ぜひお知らせください。

<<SPACE>>
<<SPACE>>
ユウタ:「パーティーの招待への欠席は、どうすれば？」
リサ:「こんな感じで。」
<<SPACE>>
<<SPACE>>

2）25周年記念式典への招待に欠席する非礼を詫びる（顧客、取引先）
Subject: RE: invitation to the jubilee celebration

Dear Mr. Parker,
First of all, I would like to express my sincere gratitude for your kind invitation to your company’s jubilee celebration.
Unfortunately, due to a prior engagement that cannot be rescheduled, I will not be able to attend the party.
I very much regret that I cannot accept your invitation, and wish you the best on company’s your 25th anniversary.
<<SPACE>>
（和訳）
件名：RE: 25周年記念式典へのご招待
パーカー様
はじめに、貴社の25周年記念式典へのお誘いをいただきましたことに心より感謝申し上げます。
あいにく、変更のできない先約のため、パーティに列席することができません。
ご招待をお受けできないことを大変残念に思います。
素晴らしい25周年になりますよう、心よりお祈り申し上げます。
<<SPACE>>
<<SPACE>>
リサ:「他にもこういった例があるわ。」

<<SPACE>>
<<SPACE>>
３）訪問予定を当日キャンセルすることを詫びる（顧客、取引先）
Subject: Today’s appointment

Dear Olivia,
I’m very sorry for such short notice, but I have to cancel our meeting today because I’ve got the flu. I found out this morning when I went to see my doctor.
I’d much appreciate it if you could let me know some possible dates you are available next week.
Again, please accept my apology.
<<SPACE>>
（和訳）
件名：本日のアポイントメント
オリヴィアさん
直前のご連絡で申し訳ありませんが、インフルエンザにかかってしまったため、本日の打合せをキャンセルしなければなりません。今朝、医者にかかり、そこで発覚しました。
代わりの日程を来週中でいくつかお知らせいただけますと大変ありがたいです。
かさねがさね申し訳ございません。

<<SPACE>>
<<SPACE>>
ユウタ:「リサ、ありがとう！これを参考にメールを書いてみるよ！」
リサ:「いいわよ、ユウタ。相手の立場に立って考えることと、丁寧に表現することが大切よ。失礼があっても、きちんと謝罪すれば多くの人は理解してくれるもの。頑張ってね！」
<<SPACE>>


TEXT
article_content6_array = article_content6.split("\n")
basic.articles.create(
  title: '謝罪のメール',
  content: article_content6_array.to_json,
  icon_name: 'mdi-emoticon-dead'
)




# 記事7
article_content7 = <<~TEXT
<<SPACE>>
<<SPACE>>
ユウタ:「リサ、最近オンラインで海外の商品を見ることが多いんだけど、英文の問い合わせメールをどう書いたらいいのかわからない…」
リサ:「確かに、海外とのやりとりは英文が基本だよね。でも、適切なテンプレートを使えば、問い合わせもスムーズにできるわ。」
ユウタ:「本当に？具体的にどういうテンプレートを使えばいいの？」
リサ:「まず、検討中の製品についての問い合わせね。」
<<SPACE>>
<<SPACE>>
１）検討中の製品について問い合わせる
<<SPACE>>
<<SPACE>>
リサ:「このようなメールを考えてみて。」
<<SPACE>>
<<SPACE>>
Subject: Additional information regarding your product

My name is Taro Tanaka and I am writing you from Japan.
I have a question regarding your online shop.
I visited your webpage (www.berlitz.com/ja-jp/) and I am interested in purchasing item #A001.
Is it possible to purchase it from Japan?

I look forward to hearing from you soon.
Yours sincerely,

Taro Tanaka

<<SPACE>>
（和訳）
件名：貴社製品について
ご担当者様

田中太郎と申しまして日本からメールを書いております。
貴社オンラインショップについて質問がございます。
貴社WEBページ（www.berlitz.com/ja-jp/）をみて、商品ナンバーA001に興味があります。
こちらは日本からの注文は可能でしょうか？

ご返信をお待ちしております。

田中太郎
<<SPACE>>
<<SPACE>>

リサ:「このテンプレートでは、まず自己紹介して、どこから連絡しているのかを明確にしているわ。そして具体的な商品の詳細や質問を続けているの。」
ユウタ:「なるほど、具体的に何を知りたいのか明確にするんだね。」
リサ:「そうよ。他にも、製品が日本で使えるのか、カタログを送ってもらいたいといった異なる目的のメールもあるから、その目的に合わせて内容を変えることが大切よ。」
ユウタ:「それって、商品が日本で使えるかどうかを聞く場合も同じテンプレートを使えるの？」
リサ:「似たような構造を使うけど、質問の内容に合わせて少し変えることができるわ。例えばこんな感じ。」
<<SPACE>>
<<SPACE>>
Subject: Additional information regarding your product

Dear Sir or Madam,

My name is Taro Tanaka and I am writing you from Japan.
I have a question regarding item #A001 that I found on your webpage (www.berlitz.com/ja-jp/).
Can we use this product in Japan?

I look forward to hearing from you soon.
Yours sincerely,

Taro Tanaka
<<SPACE>>
（和訳）
件名：貴社製品について

ご担当者様

田中太郎と申しまして日本からメールを書いております。
貴社オンラインショップについて質問がございます。
貴社WEBページ（www.berlitz.com/ja-jp/）をみて、商品ナンバーA001に興味があります。
こちらは日本からの注文は可能でしょうか？

ご返信をお待ちしております。

田中太郎
<<SPACE>>
<<SPACE>>
リサ:「こちらは、製品が日本で使用可能かどうかの確認をしているテンプレートよ。質問のポイントを変更するだけで、同じ構造を利用することができるの。」
ユウタ:「なるほど、理解した！それでは、例えば製品のカタログを送ってもらいたい場合はどうすればいいの？」
リサ:「良い質問ね。カタログをリクエストする場合のテンプレートはこんな感じになるわ。」
<<SPACE>>
<<SPACE>>
Subject: Request for product catalogue

Dear Sir or Madam,

My name is Yoko Tanaka and I am writing you from Japan.
I visited your webpage (berlitz.com/ja-jp/) and I am interested in your beauty products.
I would like to find out more about them.
Would it be possible to receive some sort of catalogue?

I look forward to hearing from you soon.
Yours sincerely,

Yoko Tanaka
<<SPACE>>
（和訳）
件名：貴社製品のカタログについて
ご担当者様
田中洋子と申しまして日本からメールを書いております。
貴社WEBページ（berlitz.com/ja-jp/）を拝見しました、貴社の化粧品に非常に興味があります。
カタログ等を送っていただくことは可能でしょうか？
ご返信をお待ちしております。

田中洋子
<<SPACE>>
<<SPACE>>
リサ:「このテンプレートでは、具体的にどの製品に興味があるのか、そしてカタログを受け取りたいというリクエストを明確にしているわ。」
ユウタ:「製品が届かない場合や、製品に不具合があった場合、または返品を希望する場合の問い合わせメールのテンプレートも知りたいんだ。」
リサ:「それぞれの状況に合わせたメールテンプレートを示すわね。」
<<SPACE>>
<<SPACE>>
２）注文済み製品について問い合わせる
<<SPACE>>
<<SPACE>>
製品が届かない
<<SPACE>>
<<SPACE>>
Subject: Delivery delay
Dear Sir or Madam,
My name is Taro Tanaka and I am writing you from Japan.
I ordered a tablet (order #12345) on July 30th 2023 but I haven’t received it yet.
Could you tell me when it will be delivered?
I look forward to hearing from you soon.
Yours sincerely,
Taro Tanaka
<<SPACE>>
（和訳）
件名：購入した製品が届きません
ご担当者様
田中太郎と申しまして日本からメールを書いております。
2023年7月30日に注文したタブレット（注文番号♯12345）ですが、まだ届いておりません。
いつごろ届くか教えていただけますか？
ご返信をお待ちしております。
田中太郎
<<SPACE>>
<<SPACE>>
リサ:「このテンプレートは、製品の配送が遅れている場合のものよ。まず、自分の名前と注文した商品について具体的に述べて、配送の遅延について問い合わせをしているわ。」
<<SPACE>>
<<SPACE>>
製品の不具合（壊れている）
<<SPACE>>
<<SPACE>>
Subject: Problem with purchased product
Dear Sir or Madam,
My name is Taro Tanaka and I am writing you from Japan.
I ordered a brand new tablet (order #12345) on July 30th 2023.
I received the product but when I opened the box, there was a scratch on the screen (please the see attached picture).
Since it is under warranty I would like to exchange it or get a refund.
Could you tell me how to do this?
I look forward to hearing from you soon.
Yours sincerely,
Taro Tanaka
<<SPACE>>
（和訳）
件名：購入した製品の不具合について
ご担当者様
田中太郎と申しまして日本からメールを書いております。
2023年7月30日に新品のタブレット（注文番号♯12345）を注文しました。製品が届き箱を開けてみるとディスプレイに傷がありました。（写真を添付したので確認してください。）
保証期間内ですので、こちら交換か返金をしていただきたいです。
手続きを教えていただけないでしょうか？
ご返信をお待ちしております。
田中太郎
<<SPACE>>
<<SPACE>>
リサ:「このテンプレートは、製品に不具合がある場合のものよ。製品を受け取った後の状態について具体的に述べて、保証期間内であるため交換や返金を希望していることを伝えているの。」
<<SPACE>>
<<SPACE>>
返品をしたい
Subject: Reimbursement of purchased product

Dear Sir or Madam,

My name is Taro Tanaka and I am writing you from Japan.
I ordered a brand new tablet (order #12345) on July 30th 2023.
Unfortunately, it wasn’t exactly what I was expecting.
Since it is under the 30-day trial period, I would like to get a refund.

I look forward to hearing from you soon.
Yours sincerely,

Taro Tanaka
<<SPACE>>
<<SPACE>>
リサ:「このテンプレートは、製品を返品して返金を希望する場合のものよ。期待していたものと異なったため、試用期間内に返金を希望していることを伝えているわ。」
ユウタ:「これで各状況に応じた問い合わせができそうだ。ありがとう、リサ！」
<<SPACE>>



TEXT
article_content7_array = article_content7.split("\n")
basic.articles.create(
  title: '問い合わせのメール',
  content: article_content7_array.to_json,
  icon_name: 'mdi-comment-question-outline'
)


# 記事8
article_content8 = <<~TEXT
<<SPACE>>
<<SPACE>>
ユウタ:「リサ、実は最近、外国の上司に対してプロジェクトの近況報告メールを書くことが増えてきたんだ。でも、どう表現するのが適切か迷ってしまって...。」
リサ:「大丈夫、ユウタ。適切な表現やフレーズを知ることで、自信を持ってメールを書くことができるわ。例文と、それに対応する使える表現をいくつか紹介するね。」
<<SPACE>>
<<SPACE>>
1-1. メール例文
<<SPACE>>
<<SPACE>>
Hello Martin,
I hope you are doing well.

This is an update of the spring campaign scheduled for launch on April 1st. We are making progress although there are some difficulties.

The first draft of our new ad design has been made. Please see the attached file.
– We have been working on our new ad design for a month now. We expect to complete the design by the end of February.

Sales training of store staff has started but is under difficult circumstances.
– We expected to start training earlier, but had to delay the start for 2 weeks due to a trainer falling ill.
– Although it will be close to launch, we plan to complete training of all store staff by March 28th.

Search for train ad space is underway.
– We plan to buy in-train ad space on all major train lines in Tokyo and Osaka.

In summary, we are on schedule so far, although the schedule is tight, we are currently on schedule. I will keep you updated with the progress of the project.

Take care,

Daisuke
<<SPACE>>
（和訳）
マーティンへ、

お元気ですか。

4月1日に開始予定の春のキャンペーンの近況報告をさせていただきます。多少の問題はあるものの、プロジェクトは進んでいます。

1. 広告デザインの第一稿が出来上がりました。添付のファイルをご覧ください。
– 広告デザインに着手して1ヵ月になります。2月末日までにはデザインを完成させる予定です。

2. 販売員の研修が開始されましたが、厳しい状況です。
– 早い時期から研修を開始する予定でしたが、講師の不調により、予定より2週間遅れています。
– ギリギリになってしまいますが、3月28日には全ての店舗スタッフの研修を完了する予定です。

3. 電車広告枠を調整中です。
– 東京と大阪の全ての主要な沿線の広告枠を押さえる予定です。

まとめとして、スケジュールは厳しいですが今のところ予定どおりに進んでいます。このプロジェクトについてまた随時報告させていただきます。

よろしくお願いします。

大輔
<<SPACE>>
<<SPACE>>
リサ:「この例文は外国の上司、Martinへの近況報告メールよ。そして、このメールに使われている表現をいくつかピックアップして、その意味や使い方を説明するわ。」
<<SPACE>>
<<SPACE>>
I hope you are doing well.
お元気ですか。
<<SPACE>>
<<SPACE>>
リサ:「この表現は、メールの最初に用いられることが多い挨拶文のひとつよ。"How are you?"という質問とは異なり、"I hope you are doing well"は相手に直接的な返答を求めていないわ。したがって、ビジネスの文脈で使うときには、この表現の方が適している場合が多いの。特に、相手との関係がそれほど親しいわけではない、または、メールの主要な内容が他にある場合には、このフレーズはとても役立つわ。」
<<SPACE>>
<<SPACE>>
This is an update of _______.
～の進捗を報告させていただきます。
<<SPACE>>
<<SPACE>>
リサ:「この表現は、メールの内容を明確に伝える際に非常に便利よ。メールの受信者は多忙であることが多いので、最初にメールの目的や内容を簡潔に伝えることで、受信者が内容を把握しやすくなるの。このフレーズを使うことで、メールのトピックや目的を最初から明確にすることができるわ。」
ユウタ:「なるほど、それぞれのフレーズの背後には、そういう意味や意図があるんだね。」
<<SPACE>>
<<SPACE>>
We are making progress although there are some difficulties.
多少の問題はあるものの、プロジェクトは進んでいます。
<<SPACE>>
<<SPACE>>
リサ:「この表現は、プロジェクトの全体的な進捗とその中での困難や障壁を伝えるためのものよ。このフレーズを使うことで、上司や関係者に対して進捗状況とその中での挑戦点を明確に伝えられるの。進捗状況を知ることは、上司や関係者にとって非常に重要なので、このような表現は頻繁に使用されるわ。」
<<SPACE>>
<<SPACE>>
_______ has been _______.
～されました。
<<SPACE>>
<<SPACE>>
リサ:「この文型は現在完了形を使用していて、何かがすでに完了していることを伝えるのに適しているわ。特定の日付や時期を強調する必要がない場合、この形を使用することで、行動の完了を簡潔に伝えられるの。特にビジネスの文脈では、結果を伝えることが重要なので、この文型は非常に役立つわ。」
ユウタ:「リサ、詳しく説明してくれてありがとう。これらのフレーズの意味や背後にある意図を理解することで、自分の近況報告メールがより洗練されると感じるよ。」
<<SPACE>>
<<SPACE>>
Please see the attached file.
添付の資料をご覧ください。
<<SPACE>>
<<SPACE>>
リサ:「この表現は、メールに何か資料やファイルを添付している場合に使用されます。特に、詳細な情報やデータ、イメージなどを共有したい場合、テキストとしてメールに書くよりも、添付ファイルとして送る方が効果的な場合が多いわ。このフレーズを使うことで、受信者に添付ファイルの存在を知らせ、それを確認するよう促すことができるのよ。」
ユウタ:「そうなんだ。だから、メールに添付があるときは、その旨を伝えるフレーズを忘れずに入れるようにしないと、相手に気づいてもらえないかもしれないんだね。」
<<SPACE>>
<<SPACE>>
We have been working on _______ for _______ now.
～に着手して（期間）になります。
<<SPACE>>
<<SPACE>>
リサ:「この文型は現在完了進行形を使用しており、特定のタスクやプロジェクトにどれだけの時間取り組んできたのかを伝える際に用いられるわ。この表現を使用することで、取り組みの進行状況やその取り組みが始まった時間を具体的に示すことができるの。」
ユウタ:「なるほど、プロジェクトの進行状況を相手に伝えるときに、どれだけの時間そのタスクに取り組んできたのかを示すことは、そのタスクの進行度や重要性を理解してもらう上で役立ちそうだね。」
リサ:「それでは、次の表現を詳しく見ていきましょう。」
<<SPACE>>
<<SPACE>>
We expect to _______ by _______. / We plan to ______ by _______.
リサ:「これらのフレーズは、特定のタスクやアクションを完了させる予定の日付や時期を伝えるときに使用します。これにより、受信者はプロジェクトの進行度や計画を具体的に理解できます。」
<<SPACE>>
<<SPACE>>
例:
We expect to finish the website redesign by June 15th.
6月15日までにウェブサイトのリデザインを完了する予定です。
<<SPACE>>
We plan to start the marketing campaign by the end of the month.
月末までにマーケティングキャンペーンを開始する予定です。
<<SPACE>>
<<SPACE>>
ユウタ:「これは、具体的なタイムラインを示すときに役立ちそうだね。」
<<SPACE>>
<<SPACE>>
We had to delay _______ for _______ due to ________.
（理由）のため、（アクション）を（期間）ほど遅らせなければなりませんでした。
<<SPACE>>
<<SPACE>>
リサ:「このフレーズは、何らかの理由で予定していたアクションの遅延が発生した場合に使用します。この表現を使うことで、遅延の理由とそれによって生じた影響を明確に伝えることができます。」
例:
We had to delay the product launch for two weeks due to supply chain issues.
供給チェーンの問題のため、製品のローンチを2週間遅らせる必要がありました。
<<SPACE>>
<<SPACE>>
_______ is under way / _______ is in progress.
～は現在進行中です。
<<SPACE>>
<<SPACE>>
リサ:「このフレーズは、現在進行中のタスクやプロジェクトの状況を報告する際に使用します。これは、受信者に対して、そのタスクやプロジェクトが進行中であることを確認させるためのものです。」
例:
The system upgrade is under way.
システムのアップグレードは現在進行中です。
The recruitment process is in progress.
採用のプロセスは進行中です。
<<SPACE>>
<<SPACE>>
ユウタ:「これらのフレーズは、特定のタスクがまだ完了していないこと、または進行中であることを伝えるのに便利そうだね。」
リサ:「その通り、最後に2つのフレーズについて説明するわ。」
<<SPACE>>
<<SPACE>>
In summary, we are on schedule so far / In summary, we are under difficult circumstances.
まとめとして、今のところ予定どおりに進んでいます。 / まとめとして、厳しい状況です。
<<SPACE>>
<<SPACE>>
リサ:「"In summary"は「要するに」や「まとめると」という意味で、メールやプレゼンテーションの最後に全体の内容を簡潔にまとめる際によく使われるフレーズよ。"we are on schedule so far"はこれまでの進捗が予定通りであることを示しているのに対して、"we are under difficult circumstances"は現在の状況が難しいと伝えているわ。これらのフレーズは、受信者に状況の大枠を理解してもらうために重要よ。」
ユウタ:「最後のまとめ部分で、全体の状況を一言で伝えることができるんだね。」
<<SPACE>>
<<SPACE>>
I will keep you updated with the progress of the project.
このプロジェクトについてまた随時報告させていただきます。
<<SPACE>>
<<SPACE>>
リサ:「このフレーズは、継続的にプロジェクトの進捗を報告する意向を示すものよ。"keep you updated"は「随時報告する」という意味で、ビジネスのメールでは非常によく使われる表現よ。これによって、受信者にこれからも情報提供を続けることを約束して、安心感を与えることができるの。」
ユウタ:「確かに、次のアップデートも期待して待っていてもらえるような感じがするね。リサ、これらのフレーズやアドバイスを使って、もっと自信を持って近況報告メールを書けそうだよ。ありがとう！」
リサ:「どういたしまして、ユウタ。これからも何か困ったことがあれば、遠慮なく相談してね。」
<<SPACE>>
TEXT
article_content8_array = article_content8.split("\n")
basic.articles.create(
  title: '報告のメール',
  content: article_content8_array.to_json,
  icon_name: 'mdi-account-edit'
)