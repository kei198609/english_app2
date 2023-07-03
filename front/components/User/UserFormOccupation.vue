<template>
  <v-select
    v-model="setOccupation"
    :rules="rules"
    :items="items"
    label="職種を選択"
    placeholder="あなたの職種"
    outlined
  />
</template>

<script>
export default {
  props: {
    occupation: {
      type: String,
      default: ''
    }
  },
  data () {
    return {
      items: ['営業', '企画・マーケティング', '一般事務', '販売・サービス関連', '専門職(コンサルタント・金融・不動産等)',
        '経理・財務', '人事', '総務', '技術系(ITエンジニア)', '技術系(メディカル、科学、食品、医療)',
        '技術系(電気、電子、機械、自動車)', '技術系(建築、土木関連)', 'クリエイティブ関連', '専門職(インターネット)関連', 'その他'],
      rules: [
        v => !!v || '職種を選択してください'
      ]
    }
  },
  computed: {
    setOccupation: {
      get () {
        return this.occupation
      },
      set (newValue) {
        return this.$emit('update:occupation', newValue)
      }
    }
  }
}
</script>
