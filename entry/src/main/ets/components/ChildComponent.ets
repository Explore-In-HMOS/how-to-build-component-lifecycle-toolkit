@Component
export struct ChildComponent {
  @Link count: number

  build() {
    Column() {
      Text(`Child Count: ${this.count}`)
        .padding({ bottom: 30 })

      Button('Increase')
        .backgroundColor(Color.Pink)
        .padding(5)
        .fontColor(Color.Black)
        .fontSize(15)
        .borderRadius(10)
        .width('50%')
        .onClick(() => {
          this.count++
        })
    }
  }
}