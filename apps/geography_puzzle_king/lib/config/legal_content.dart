/// プライバシーポリシー・利用規約の固定テキスト。
/// 外部URLに依存せず、アプリ内にそのまま表示する（設定画面から遷移）。
/// プライバシーポリシーは Petit Works Apps 全アプリ共通のものを転載
/// （H:\マイドライブ\docs\privacy_policy\privacy_policy_ja.md が原本）。
class LegalSection {
  const LegalSection(this.heading, this.body);
  final String heading;
  final String body;
}

const String kPrivacyPolicyUpdatedAt = '2026年8月2日';

const List<LegalSection> kPrivacyPolicySections = [
  LegalSection(
    '1. 収集する情報',
    '本アプリでは、サービス提供・品質改善のため、以下の情報を収集する場合があります。\n\n'
        '【自動的に収集される情報】\n'
        '・デバイス情報（OS種別・バージョン、端末モデル、言語設定など）\n'
        '・アプリの利用状況（画面遷移、機能の利用頻度、プレイ時間、クラッシュ・エラーログ）\n'
        '・広告識別子（IDFA / Google広告ID）\n'
        '・おおよその位置情報（IPアドレスから推定される国・地域レベル。個人を特定する精密な位置情報は取得しません）\n\n'
        '【ユーザーが入力する情報】\n'
        '・ニックネーム（アプリ内で入力いただいたもの。端末内にのみ保存されます）\n'
        '・プレイ記録・スコア（ランキング機能をご利用の場合）\n\n'
        '【課金に関する情報】\n'
        'アプリ内課金をご利用の場合、決済処理はGoogle Play / Apple App Storeが行い、'
        'クレジットカード番号等の決済情報を当方が直接取得・保存することはありません。'
        '当方が受け取るのは購入完了の通知（購入したアイテムの範囲）のみです。',
  ),
  LegalSection(
    '2. 利用する第三者サービス',
    '本アプリでは、以下の第三者サービスを利用しています。各サービスは、それぞれのプライバシーポリシーに基づいてデータを取り扱います。\n\n'
        '・Firebase（Google LLC）— アプリ基盤・データ保存\n'
        '・Google AdMob（Google LLC）— 広告配信\n'
        '・Google Play課金（Google LLC）— アプリ内課金の決済処理\n\n'
        '各サービスのプライバシーポリシー: https://policies.google.com/privacy',
  ),
  LegalSection(
    '3. 情報の利用目的',
    '収集した情報は、以下の目的で利用します。\n\n'
        '・アプリの機能提供・不具合の修正・パフォーマンス改善\n'
        '・利用状況の分析によるコンテンツ改善\n'
        '・お問い合わせへの対応\n'
        '・不正利用の防止\n\n'
        '収集した情報を、本ポリシーに記載のない目的で第三者に販売・提供することはありません。',
  ),
  LegalSection(
    '4. お子様のプライバシーについて',
    '本アプリは小学生など子供向けの教育コンテンツを含みます。当方は、13歳未満のお子様から'
        '氏名・住所・メールアドレス等の個人を特定できる情報を意図的に収集することはありません。'
        'お子様が本アプリをご利用になる場合は、保護者の方の管理のもとでご利用いただくことを推奨します。\n\n'
        '保護者の方が、お子様に関する情報が収集されている可能性にお気づきの場合は、'
        '下記お問い合わせ先までご連絡ください。速やかに確認・削除の対応をいたします。',
  ),
  LegalSection(
    '5. データの保存期間・安全管理',
    '・収集したデータは、上記利用目的の達成に必要な期間保持します。\n'
        '・Firebase等の第三者サービスを通じて、業界標準的なセキュリティ対策（通信の暗号化等）を講じています。\n'
        '・ただし、インターネット上のデータ伝送・保存について、完全な安全性を保証するものではありません。',
  ),
  LegalSection(
    '6. ユーザーの権利',
    'ご自身に関する情報について、以下のご請求をいただけます。\n\n'
        '・保有している情報の開示請求\n'
        '・情報の訂正・削除請求\n'
        '・情報収集（Analytics等）のオプトアウトのご相談\n\n'
        'ご請求は、下記お問い合わせ先までご連絡ください。本人確認の上、法令の範囲内で対応いたします。\n\n'
        '広告識別子の無効化は、お使いの端末の設定（Android: 「広告」設定）から行うことができます。',
  ),
  LegalSection(
    '7. 本ポリシーの変更',
    '本ポリシーの内容は、法令の改正やサービス内容の変更に応じて、予告なく変更する場合があります。'
        '重要な変更がある場合は、本ページ上でお知らせします。最新の内容は本ページにて随時ご確認ください。',
  ),
  LegalSection(
    '8. お問い合わせ',
    '本ポリシーに関するご質問・ご意見・削除請求等は、以下までご連絡ください。\n\n'
        'Petit Works Apps\n'
        'Email: petitworksdev@gmail.com',
  ),
];

