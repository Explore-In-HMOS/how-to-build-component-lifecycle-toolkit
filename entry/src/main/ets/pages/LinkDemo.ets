import { ChildComponent } from '../components/ChildComponent'

@Builder
export function LinkDemoBuilder() {
  LinkDemo()
}

@Component
export struct LinkDemo {
  @Consume('mainStack') pathStack: NavPathStack;
  @State count: number = 0

  build() {
    NavDestination() {
      Column() {
        Text(`Parent Count: ${this.count}`)
          .padding({ bottom: 10 })

        ChildComponent({
          count: this.count
        })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }.hideBackButton(true)
  }
}