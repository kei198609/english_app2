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
            <v-btn @click="toggleLike">
              <v-icon :color="liked ? 'red' : 'grey'">mdi-heart</v-icon>
            </v-btn>
            <v-btn @click="toggleBookmark">
              <v-icon :color="bookmarked ? 'blue' : 'grey'">mdi-bookmark</v-icon>
            </v-btn>
            <v-col cols="5">
              <v-card outlined class="mb-3">
                <v-card-title>タイトル: {{ post.title }}</v-card-title>
                <v-card-text>{{ post.content }}</v-card-text>
              </v-card>
            </v-col>
            <!-- コメント一覧 -->
            <v-col cols="10">
              <v-list>
                <v-list-item-group>
                  <v-list-item v-for="comment in comments" :key="comment.id">
                    <v-list-item-content>
                      <v-list-item-title>{{ comment.user_name }}</v-list-item-title>
                      <v-list-item-subtitle>{{ comment.comment }}</v-list-item-subtitle>
                    </v-list-item-content>
                    <v-list-item-action>
                      <v-btn icon @click="deleteComment(comment.id)">
                        <v-icon>mdi-delete</v-icon>
                      </v-btn>
                    </v-list-item-action>
                  </v-list-item>
                </v-list-item-group>
              </v-list>
            </v-col>
            <!-- コメント入力欄 -->
            <v-col cols="10">
              <v-text-field label="コメント" v-model="newComment"></v-text-field>
              <v-btn @click="submitComment">コメントする</v-btn>
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
      loading: true
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
</style>
