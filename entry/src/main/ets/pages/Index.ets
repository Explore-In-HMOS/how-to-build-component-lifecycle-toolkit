import { ArcScrollBar } from '@kit.ArkUI'
import { NavigationButton } from '../components/NavigationButton'

@Entry
@Component
export struct Index {
  private scroller: Scroller = new Scroller()
  @Provide('mainStack') pathStack: NavPathStack = new NavPathStack()
  @State switch: boolean = false
  @State log: Array<string> = [];

  onPageShow() {
    console.info('Child onPageShow');
    this.log.push('onPageShow()')
  }

  onPageHide() {
    console.info('Child onPageHide');
    this.log.push('onPageHide()')
  }

  onBackPress() {
    console.info('Child onBackPress');
    this.log.push('onBackPress()')
  }

  build() {
    Navigation(this.pathStack) {
      Stack() {
        Scroll(this.scroller) {
          Column({ space: 20 }) {
            Text(this.log.toString()).padding({ bottom: 10 }).fontColor(Color.Red)
            NavigationButton({ title: 'Lifecycle Demo' }).onClick(() => {
              this.pathStack.pushPathByName('LifecycleDemo', null)
            })
            NavigationButton({ title: 'Reuse Demo' }).onClick(() => {
              this.pathStack.pushPathByName('ReuseDemo', null)
            })
            NavigationButton({ title: 'Theme Demo' }).onClick(() => {
              this.pathStack.pushPathByName('ThemeDemo', null)
            })
            NavigationButton({ title: '@Link Demo' }).onClick(() => {
              this.pathStack.pushPathByName('LinkDemo', null)
            })
          }
          .padding(20)
          .alignItems(HorizontalAlign.Center)
        }
        .scrollBar(BarState.Off)
        .width('90%')

        ArcScrollBar({ scroller: this.scroller, state: BarState.Auto })
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Black)
      .alignContent(Alignment.Center)
    }
    .hideTitleBar(true)
  }
}