@Builder
export function ThemeDemoBuilder() {
  ThemeDemo()
}

@Entry
@Component
struct ThemeDemo {
  @State textColor: ResourceColor = $r('sys.color.font_primary');
  @State columnBgColor: ResourceColor = $r('sys.color.background_primary');
  @Consume('mainStack') pathStack: NavPathStack;
  @State log: string = ''

  onWillApplyTheme(theme: Theme) {
    this.textColor = theme.colors.warning; // red
    this.columnBgColor = theme.colors.backgroundPrimary; // white
    console.info('Child onWillApplyTheme');
    this.log = 'onWillApplyTheme()'
  }

  build() {
    NavDestination() {
      Column() {
        Text(this.log)
          .fontColor(this.textColor)
          .fontSize(15)
          .padding({ bottom: 10 })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor(this.columnBgColor)
    }.hideBackButton(true)
  }
}