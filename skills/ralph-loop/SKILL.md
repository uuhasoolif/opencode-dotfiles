---
name: ralph-loop
description: 重复执行任务模式 - 用户可能要求重复执行某个任务N次
compatibility: opencode
metadata:
  created: 2026-03-30
  usage: 当用户说"循环"、"重复"、"执行N次"时使用此技能
---

# Ralph Loop 技能

## 什么时候使用

当用户说以下类似的话时：
- "循环执行这个任务"
- "重复做10次"
- "持续执行直到完成"
- "一直运行"
- 使用 `/ralph-loop` 命令

## 如何执行

1. 理解任务目标
2. 确定重复次数或终止条件
3. 持续执行并报告每次结果
4. 完成后汇总所有执行结果

## 注意事项

- 每次执行都要有明确的进度反馈
- 如果任务失败，记录失败原因
- 用户可以随时中断循环

---

# Playwright 浏览器自动化技能

## 什么时候使用

当用户说以下类似的话时：
- "打开浏览器"
- "访问某个网站"
- "截图"
- "点击某个按钮"
- "填写表单"
- "爬取网页数据"
- "测试网站功能"
- 使用 `/playwright` 命令

## 可用工具

1. **playwright_browser_navigate** - 导航到URL
2. **playwright_browser_click** - 点击元素
3. **playwright_browser_type** - 输入文本
4. **playwright_browser_snapshot** - 获取页面快照(可访问性树)
5. **playwright_browser_take_screenshot** - 截图
6. **playwright_browser_evaluate** - 执行JavaScript
7. **playwright_browser_network_requests** - 查看网络请求
8. **playwright_browser_select_option** - 选择下拉选项
9. **playwright_browser_fill_form** - 填写表单

## 使用示例

### 简单浏览
```
1. 使用 playwright_browser_navigate 访问 https://example.com
2. 使用 playwright_browser_snapshot 获取页面结构
3. 使用 playwright_browser_take_screenshot 截图
```

### 填写表单
```
1. playwright_browser_navigate 访问表单页面
2. playwright_browser_fill_form 填写多个字段
3. playwright_browser_click 点击提交按钮
```

### 数据爬取
```
1. playwright_browser_navigate 访问目标页面
2. playwright_browser_evaluate 执行JS提取数据
3. 返回结构化数据
```

## 注意事项

- 先用 snapshot 获取页面结构，了解元素位置
- 使用 ref 来定位元素
- 注意处理弹窗和iframe
- 复杂操作前先截图确认