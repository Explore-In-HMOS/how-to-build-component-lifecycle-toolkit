@Builder
export function LifecycleDemoBuilder() {
  LifecycleDemo()
}

@Component
export struct LifecycleDemo {
  @Consume('mainStack') pathStack: NavPathStack;
  @State log: Array<string> = [];

  aboutToDisappear() { // Invoked when this component is about to disappear
    this.log.push('aboutToDisappear()')
    console.info('Child aboutToDisappear');
  }

  onDidBuild() { // Invoked after the build() function of the custom component is executed
    this.log.push('onDidBuild()')
    console.info('Child onDidBuild');
  }

  aboutToAppear() {
    this.log.push('aboutToAppear()')
    console.info('Child aboutToAppear');
  }

  build() {
    NavDestination() {
      Column() {
        Text(this.log.toString())
          .fontSize(20)
          .margin(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }.hideBackButton(true)
  }
}