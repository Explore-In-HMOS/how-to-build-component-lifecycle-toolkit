import { NavigationButton } from '../components/NavigationButton';

@Builder
export function ReuseDemoBuilder() {
  ReuseDemo()
}


@Entry
@ComponentV2
export struct ReuseDemo {
  @Local condition: boolean = true;
  @Local log: string = ''

  build() {
    NavDestination() {
      NavigationButton({ title: 'Recycle/Reuse' }).margin({top:30}).onClick(() => {
        this.condition = !this.condition;
      })
      if (this.condition) {
        ReusableV2Component()
      } else{
        Text('no log').backgroundColor(Color.Red).margin(10)
      }

    }.hideBackButton(true)
  }
}

@ReusableV2
@ComponentV2
export struct ReusableV2Component {
  @Local log: string = ''

  aboutToReuse() {
    console.info('Child aboutToReuse')
    this.log = 'aboutToReuse()'
  }

  build() {
    Column() {
      Text(this.log).backgroundColor(Color.Green).margin(10)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
