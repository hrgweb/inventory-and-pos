<template>
  <div class="bg-slate-300 text-slate-800 min-h-screen">
    <div class="flex justify-center m-auto sm:w-full md:w-full h-screen">
      <div
        class="sidebar w-[250px] max-w-[250px] shrink-0 bg-slate-50 shadow-2xl"
      >
        <AppNavigation />
      </div>

      <div class="content flex-1 bg-zinc-200 py-8 px-12">
        <!-- Header -->
        <div class="flex justify-between items-center text-white">
          <UInput
            v-model="search"
            class="md:w-[60%]"
            size="xl"
            icon="lucide:search"
            placeholder="Search"
            :ui="{ rounded: 'rounded-full', shadow: 'shadow-2xl' }"
          />

          <div>
            <!-- Go to pos -->
            <UButton
              icon="lucide:monitor"
              color="blue"
              variant="soft"
              class="rounded-full px-3 py-[.6rem]"
              to="/pos"
            />
          </div>

          <!-- Dropdown -->
          <AppUserMenu :is-show="is_show_menu" @click="onShow" />
        </div>

        <div
          class="pt-8 w-[calc(100vw-350px)] h-[calc(100vh-75px)] overflow-auto"
        >
          <slot />
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
const search = ref('')

const is_show_menu = ref(false)

function onShow() {
  is_show_menu.value = !is_show_menu.value
}
</script>
