# Vue基础

### 1. Vue 实例 (Vue Instance)

#### 概念：

Vue 应用的核心是 Vue 实例。Vue 实例是 Vue.js 构造函数的一个实例化对象，它管理着应用的数据、生命周期、方法等。

#### 语法：

```javascript
var app = new Vue({
  // 选项
})
```

#### 使用案例：

```java
<div id="app">
  {{ message }}
</div>

<script>
var app = new Vue({
  el: '#app',
  data: {
    message: 'Hello, Vue!'
  }
})
</script>

```

Vue 实例的主要属性和方法：

1. **数据 (Data)**：Vue 实例中的 `data` 属性用于存储应用的数据。这些数据可以是任何 JavaScript 类型，如字符串、数组、对象等。
2. **模板 (Template)**：Vue 实例中的 `template` 属性定义了应用的布局和结构。在模板中，我们可以使用 Vue 的模板语法，如插值、指令等，将数据绑定到 DOM 元素上。
3. **挂载点 (Mounting Point)**：Vue 实例中的 `el` 属性指定了 Vue 实例将要挂载到的 DOM 元素。Vue 将会控制这个 DOM 元素内部的所有内容。
4. **生命周期钩子 (Lifecycle Hooks)**：Vue 实例具有一系列生命周期钩子，它们允许我们在实例的不同阶段执行自定义逻辑。例如，`created` 钩子在实例创建后被调用，`mounted` 钩子在实例挂载到 DOM 后被调用等。
5. **方法 (Methods)**：Vue 实例中的 `methods` 属性用于定义应用中的方法。这些方法可以在模板中调用，也可以在实例的其他方法中使用。

### Vue 实例的属性 (Properties) 和方法 (Methods)

#### 属性 (Properties)：

1. **data**：用于定义 Vue 实例的响应式数据。这些数据将会被 Vue 监听，并且当数据发生变化时，相关的 DOM 将会自动更新。
2. **el**：指定 Vue 实例挂载的元素。它可以是一个 CSS 选择器字符串，也可以是一个实际的 DOM 元素。Vue 将会控制该元素内部的内容。
3. **methods**：定义 Vue 实例中可用的方法。这些方法可以在模板中调用，也可以在实例的其他方法中使用。
4. **computed**：用于定义基于响应式数据计算的属性。这些属性将会根据它们依赖的响应式数据进行缓存，只有在依赖发生改变时才会重新计算。
5. **watch**：用于监听响应式数据的变化，并在数据发生变化时执行自定义的逻辑。

#### 方法 (Methods)：

1. **created()**：在 Vue 实例创建之后被调用，但是在挂载之前。在这个钩子函数中，你可以执行一些初始化操作，例如获取数据、设置默认值等。
2. **mounted()**：在 Vue 实例挂载到 DOM 之后被调用。在这个钩子函数中，你可以执行一些需要访问 DOM 元素的操作，例如初始化插件、绑定事件等。
3. **updated()**：在 Vue 实例的响应式数据更新后被调用，但是 DOM 尚未重新渲染。在这个钩子函数中，你可以执行一些需要依赖更新后的数据进行的操作。
4. **destroyed()**：在 Vue 实例销毁之前被调用。在这个钩子函数中，你可以执行一些清理工作，例如取消订阅、清除定时器等。

### Vue 模板 (Template)

#### 概念：

Vue 模板是 Vue 实例的一部分，用于定义应用的布局和结构。在模板中，我们可以使用 Vue 提供的模板语法，将数据绑定到 DOM 元素上，以及使用指令、事件处理等。

#### 使用案例：

```javascript
<div id="app">
  <p>{{ message }}</p>
  <button @click="changeMessage">Change Message</button>
</div>

<script>
var app = new Vue({
  el: '#app',
  data: {
    message: 'Hello, Vue!'
  },
  methods: {
    changeMessage: function() {
      this.message = 'New message!';
    }
  }
})
</script>

```

### computed 计算属性

#### 概念：

computed 是 Vue 实例中的一个选项，用于定义基于响应式数据计算的属性。与 methods 不同，computed 的计算结果会被缓存，只有在它依赖的响应式数据发生改变时才会重新计算。

#### 使用案例：

```javascript
<div id="app">
  <p>Radius: {{ radius }}</p>
  <p>Area: {{ area }}</p>
</div>

<script>
var app = new Vue({
  el: '#app',
  data: {
    radius: 5
  },
  computed: {
    area: function() {
      return Math.PI * Math.pow(this.radius, 2);
    }
  }
})
</script>

```

