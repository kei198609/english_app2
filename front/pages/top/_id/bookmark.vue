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
          <BookmarkList
            v-for="bookmark in bookmarks"
            :key="bookmark.id"
            :bookmark="bookmark"
          />
        <v-pagination
          v-model="current_page"
          :length="total_pages"
          @input="fetchBookmarks"
        />
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import BookmarkList from '~/components/BookmarkList.vue'

export default {
  components: {
    BookmarkList
  },
  data () {
    return {
      drawer: null,
      bookmarks: [],
      total_pages: 0,
      current_page: 1
    }
  },
  async created () {
    await this.fetchBookmarks()
  },
  methods: {
    async fetchBookmarks () {
      const response = await this.$axios.get(`/api/v1/users/bookmarks?page=${this.current_page}`)
      console.log(response.data)
      this.bookmarks = response.data.bookmarks
      this.total_pages = response.data.total_pages
    }
  }
}
</script>