const String kPrivacyPolicyUpdatedAtEn = 'August 2, 2026';

const List<LegalSection> kPrivacyPolicySectionsEn = [
  LegalSection(
    '1. Information We Collect',
    'To provide and improve our services, we may collect the following categories of information.\n\n'
        'Information collected automatically:\n'
        '- Device information (OS type/version, device model, language settings)\n'
        '- App usage data (screen navigation, feature usage frequency, session length, crash and error logs)\n'
        '- Advertising identifiers (Google Advertising ID)\n'
        '- Approximate location (country/region level, inferred from IP address — we do not collect precise, personally identifiable location data)\n\n'
        'Information you provide:\n'
        '- Nickname (entered in the App; stored only on your device)\n'
        '- Play records and scores (if you use the ranking feature)\n\n'
        'Payment-related information:\n'
        'For in-app purchases, payment processing is handled entirely by Google Play. We do not directly collect or store your credit card number or other payment credentials. We only receive purchase-confirmation data (the item purchased).',
  ),
  LegalSection(
    '2. Third-Party Services We Use',
    'This App uses the following third-party services. Each service handles data according to its own privacy policy.\n\n'
        '- Firebase (Google LLC) — app infrastructure and data storage\n'
        '- Google AdMob (Google LLC) — advertising\n'
        '- Google Play Billing (Google LLC) — in-app purchase payment processing\n\n'
        'Each service\'s privacy policy: https://policies.google.com/privacy',
  ),
  LegalSection(
    '3. How We Use Information',
    'We use the information we collect to:\n\n'
        '- Provide App functionality, fix bugs, and improve performance\n'
        '- Analyze usage patterns to improve content\n'
        '- Respond to support inquiries\n'
        '- Prevent fraud and abuse\n\n'
        'We do not sell or share the information we collect with third parties for purposes beyond those described in this Policy.',
  ),
  LegalSection(
    '4. Children\'s Privacy',
    'This App includes educational content designed for children (e.g., elementary school students). We do not knowingly collect personally identifiable information — such as name, address, or email address — from children under 13. We recommend that children use this App under the supervision of a parent or guardian.\n\n'
        'If you are a parent or guardian and believe your child may have provided us with personal information, please contact us at the email address below. We will promptly investigate and delete such information as appropriate.',
  ),
  LegalSection(
    '5. Data Retention and Security',
    '- We retain collected data only for as long as necessary to fulfill the purposes described above.\n'
        '- We rely on industry-standard security measures provided by our third-party service providers (such as Firebase), including encryption of data in transit.\n'
        '- However, no method of transmission or storage over the internet is 100% secure, and we cannot guarantee absolute security.',
  ),
  LegalSection(
    '6. Your Rights and Choices',
    'You may request the following regarding information about you:\n\n'
        '- Access to the information we hold about you\n'
        '- Correction or deletion of your information\n'
        '- Opting out of analytics data collection\n\n'
        'To make such a request, please contact us at the email address below. We will verify your identity and respond in accordance with applicable law.\n\n'
        'You can disable advertising identifiers through your device settings (Android: "Ads" settings).',
  ),
  LegalSection(
    '7. Changes to This Policy',
    'We may update this Privacy Policy from time to time to reflect changes in law or in our services, without prior notice. We will post any material changes on this page. Please check this page periodically for the latest version.',
  ),
  LegalSection(
    '8. Contact Us',
    'If you have any questions, comments, or requests regarding this Policy, please contact us at:\n\n'
        'Petit Works Apps\n'
        'Email: petitworksdev@gmail.com',
  ),
];

