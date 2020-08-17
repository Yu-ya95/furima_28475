class Postage < ActiveHash::Base
  self.data = [
    { code: 1, name: '---' },
    { code: 2, name: '着払い(購入者負担)' },
    { code: 3, name: '送料込み(出品者負担)' },
  ]
end
