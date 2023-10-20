<template>
  <div>
    <v-hover>
      <template v-slot:default="{ hover }">
        <v-card
          class="mx-auto mb-5"
          :elevation="hover ? 4 : 2"
          @click="$router.push(`/post/${bookmark.post.id}/postdetail`)"
        >
        <v-row class="px-3">
          <v-col cols="12" md="4" lg="4">
            <v-img :src="getGenreImageUrl(bookmark.post)" alt="ジャンルの画像" class="genre-image"></v-img>
          </v-col>
          <v-col class="d-flex flex-column justify-space-between">
            <v-card-text class="text-h5 mb-auto">
              {{ bookmark.post.title }}
            </v-card-text>
            <v-card-actions>
              <UserAvatarBookmarkPost :bookmark="bookmark" :noimage="noimage" />
            </v-card-actions>
          </v-col>
        </v-row>
        </v-card>
      </template>
    </v-hover>
  </div>
</template>

<script>
import UserAvatarBookmarkPost from '~/components/UserAvatarBookmarkPost.vue'

export default {
  components: {
    UserAvatarBookmarkPost
  },
  data () {
    return {
      noimage: require('~/assets/images/noimage.jpg'),
      genreImageMapping: {
        メールの構成とフォーマット: 'メールの構成とフォーマット',
        件名の書き方: '件名の書き方',
        コミュニケーションとエチケット: 'コミュニケーションとエチケット',
        メールのトーンやスタイル: 'メールのトーンやスタイル',
        フォローアップメールのテクニック: 'フォローアップメールのテクニック',
        問い合わせや要求を行うメール: '問い合わせや要求を行うメール',
        お礼や謝罪のメール: 'お礼や謝罪のメール',
        異文化間のコミュニケーション: '異文化間のコミュニケーション',
        ビジネスメールの語彙やフレーズ: 'ビジネスメールの語彙やフレーズ',
        緊急時やトラブル時のメール: '緊急時やトラブル時のメール',
        同僚や上司へのメール: '同僚や上司へのメール',
        取引先や顧客へのメール: '取引先や顧客へのメール',
        提案のメール: '提案のメール',
        会議やイベントの調整メール: '会議やイベントの調整メール',
        情報共有: '情報共有',
        その他: 'その他'
      }
    }
  },
  props: {
    bookmark: {
      type: Object,
      required: true
    }
  },
  methods: {
    getGenreImageUrl (post) {
      if (post && post.genre && this.genreImageMapping[post.genre]) {
        const imageName = this.genreImageMapping[post.genre]
        return require(`@/assets/images/${imageName}.jpg`)
      }
      return this.noimage // ジャンル画像がない場合にデフォルト画像を表示
    }
  }
}
</script>
