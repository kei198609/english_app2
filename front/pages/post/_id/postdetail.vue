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
            <v-col cols="5">
              <v-card outlined class="mb-3">
                <v-card-title>Subject: {{ post.subject_english }}</v-card-title>
                <v-card-text>{{ post.content_english }}</v-card-text>
              </v-card>
            </v-col>
            <v-col cols="5">
              <v-card outlined class="mb-3">
                <v-card-title>件名: {{ translation_subject }}</v-card-title>
                <v-card-text>{{ translation_content }}</v-card-text>
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
      translation_subject: '',
      translation_content: '',
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
        this.translation_subject = response.data.translation_subject.text
        this.translation_content = response.data.translation_content.text
      } catch (error) {
        console.error(error)
      } finally {
        this.loading = false
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
