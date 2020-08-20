class DeliveryDay < ActiveHash::Base
  self.data = [
    { code: 1, name: '---' },
    { code: 2, name: '1~2日で発送' },
    { code: 3, name: '2~3日で発送' },
    { code: 4, name: '4~7日で発送' }
  ]
end
