<template>
  <v-app>
    <logged-in-app-bar clipped-left>
      <template v-slot:navigation-toggle-button>
        <v-app-bar-nav-icon
          @click="drawer = !drawer"
        />
      </template>
    </logged-in-app-bar>
    <!-- ナビゲーションドロワー -->
    <top-navigation-drawer
      :drawer.sync="drawer"
    />
    <v-main>
      <v-container>
        <v-row>
          <v-col cols="12" v-if="loading">
            <div class="loader-container">
              <v-progress-circular
                indeterminate
                color="primary"
                size="64"
              ></v-progress-circular>
            </div>
          </v-col>

          <template v-else>
            <v-col cols="12">
              <v-card outlined class="mb-3">
                <v-img :src="genreImageUrl" alt="ジャンルの画像" height="300"></v-img>
                  <v-card-title>
                    <v-row no-gutters>
                      <v-col cols="9">ジャンル: {{ post.genre }}</v-col>
                      <v-col cols="3" class="d-flex align-items-center justify-end">
                        <v-btn fab class="elevation-0 bordered-btn mr-2" @click="toggleLike">
                          <v-icon :color="liked ? 'red' : 'grey'">mdi-heart</v-icon>
                        </v-btn>
                        <v-btn fab class="elevation-0 bordered-btn" @click="toggleBookmark">
                          <v-icon :color="bookmarked ? 'blue' : 'grey'">mdi-bookmark</v-icon>
                        </v-btn>
                      </v-col>
                    </v-row>
                  </v-card-title>
                  <v-card-title>
                    <v-row no-gutters>
                      <v-col cols="9">タイトル: {{ post.title }}</v-col>
                    </v-row>
                  </v-card-title>
                <v-divider></v-divider>
                <div class="pa-5" v-html="formattedContent"></div>
              </v-card>
            </v-col>
            <!-- コメント一覧 -->
            <v-col cols="12">
              <v-card outlined class="px-3 py-3">
                <v-list-item-content>
                  コメント一覧
                </v-list-item-content>
                <v-list>
                  <v-list-item-group>
                    <v-list-item v-for="comment in comments" :key="comment.id" class="comment-item">
                      <v-list-item-content>
                        <v-list-item-title>{{ comment.user_name }}</v-list-item-title>
                        <v-list-item-subtitle class="comment-text">
                          {{ comment.comment }}
                        </v-list-item-subtitle>
                      </v-list-item-content>
                      <v-list-item-action>
                        <v-btn icon v-if="comment.user_id === $auth.user.id" @click="deleteComment(comment.id)">
                          <v-icon>mdi-delete</v-icon>
                        </v-btn>
                      </v-list-item-action>
                    </v-list-item>
                  </v-list-item-group>
                </v-list>
                <!-- コメント入力欄 -->
                <v-textarea label="コメント" v-model="newComment" outlined></v-textarea>
                <v-btn @click="submitComment" color="primary">コメントする</v-btn>
              </v-card>
            </v-col>
          </template>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
export default {
  data () {
    return {
      drawer: null,
      post: null,
      liked: false,
      bookmarked: false,
      comments: [],
      newComment: '',
      loading: true,
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
  computed: {
    genreImageUrl () {
      if (this.post && this.post.genre && this.genreImageMapping[this.post.genre]) {
        const imageName = this.genreImageMapping[this.post.genre]
        return require(`@/assets/images/${imageName}.jpg`)
      }
      return null
    },
    formattedContent () {
      return this.post.content.replace(/\n/g, '<br>')
    }
  },
  async created () {
    await this.fetchPostDetail()
  },
  methods: {
    async fetchPostDetail () {
      try {
        const response = await this.$axios.get(`/api/v1/posts/${this.$route.params.id}`)
        this.post = response.data.post
        this.liked = response.data.liked
        this.bookmarked = response.data.bookmarked
        this.comments = response.data.comments
      } catch (error) {
        console.error(error)
      } finally {
        this.loading = false
      }
    },
    async toggleLike () {
      try {
        if (this.liked) {
          const response = await this.$axios.delete(`/api/v1/posts/${this.post.id}/likes`)
          this.liked = response.data.liked
        } else {
          const response = await this.$axios.post(`/api/v1/posts/${this.post.id}/likes`)
          this.liked = response.data.liked
        }
      } catch (error) {
        console.error(error)
      }
    },
    async toggleBookmark () {
      try {
        if (this.bookmarked) {
          const response = await this.$axios.delete(`/api/v1/posts/${this.post.id}/bookmarks/${this.bookmarkId}`)
          this.bookmarked = response.data.bookmarked
        } else {
          const response = await this.$axios.post(`/api/v1/posts/${this.post.id}/bookmarks`)
          this.bookmarked = response.data.bookmarked
          this.bookmarkId = response.data.bookmark_id
        }
      } catch (error) {
        console.error(error)
      }
    },
    async submitComment () {
      try {
        const response = await this.$axios.post(`/api/v1/posts/${this.post.id}/comments`, {
          comment: { comment: this.newComment }
        })
        this.comments.push(response.data.comment)
        this.newComment = ''
      } catch (error) {
        console.error(error)
      }
    },
    async deleteComment (commentId) {
      try {
        await this.$axios.delete(`/api/v1/posts/${this.post.id}/comments/${commentId}`)
        this.comments = this.comments.filter(comment => comment.id !== commentId)
      } catch (error) {
        console.error(error)
      }
    }
  }
}
</script>

<style scoped>
.loader-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}
.bordered-btn {
  border: 1px solid rgb(185, 180, 180);
  border-radius: 50%;
}
.comment-text {
  white-space: pre-line;
}
.comment-item:not(:last-child) {
  border-bottom: 1px solid #dedede;  /* グレーの境界線 */

}
</style>