const String kTermsOfServiceUpdatedAt = '2026年9月28日';

const List<LegalSection> kTermsOfServiceSections = [
  LegalSection(
    '第1条（適用）',
    '本利用規約（以下「本規約」）は、Petit Works Apps（以下「当方」）が提供するスマートフォンアプリケーション'
        '「ゲームで学ぶ都道府県」（以下「本アプリ」）のご利用条件を定めるものです。'
        '本アプリをダウンロード・ご利用いただいた時点で、本規約に同意いただいたものとします。',
  ),
  LegalSection(
    '第2条（サービス内容）',
    '本アプリは、47都道府県を舞台にしたタワーディフェンス形式の学習ゲームです。'
        '当方は、予告なく本アプリの内容を変更・追加・削除することがあります。',
  ),
  LegalSection(
    '第3条（利用者情報）',
    '本アプリは会員登録を必要とせず、ニックネームのみを端末内に保存して利用する形式です。'
        'そのため、機種変更・アプリの再インストール・端末の初期化を行うと、プレイ記録は復元できません。'
        'あらかじめご了承ください。',
  ),
  LegalSection(
    '第4条（禁止事項）',
    '本アプリのご利用にあたり、以下の行為を禁止します。\n\n'
        '・本アプリの解析、逆コンパイル、逆アセンブル、その他の方法によるソースコードの取得\n'
        '・不正なツールの使用等によるゲームバランス・ランキングの改ざん\n'
        '・他の利用者や第三者への迷惑行為、公序良俗に反するニックネームの使用\n'
        '・当方または第三者の知的財産権、肖像権、プライバシー等の権利を侵害する行為\n'
        '・法令に違反する行為、その他当方が不適切と判断する行為',
  ),
  LegalSection(
    '第5条（広告表示）',
    '本アプリでは、無料でのサービス提供のため広告を表示します。'
        '広告の表示を望まない場合は、本アプリ内の「プレミアム」（有料・買い切り）をご利用いただけます。',
  ),
  LegalSection(
    '第6条（アプリ内課金）',
    '本アプリの「プレミアム」は、広告の非表示と全都道府県の解放を含む、Google Playを通じた買い切り型（非消費型）の有料機能です。'
        '購入手続き・決済はGoogle Playが行い、返金についてはGoogle Playの規約・ポリシーに従います。'
        '当方への直接のお申し出による返金には応じかねる場合があります。',
  ),
  LegalSection(
    '第7条（ランキング機能）',
    '本アプリのランキング機能をご利用いただく場合、入力いただいたニックネームとスコアが'
        '他の利用者にも表示されます。ニックネームには、氏名・連絡先など個人を特定できる情報を'
        '入力しないでください。設定画面からランキングへの表示有無を切り替えることができます。',
  ),
  LegalSection(
    '第8条（免責事項）',
    '当方は、本アプリに事実上または法律上の瑕疵（安全性、信頼性、正確性、完全性、有効性、'
        '特定目的への適合性、バグやエラーがないこと等に関する瑕疵を含みます）がないことを'
        '明示的にも黙示的にも保証しておりません。\n\n'
        '当方は、本アプリに起因して利用者に生じたあらゆる損害について、当方の故意または重大な'
        '過失による場合を除き、一切の責任を負いません。',
  ),
  LegalSection(
    '第9条（サービスの変更・中断・終了）',
    '当方は、利用者への事前の告知をもって、本アプリの提供を中断または終了することができるものとします。'
        'これにより利用者に生じた損害について、当方は責任を負いません。',
  ),
  LegalSection(
    '第10条（規約の変更）',
    '当方は、必要と判断した場合には、利用者に通知することなく本規約を変更できるものとします。'
        '変更後の規約は、本アプリ内に表示した時点から効力を生じるものとします。',
  ),
  LegalSection(
    '第11条（お問い合わせ）',
    '本規約に関するご質問・ご意見等は、以下までご連絡ください。\n\n'
        'Petit Works Apps\n'
        'Email: petitworksdev@gmail.com',
  ),
];

