<script>
import { Doughnut } from 'vue-chartjs'

export default {
  extends: Doughnut,
  props: {
    chartData: {
      type: Object,
      default: null
    }
  },
  methods: {
    getPercentage: function (value, total) {
      return ((value / total) * 100).toFixed(0) + '%'
    }
  },
  mounted () {
    const totalValue = Object.values(this.chartData).reduce((a, b) => a + b, 0)

    this.renderChart({
      labels: Object.keys(this.chartData),
      datasets: [
        {
          data: Object.values(this.chartData),
          backgroundColor: ['#f87979', '#7C4DFF', '#FFC107', '#8BC34A', '#FF5722'], // You can customize the colors here
          hoverBackgroundColor: ['#f87979', '#7C4DFF', '#FFC107', '#8BC34A', '#FF5722'] // You can customize the colors here
        }
      ]
    }, {
      responsive: true,
      maintainAspectRatio: false,
      tooltips: {
        callbacks: {
          label: (tooltipItem, data) => {
            const label = data.labels[tooltipItem.index]
            const value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index]
            const percentage = this.getPercentage(value, totalValue)
            return `${label}: ${percentage}`
          }
        }
      }
    })
  }
}
</script>
