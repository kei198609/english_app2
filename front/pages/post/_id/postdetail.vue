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
                <v-card-title>タイトル: {{ post.title }}</v-card-title>
                <div class="d-flex justify-end">
                  <div class="pr-3">
                    <v-btn fab class="elevation-0 bordered-btn" @click="toggleLike">
                      <v-icon :color="liked ? 'red' : 'grey'">mdi-heart</v-icon>
                    </v-btn>
                  </div>
                  <div class="pr-3">
                    <v-btn fab class="elevation-0 bordered-btn" @click="toggleBookmark">
                      <v-icon :color="bookmarked ? 'blue' : 'grey'">mdi-bookmark</v-icon>
                    </v-btn>
                  </div>
                </div>
                <v-card-text>{{ post.content }}</v-card-text>
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
                        <v-btn icon @click="deleteComment(comment.id)">
                          <v-icon>mdi-delete</v-icon>
                        </v-btn>
                      </v-list-item-action>
                    </v-list-item>
                  </v-list-item-group>
                </v-list>
                <!-- コメント入力欄 -->
                <v-textarea label="コメント" v-model="newComment" outlined></v-textarea>
                <v-btn @click="submitComment">コメントする</v-btn>
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
        ビジネス文書: 'business_documents',
        英語メール表現: 'english_email_expressions',
        一般的な英文メッセージ: 'general_english_message'
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