const String kTermsOfServiceUpdatedAtEn = 'September 28, 2026';

const List<LegalSection> kTermsOfServiceSectionsEn = [
  LegalSection(
    'Article 1 (Application)',
    'These Terms of Service (the "Terms") set out the conditions for using the smartphone application '
        '"Geography Puzzle King" (the "App") provided by Petit Works Apps ("we," "us," or "our"). '
        'By downloading or using the App, you agree to be bound by these Terms.',
  ),
  LegalSection(
    'Article 2 (Service Content)',
    'The App is a tower-defense style learning game set across Japan\'s 47 prefectures. '
        'We may change, add to, or remove content from the App at any time without prior notice.',
  ),
  LegalSection(
    'Article 3 (User Information)',
    'The App does not require account registration; only a nickname is stored on your device. '
        'As a result, your play records cannot be restored if you change devices, reinstall the App, or reset your device. '
        'Please be aware of this in advance.',
  ),
  LegalSection(
    'Article 4 (Prohibited Conduct)',
    'When using the App, you may not:\n\n'
        '- Analyze, decompile, disassemble, or otherwise attempt to extract the source code of the App\n'
        '- Use unauthorized tools to manipulate game balance or rankings\n'
        '- Harass other users or third parties, or use nicknames that violate public order and morals\n'
        '- Infringe on our or any third party\'s intellectual property, portrait rights, privacy, or other rights\n'
        '- Violate applicable law, or engage in any other conduct we deem inappropriate',
  ),
  LegalSection(
    'Article 5 (Advertising)',
    'The App displays advertisements to support free access to its content. '
        'If you would prefer not to see ads, you may use the paid "Premium" (one-time purchase) within the App.',
  ),
  LegalSection(
    'Article 6 (In-App Purchases)',
    'The App\'s "Premium" is a one-time (non-consumable) paid feature, which removes ads and unlocks all prefectures, purchased through Google Play. '
        'Purchases and payment processing are handled by Google Play, and refunds are subject to Google Play\'s own terms and policies. '
        'We may not be able to accommodate refund requests made directly to us.',
  ),
  LegalSection(
    'Article 7 (Ranking Feature)',
    'If you use the App\'s ranking feature, the nickname and score you provide will be visible to other users. '
        'Please do not enter personally identifiable information — such as your real name or contact details — as your nickname. '
        'You can toggle your visibility on the ranking from the settings screen.',
  ),
  LegalSection(
    'Article 8 (Disclaimer)',
    'We make no express or implied warranty that the App is free of factual or legal defects '
        '(including defects related to safety, reliability, accuracy, completeness, validity, fitness for a particular purpose, '
        'or the absence of bugs or errors).\n\n'
        'Except in cases of our willful misconduct or gross negligence, we are not liable for any damages arising from your use of the App.',
  ),
  LegalSection(
    'Article 9 (Changes, Suspension, and Termination of Service)',
    'We may suspend or terminate the App with prior notice to users. '
        'We are not liable for any damages users may incur as a result.',
  ),
  LegalSection(
    'Article 10 (Changes to These Terms)',
    'We may change these Terms without notifying users when we deem it necessary. '
        'The revised Terms take effect once displayed within the App.',
  ),
  LegalSection(
    'Article 11 (Contact Us)',
    'If you have any questions or comments regarding these Terms, please contact us at:\n\n'
        'Petit Works Apps\n'
        'Email: petitworksdev@gmail.com',
  ),
];
