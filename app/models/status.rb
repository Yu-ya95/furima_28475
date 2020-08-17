class Status < ActiveHash::Base
  self.data = [
    { code: 1, name: '---' },
    { code: 2, name: '新品、未使用' },
    { code: 3, name: '未使用に近い' },
    { code: 4, name: '目立った傷や汚れなし' },
    { code: 5, name: 'やや傷や汚れあり' },
    { code: 6, name: '傷や汚れあり' },
    { code: 7, name: '全体的に状態が悪い' },
]
end
