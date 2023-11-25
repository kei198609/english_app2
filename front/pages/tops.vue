<template>
  <div
    id="tops"
  >
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
      <v-main class="main-content">
        <v-container>
          <v-row justify="center">
            <v-col cols="12" md="8">
              <v-card class="px-3 py-3 pb-3 mb-5">
                <CategoryArticles
                  v-for="category in groupedArticles"
                  :key="category.id"
                  :category="category"
                  :isRead="isRead"
                />
                <!-- CategoryArticlesページネーション -->
                <v-pagination class="mt-3"
                  v-model="current_page"
                  :length="total_pages"
                  @input="updatePage"
                />
              </v-card>
              <v-card class="px-3 py-3 pb-3 mb-5">
                <CategoryQuizCard
                  v-for="category in groupedQuizzes"
                  :key="category.id"
                  :category="category"
                  :getQuizAttempt="getQuizAttempt"
                />
                <!-- CategoryQuizCardページネーション -->
                <v-pagination class="mt-3"
                  v-model="quiz_current_page"
                  :length="quiz_total_pages"
                  @input="updateQuizPage"
                />
              </v-card>

              <v-card class="px-3 py-3 mb-5">
                <v-list-item-content>
                  新着記事一覧
                </v-list-item-content>
                <v-select
                  :items="genres"
                  label="ジャンルを選択"
                  v-model="selectedGenre"
                  @change="fetchPostsByGenre(selectedGenre)"
                ></v-select>
              </v-card>

              <div
                v-for="post in posts"
                :key="post.id"
              >
                <v-hover>
                  <template v-slot:default="{ hover }">
                    <v-card
                      class="mx-auto mb-5"
                      :elevation="hover ? 4 : 2"
                      @click="$router.push(`/post/${post.id}/postdetail`)"
                    >
                      <v-row class="px-3">
                        <v-col cols="12" lg="5">
                          <v-img :src="getGenreImageUrl(post)" alt="ジャンルの画像" class="genre-image"></v-img>
                        </v-col>
                        <v-col class="d-flex flex-column justify-space-between">
                          <v-card-text class="text-h5 mb-auto">
                            {{ post.title }}
                          </v-card-text>
                          <v-card-actions>
                            <UserAvatarPost :post="post" :noimage="noimage" />
                          </v-card-actions>
                        </v-col>
                      </v-row>
                    </v-card>
                  </template>
                </v-hover>
              </div>
              <!-- 新着記事一覧のページネーション -->
              <v-pagination
                v-model="post_current_page"
                :length="post_total_pages"
                @input="updatePostPage"
              />
            </v-col>
            <v-col cols="12" md="4" lg="4">
              <UserSection v-if="user" :user="user" />
            </v-col>
          </v-row>
        </v-container>
      </v-main>
    </v-app>
  </div>
</template>

<script>
import UserAvatarPost from '~/components/UserAvatarPost.vue'
import UserSection from '~/components/UserSection.vue'
import CategoryArticles from '~/components/CategoryArticles.vue'
import CategoryQuizCard from '~/components/CategoryQuizCard.vue'