### watch 监听器

#### 概念：

watch 是 Vue 实例中的一个选项，用于监听响应式数据的变化，并在数据发生变化时执行自定义的逻辑。

#### 使用案例：

```javascript
<div id="app">
  <p>Counter: {{ counter }}</p>
  <button @click="incrementCounter">Increment</button>
</div>

<script>
var app = new Vue({
  el: '#app',
  data: {
    counter: 0
  },
  watch: {
    counter: function(newValue, oldValue) {
      console.log('Counter changed from ' + oldValue + ' to ' + newValue);
    }
  },
  methods: {
    incrementCounter: function() {
      this.counter++;
    }
  }
})
</script>

```

### vue生命周期

1. **beforeCreate**：在 Vue 实例初始化之后，数据观测 (data observer) 和 event/watcher 事件配置之前被调用。此时实例还未初始化完成，因此在这个阶段你不能访问到 data 和 methods 等选项。
2. **created**：在 Vue 实例创建完成后被调用。在这个阶段，Vue 实例已经完成了数据观测、属性和方法的运算，但是尚未挂载到 DOM 上。你可以在这个阶段执行一些初始化操作，如获取数据、设置默认值等。
3. **beforeMount**：在 Vue 实例挂载到 DOM 元素之前被调用。在这个阶段，Vue 实例已经完成了模板编译，但是尚未将模板渲染到 DOM 中。
4. **mounted**：在 Vue 实例挂载到 DOM 元素之后被调用。在这个阶段，Vue 实例已经将模板渲染到了 DOM 中，并且可以访问到挂载后的 DOM 元素。你可以在这个阶段执行一些 DOM 相关的操作，如初始化插件、绑定事件等。
5. **beforeUpdate**：在 Vue 实例更新之前被调用，即数据更新但是尚未重新渲染 DOM。你可以在这个阶段执行一些在数据更新之前需要执行的逻辑。
6. **updated**：在 Vue 实例更新完成后被调用，即数据更新且 DOM 已重新渲染。在这个阶段，你可以执行一些需要依赖更新后的数据进行的操作。
7. **beforeDestroy**：在 Vue 实例销毁之前被调用。在这个阶段，Vue 实例仍然完全可用，你可以执行一些清理工作，如取消订阅、清除定时器等。
8. **destroyed**：在 Vue 实例销毁之后被调用。在这个阶段，Vue 实例及其相关的所有 DOM 元素都已经被销毁，所有的事件监听器也都被移除。

### 组件 (Components)

#### 概念：

在 Vue 中，组件是可复用的 Vue 实例，每个组件都可以拥有自己的模板、数据、方法等。通过使用组件，我们可以将复杂的 UI 划分成独立的、可复用的模块，从而使得代码更易维护、更具可读性。

#### 语法：

```javascript
<template>
  <!-- 组件模板 -->
</template>

<script>
export default {
  // 组件选项
}
</script>

<style>
/* 组件样式 */
</style>

```

#### 使用案例：

```javascript
<template>
  <div>
    <h1>{{ greeting }}</h1>
    <button @click="changeGreeting">Change Greeting</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      greeting: 'Hello, Vue!'
    };
  },
  methods: {
    changeGreeting() {
      this.greeting = 'Bonjour, Vue!';
    }
  }
}
</script>

<style scoped>
/* 组件样式 */
</style>

```

### 路由 (Router)

#### 概念：

在单页面应用 (SPA) 中，路由用于管理不同页面之间的导航和状态。Vue Router 是 Vue.js 官方的路由管理器，可以与 Vue.js 无缝集成，用于实现单页面应用的路由功能。

#### 语法：

```javascript
# 安装 Vue Router
npm install vue-router

# 创建路由实例并配置路由
import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const router = new VueRouter({
  routes: [
    {
      path: '/',
      component: Home
    },
    {
      path: '/about',
      component: About
    }
  ]
})

```

#### 使用案例：

```javascript
<template>
  <div>
    <router-link to="/">Home</router-link>
    <router-link to="/about">About</router-link>
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  // 使用路由
  router
}
</script>

```

#### 练习

```javascript
# 安装 Vue Router
npm install vue-router

// main.js
import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from './components/Home.vue'
import About from './components/About.vue'

Vue.use(VueRouter)

const router = new VueRouter({
  routes: [
    {
      path: '/',
      component: Home
    },
    {
      path: '/about',
      component: About
    }
  ]
})

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')

```

