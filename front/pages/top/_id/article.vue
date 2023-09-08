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
        <div>
          <v-card v-for="category in groupedArticles" :key="category.id">
            <v-list-item>
              <v-list-item-content>
                {{ category.category_name_article }}
              </v-list-item-content>
            </v-list-item>
            <v-list v-for="article in category.articles" :key="article.id">
              <v-list-item>
                <v-list-item-icon>
                  <v-icon>{{ article.icon_name }}</v-icon>
                </v-list-item-icon>
                <v-list-item-content>
                  <nuxt-link :to="`/article/${article.id}`">{{ article.title }}</nuxt-link>
                </v-list-item-content>
              </v-list-item>
            </v-list>
          </v-card>
        </div>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
export default {
  data () {
    return {
      drawer: null,
      articles: []
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
    }
  },
  async asyncData ({ $axios }) {
    const { data: articles } = await $axios.get('/api/v1/articles')
    return { articles }
  }
}
</script>
