# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "admin@mail.com",
  password: "123456"
  )

User.create!(
  [
    {
      email: 'user1@gmail.com',
      password: '123456',
      name: 'user1',
      is_deleted: false
    },
    {
      email: 'user2@gmail.com',
      password: '123456',
      name: 'user2',
      is_deleted: false
    },
    {
      email: 'user3@gmail.com',
      password: '123456',
      name: 'user3',
      is_deleted: false
    }
  ]
  )

Genre.create!(
  [
    {
      genre_name: "ケーキ"
    },
    {
      genre_name: "チョコレート"
    },
    {
      genre_name: "焼き菓子"
    },
    {
      genre_name: "プリン"
    },
    {
      genre_name: "和菓子"
    },
    {
      genre_name: "アイス"
    },
    {
      genre_name: "ゼリー"
    }
  ]
  )

Shop.create!(
  [
    {
      shop_name: "ラブニュー",
      address: "兵庫県神戸市中央区山本通３丁目７−３ ユートピアトーア 1F",
      latitude: 34.6959439,
      longitude: 135.186761,
      telephone_number: "078-252-0766",
      shop_URL: "https://www.lavenue-hirai.com/"
    },
    {
      shop_name: " アンリ・シャルパンティエ新宿髙島屋店",
      address: "東京都渋谷区千駄ヶ谷5-24-2新宿タカシマヤB1階",
      latitude: 35.6877186,
      longitude: 139.7021464,
      telephone_number: "03-5361-1314",
      shop_URL: "https://www.suzette-shop.jp/shop/c/cHENRI/?_bdadid=I7LMSU.00000017&utm_source=yahoo&utm_medium=cpc&utm_campaign=henri&yclid=YSS.1001120149.EAIaIQobChMIuu_G7eKe_QIVxqiWCh1vsA1KEAAYASAAEgLiSfD_BwE"
    }
  ]
  )

PostItem.create!(
  [
    {
      user_id: "1",
      shop_id: "1",
      genre_id: "1",
      item_name: "グラシオー　ショコラテ",
      price: "3300",
      item_URL: "https://boutique.lavenue-hirai.com/?pid=166251388"
    },
    {
      user_id: "1",
      shop_id: "1",
      genre_id: "2",
      item_name: "グランクレアシオン",
      price: "3900",
      item_URL: "https://boutique.lavenue-hirai.com/?pid=160445845"
    },
    {
      user_id: "1",
      shop_id: "1",
      genre_id: "2",
      item_name: "ロマンス",
      price: "3300",
      item_URL: "https://boutique.lavenue-hirai.com/?pid=160447087"
    },
    {
      user_id: "1",
      shop_id: "1",
      genre_id: "2",
      item_name: "アバンチュール",
      price: "2280",
      item_URL: "https://boutique.lavenue-hirai.com/?pid=166251237"
    },
    {
      user_id: "1",
      shop_id: "1",
      genre_id: "2",
      item_name: "マジック",
      price: "1500",
      item_URL: "https://boutique.lavenue-hirai.com/?pid=166251283"
    },
    {
      user_id: "1",
      shop_id: "1",
      genre_id: "2",
      item_name: "ヴァーグ",
      price: "1300",
      item_URL: "https://boutique.lavenue-hirai.com/?pid=166251328"
    },
    {
      user_id: "1",
      shop_id: "2",
      genre_id: "1",
      item_name: "ザッハトルテ",
      price: "540",
      item_URL: "https://www.suzette-shop.jp/shop/g/gSN0008/"
    }
  ]
  )