# Vue基础面试题

### 1. Vue.js 是什么？它的特点是什么？

**答案：** Vue.js 是一款流行的 JavaScript 框架，用于构建用户界面。它的特点包括：

- **轻量级**：Vue.js 文件大小小，学习曲线低，易于上手。
- **数据驱动**：Vue 使用响应式数据绑定，当数据发生变化时，相关的 DOM 将自动更新。
- **组件化**：Vue.js 支持组件化开发，将 UI 划分为独立的、可复用的组件。
- **灵活性**：Vue 允许你以自己的方式组织代码、管理状态，并与其他库和项目无缝集成。

### 2. 什么是 Vue 实例？如何创建一个 Vue 实例？

**答案：** Vue 实例是 Vue.js 构造函数的一个实例化对象，用于管理应用的数据、生命周期、方法等。创建一个 Vue 实例的语法如下：

```
javascriptCopy codevar vm = new Vue({
  // 选项
})
```

### 3. Vue 生命周期包括哪些阶段？每个阶段的作用是什么？

**答案：** Vue 生命周期包括 `beforeCreate`、`created`、`beforeMount`、`mounted`、`beforeUpdate`、`updated`、`beforeDestroy` 和 `destroyed` 八个阶段。每个阶段的作用如下：

- **beforeCreate**：实例初始化之后，数据观测 (data observer) 和 event/watcher 事件配置之前被调用。
- **created**：实例创建完成后被调用，此时已完成数据观测和属性计算，但尚未挂载到 DOM 上。
- **beforeMount**：在挂载开始之前被调用，相关的 render 函数首次被调用。
- **mounted**：在挂载完成后被调用，实例已经挂载到 DOM 上。
- **beforeUpdate**：在数据更新时调用，发生在虚拟 DOM 重新渲染和打补丁之前。
- **updated**：在数据更新后调用，发生在虚拟 DOM 重新渲染和打补丁之后。
- **beforeDestroy**：在实例销毁之前调用，此时实例仍然完全可用。
- **destroyed**：在实例销毁之后调用，所有的事件监听器已被移除，所有的子实例也被销毁。

### 4. Vue 组件的定义方式有哪些？

**答案：** Vue 组件可以通过以下几种方式进行定义：

- **全局组件**：使用 `Vue.component()` 方法定义全局组件。
- **局部组件**：在 Vue 实例中的 `components` 选项中定义局部组件。
- **单文件组件**：使用单文件组件 `.vue` 文件来定义组件，包含模板、脚本和样式。

### 5. 如何在 Vue 组件之间进行通信？

**答案：** Vue 组件之间的通信可以通过以下几种方式实现：

- **Props/Events**：父组件通过 props 向子组件传递数据，子组件通过事件触发向父组件传递数据。
- **$emit / $on**：使用 Vue 实例的 `$emit` 方法触发事件，并使用 `$on` 监听事件进行通信。
- **Vuex**：使用 Vuex 进行状态管理，通过共享的状态树实现组件之间的通信。

### 6. Vue 中的路由是如何实现的？有哪些常用的 Vue 路由库？

**答案：** Vue 中的路由通过 Vue Router 实现。Vue Router 是 Vue.js 官方的路由管理器，可以与 Vue.js 无缝集成，用于实现单页面应用的路由功能。常用的 Vue 路由库包括 Vue Router、Vue Navigation、Vue Page Router 等。

### 7. Vue 中的指令有哪些？它们的作用是什么？

**答案：** Vue 中的指令是带有 `v-` 前缀的特殊属性，用于为 DOM 元素添加一些特殊行为或响应式效果。常用的 Vue 指令包括：

- **v-bind**：用于动态绑定 HTML 属性。
- **v-model**：用于实现双向数据绑定，将表单元素的值与 Vue 实例的数据进行绑定。
- **v-if / v-else-if / v-else**：用于根据表达式的值条件性地渲染元素。
- **v-for**：用于循环渲染数组或对象的元素。
- **v-on**：用于绑定事件监听器，监听 DOM 事件并触发 Vue 实例的方法。
- **v-show**：根据表达式的值条件性地显示或隐藏元素。
- **v-cloak**：用于在 Vue 实例加载完成之前隐藏未编译的 Mustache 标签，防止页面闪动。
- **v-pre**：跳过指定元素和其子元素的编译过程，用于显示原始 Mustache 标签。

### 8. 什么是 Vue 的计算属性？它与 methods 的区别是什么？