export default {
  components: {
    UserAvatarPost,
    UserSection,
    CategoryArticles,
    CategoryQuizCard
  },
  data () {
    return {
      drawer: null,
      user: null,
      posts: null,
      noimage: require('~/assets/images/noimage.jpg'),
      searchQuery: null,
      selectedGenre: '全て',
      genres: [
        '全て', 'メールの構成とフォーマット', '件名の書き方', 'コミュニケーションとエチケット',
        'メールのトーンやスタイル', 'フォローアップメールのテクニック', '問い合わせや要求を行うメール',
        'お礼や謝罪のメール', '異文化間のコミュニケーション', 'ビジネスメールの語彙やフレーズ',
        '緊急時やトラブル時のメール', '同僚や上司へのメール',
        '取引先や顧客へのメール', '提案のメール',
        '会議やイベントの調整メール', '情報共有', 'その他'
      ],
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
      },
      articles: [],
      readArticles: [],
      total_pages: 0,
      current_page: 1,
      quizzes: [],
      quizAttempts: [],
      quiz_current_page: 1,
      quiz_total_pages: 0,
      post_current_page: 1,
      post_total_pages: 0
    }
  },
  computed: {
    groupedArticles () {
      return this.articles.reduce((categories, article) => {
        const category = categories.find(c => c.id === article.category.id)
        if (category) {
          category.articles.push(article)
        } else {
          categories.push({
            id: article.category.id,
            category_name_article: article.category.category_name_article,
            articles: [article]
          })
        }
        return categories
      }, [])
    },
    groupedQuizzes () {
      return this.quizzes.reduce((categories, quiz) => {
        const category = categories.find(c => c.id === quiz.category.id)
        if (category) {
          category.quizzes.push(quiz)
        } else {
          categories.push({
            id: quiz.category.id,
            category_name: quiz.category.category_name,
            quizzes: [quiz]
          })
        }
        return categories
      }, [])
    }
  },
  methods: {
    isRead (articleId) {
      return this.readArticles && this.readArticles.includes(articleId)
    },
    getQuizAttempt (quizId) {
      const attempts = this.quizAttempts.filter(attempt => attempt.quiz_id === quizId)
      return attempts[attempts.length - 1]
    },
    updatePage () {
      this.fetchData()
    },
    updateQuizPage () {
      this.fetchQuizData()
    },
    updatePostPage () {
      this.fetchPostsByGenre(this.selectedGenre)
    },
    async fetchPostsByGenre (genre) {
      try {
        if (genre === '全て') {
          const response = await this.$axios.get('/api/v1/posts', { params: { page: this.post_current_page } })
          this.posts = response.data.posts
          this.post_total_pages = response.data.total_pages
        } else {
          const response = await this.$axios.get('/api/v1/posts', { params: { genre, page: this.post_current_page } })
          this.posts = response.data.posts
          this.post_total_pages = response.data.total_pages
        }
      } catch (error) {
        console.error('Error fetching posts by genre:', error)
      }
    },
    getGenreImageUrl (post) {
      if (post && post.genre && this.genreImageMapping[post.genre]) {
        const imageName = this.genreImageMapping[post.genre]
        return require(`@/assets/images/${imageName}.jpg`)
      }
      return this.noimage // ジャンル画像がない場合にデフォルト画像を表示
    },
    async fetchData () {
      try {
        if (this.$auth.loggedIn) {
          // ログインしているユーザーのIDを取得
          const userId = this.$auth.user.id
          // ユーザーの詳細情報を取得
          const userResponse = await this.$axios.get(`/api/v1/users/${userId}`)
          this.user = userResponse.data.user
          this.user.followers_count = userResponse.data.followers_count
          this.user.following_count = userResponse.data.following_count
          this.data = userResponse.data.data
          // 記事情報を取得
          const articlesResponse = await this.$axios.get(`/api/v1/articles?page=${this.current_page}`)
          this.articles = articlesResponse.data.articles
          this.total_pages = articlesResponse.data.total_pages
          // 記事を読んだかどうか情報を取得
          const readArticlesResponse = await this.$axios.get('/api/v1/article_readings/user_articles_read')
          this.readArticles = readArticlesResponse.data
        }
      } catch (error) {
        console.error('Error fetching data', error)
      }
    },
    async fetchQuizData () {
      try {
        if (this.$auth.loggedIn) {
          // ログインしているユーザーのIDを取得
          const userId = this.$auth.user.id
          // ユーザーの詳細情報を取得
          const userResponse = await this.$axios.get(`/api/v1/users/${userId}`)
          this.user = userResponse.data.user
          this.user.followers_count = userResponse.data.followers_count
          this.user.following_count = userResponse.data.following_count
          this.data = userResponse.data.data

          const quizzesResponse = await this.$axios.get(`/api/v1/quizzes?page=${this.quiz_current_page}`)
          this.quizzes = quizzesResponse.data.quizzes
          this.quiz_total_pages = quizzesResponse.data.total_pages

          const categoriesResponse = await this.$axios.get('/api/v1/categories')
          this.categories = categoriesResponse.data

          const quizResponse = await this.$axios.get('/api/v1/quiz_attempts')
          this.quizAttempts = quizResponse.data

          // ストアからクイズの試行結果を取得
          await this.$store.dispatch('fetchQuizAttempts')
        }
      } catch (error) {
        console.error('Error fetching data', error)
      }
    }
  },
  async created () {
    try {
      await this.fetchPostsByGenre(this.selectedGenre)
      await this.fetchData()
      await this.fetchQuizData()
    } catch (error) {
      console.error('Error fetching posts:', error)
    }
  }
}
</script>
