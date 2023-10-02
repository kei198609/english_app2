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
        ビジネス文書: 'business_documents',
        英語メール表現: 'english_email_expressions',
        一般的な英文メッセージ: 'general_english_message'
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
