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
      <!-- メインコンテンツ -->
      <v-parallax>
        <v-img
          :src="homeImg"
          alt="homeImg"
          :aspect-ratio="16/9"
          gradient="to top right, rgba(100,115,201,.33), rgba(25,32,72,.7)"
        >
          <v-container
            fill-height
          >
            <v-row
              justify="center"
              align="center"
            >
              <v-col
                cols="12"
                :sm="container.sm"
                :md="container.md"
              >
                <v-card-title
                  class="white--text"
                >
                  最近のプロジェクト
                </v-card-title>

                <v-divider
                  dark
                  class="mb-4"
                />

                <v-row
                  align="center"
                >
                  <v-col
                    cols="12"
                    :sm="card.sm"
                    :md="card.md"
                  >
                    <v-btn
                      block
                      :height="card.height"
                      :elevation="card.elevation"
                    >
                      <div>
                        <v-icon
                          size="24"
                          color="myblue"
                          class="my-2"
                        >
                          mdi-plus
                        </v-icon>
                        <div
                          class="caption myblue--text"
                        >
                          プロジェクトを追加
                        </div>
                      </div>
                    </v-btn>
                  </v-col>
                </v-row>
              </v-col>
            </v-row>
          </v-container>
        </v-img>
      </v-parallax>

      <v-container>
        <v-row justify="center">
          <v-col
            cols="12"
            :sm="container.sm"
            :md="container.md"
          >
            <v-card-title>
              全てのプロジェクト
            </v-card-title>

            <v-divider class="mb-4" />

            <v-data-table
              :headers="tableHeaders"
              :items="recentProjects"
              item-key="id"
              hide-default-footer
            >
              <template v-slot:[`item.name`]="{ item }">
                <nuxt-link
                  :to="$my.projectLinkTo(item.id)"
                  class="text-decoration-none"
                >
                  {{ item.name }}
                </nuxt-link>
              </template>
              <template v-slot:[`item.updatedAt`]="{ item }">
                {{ $my.dataFormat(item.updatedAt) }}
              </template>
            </v-data-table>
          </v-col>
        </v-row>
      </v-container>

    </v-app>
  </div>
</template>

<script>
import homeImg from '~/assets/images/logged-in/home.png'
export default {
  // layout: 'logged-in'6行目と重複しているのでコメントアウト,
  data () {
    return {
      drawer: null,
      homeImg,
      container: {
        sm: 10,
        md: 8
      },
      card: {
        sm: 6,
        md: 4,
        height: 120,
        elevation: 4
      },
      tableHeaders: [
        {
          text: '名前',
          value: 'name'
        },
        {
          text: '更新日',
          width: 150,
          value: 'updatedAt'
        }
      ]
    }
  },
  // 64レッスン
  computed: {
    recentProjects () {
      const copyProjects = Array.from(this.$store.state.project.list)
      return copyProjects.sort((a, b) => {
        if (a.updatedAt > b.updatedAt) { return -1 }
        if (a.updatedAt < b.updatedAt) { return 1 }
        return 0
      })
    }
  }
}
</script>

<style lang="scss">
#tops {
  .v-parallax__content{
    padding: 0;
  }
}

</style>
