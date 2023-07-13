<script>
import { Pie } from 'vue-chartjs'

export default {
  extends: Pie,
  props: {
    chartData: {
      type: Object,
      default: null
    }
  },
  mounted () {
    // Overwriting base render method with actual data.
    this.renderChart({
      labels: Object.keys(this.chartData),
      datasets: [
        {
          data: Object.values(this.chartData),
          backgroundColor: ['#f87979', '#7C4DFF', '#FFC107', '#8BC34A', '#FF5722'], // You can customize the colors here
          hoverBackgroundColor: ['#f87979', '#7C4DFF', '#FFC107', '#8BC34A', '#FF5722'] // You can customize the colors here
        }
      ]
    }, { responsive: true, maintainAspectRatio: false })
  }
}
</script>
