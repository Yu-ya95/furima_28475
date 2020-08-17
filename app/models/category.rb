class Category < ActiveHash::Base
  self.data = [
    { code: 1, name: '---' },
    { code: 2, name: 'レディース' },
    { code: 3, name: 'メンズ' },
    { code: 4, name: 'ベビー・キッズ' },
    { code: 5, name: 'インテリア・住まい・小物' },
    { code: 6, name: '本・音楽・ゲーム' },
    { code: 7, name: 'おもちゃ・ホビー・グッズ' },
    { code: 8, name: '家電・スマホ・カメラ' },
    { code: 9, name: 'スポーツ・レジャー' },
    { code: 10, name: 'ハンドメイド' },
    { code: 11, name: 'その他' }
  ]
end