**答案：** Vue 的计算属性是在模板中放置简单逻辑的好地方。计算属性的结果会被缓存，除非依赖的响应式数据发生变化，否则不会重新计算。与计算属性不同，方法 (methods) 每次都会重新计算，不会缓存结果。

### 9. Vue 中的响应式原理是什么？它是如何实现数据双向绑定的？

**答案：** Vue 中的响应式原理基于 Object.defineProperty() 方法实现。Vue 会在实例化阶段遍历 data 对象中的所有属性，并使用 Object.defineProperty() 将它们转换为 getter 和 setter，从而实现对数据的监听和响应。当数据发生变化时，setter 会通知相关的视图更新，实现了数据到视图的单向绑定；而 v-model 指令则通过在表单元素上使用 input 事件以及对数据的赋值，实现了视图到数据的单向绑定，从而实现了数据的双向绑定。

### 10. Vue 的生命周期钩子有哪些？它们的作用是什么？

**答案：** Vue 的生命周期钩子包括 beforeCreate、created、beforeMount、mounted、beforeUpdate、updated、beforeDestroy 和 destroyed 八个钩子。这些钩子允许你在 Vue 实例的不同阶段执行自定义的逻辑，如初始化数据、加载数据、监听事件、销毁实例等。

### 11. Vue 中的 key 属性有什么作用？为什么在使用 v-for 时需要 key？

**答案：** 在 Vue 中，key 是用于识别 VNode 的特殊属性。当 Vue 重新渲染一组元素时，它会尽量将页面元素复用，而不是销毁和重新创建。但是，如果元素的顺序发生变化，Vue 无法直接复用元素，而是会销毁之前的元素并重新创建。此时，如果没有设置 key 属性，Vue 会使用元素的索引作为 key，导致出现错误的复用，可能会导致页面状态错乱或者性能下降。因此，在使用 v-for 渲染列表时，为了确保正确的元素复用，需要为每个元素提供一个唯一的 key 值。

### 12. Vue 中的路由导航守卫有哪些？它们的作用是什么？

**答案：** Vue Router 中的路由导航守卫包括全局前置守卫、路由独享守卫、组件内的守卫和全局后置钩子。它们的作用如下：

- **全局前置守卫**：router.beforeEach(to, from, next)，在路由跳转之前执行，可以用来进行路由拦截、权限验证等操作。
- **路由独享守卫**：在路由配置中单独定义的 beforeEnter(to, from, next)，针对某个路由生效，也可以用来进行路由拦截、权限验证等操作。
- **组件内的守卫**：beforeRouteEnter、beforeRouteUpdate 和 beforeRouteLeave，分别在进入、更新和离开路由对应组件时执行，可以用来访问组件实例、进行异步操作等。
- **全局后置钩子**：router.afterEach(to, from)，在路由跳转之后执行，用于页面切换后的一些全局操作，如页面埋点等。

### 13. Vuex 是什么？它的作用是什么？在哪些场景下会使用 Vuex？

**答案：** Vuex 是 Vue.js 官方的状态管理库，用于集中式管理 Vue 应用中的所有组件的状态。它的作用包括：

- **集中管理状态**：将应用的状态存储在一个单一的、全局的状态树中，方便管理和维护。
- **实现状态的响应式更新**：通过 Vuex 提供的 API，可以实现对状态的监听和响应，保证状态的一致性。
- **方便的状态共享**：任何组件都可以访问 Vuex 中的状态，从而实现跨组件的状态共享。

Vuex 主要用于解决以下场景下的问题：

- 多个组件共享状态
- 多个组件需要对同一状态进行修改
- 一个组件需要将状态传递给另一个组件

### 14. Vue 中的 mixin 是什么？它的作用是什么？

**答案：** Vue 中的 mixin 是一种分发 Vue 组件中可复用功能的一种方式。mixin 提供了一种非常灵活的方式来分发 Vue 组件中的一些公共的选项，如数据、计算属性、方法等。使用 mixin 可以将相同的代码逻辑提取到 mixin 中，然后在多个组件中重复使用。

### 15. Vue 中的 keep-alive 是什么？它的作用是什么？

**答案：** Vue 中的 keep-alive 是一个抽象组件，用于缓存不活动的组件实例，从而避免因组件的销毁和重新创建而带来的性能开销。keep-alive 会保留组件的状态，包括它的 DOM 状态和所有的实例变量，当组件再次被激活时，会直接从缓存中取出组件实例并重新渲染，而不需要重新创建。