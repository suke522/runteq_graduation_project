import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="stopwatch"
export default class extends Controller {
  static targets = ["display"]

  connect() {
    this.startTime = 0
    this.elapsedTime = 0
    this.timerInterval = null
    this.updateDisplay(0)
  }

  start() {
    if (this.timerInterval) return // 二重起動防止

    this.startTime = Date.now()
    this.timerInterval = setInterval(() => this.update(), 10)
  }

  stop() {
    if (!this.timerInterval) return

    clearInterval(this.timerInterval)
    this.timerInterval = null
    this.elapsedTime += Date.now() - this.startTime
  }

  reset() {
    clearInterval(this.timerInterval)
    this.timerInterval = null
    this.startTime = 0
    this.elapsedTime = 0
    this.updateDisplay(0)
  }

  update() {
    const time = Date.now() - this.startTime + this.elapsedTime
    this.updateDisplay(time)
  }

  updateDisplay(ms) {
    const time = new Date(ms)
    const minutes = String(time.getUTCMinutes()).padStart(2, "0")
    const seconds = String(time.getUTCSeconds()).padStart(2, "0")
    const milliseconds = String(Math.floor(time.getUTCMilliseconds() / 10)).padStart(2, "0")
    this.displayTarget.textContent = `${minutes}:${seconds}.${milliseconds}`
  }

  async save() {
    console.log("💾 saveボタンが押されました")
    this.stop() // 計測を停止
    const totalSeconds = Math.floor(this.elapsedTime / 1000) // 秒単位で保存
    const totalMinutes = Math.floor(totalSeconds / 60) // 分単位に変換

    const token = document.querySelector('meta[name="csrf-token"]').content

    // 記録作成画面にリダイレクト（時間をパラメータで渡す）
    window.location.href = `/works/new?total=${totalMinutes}`
  }
}