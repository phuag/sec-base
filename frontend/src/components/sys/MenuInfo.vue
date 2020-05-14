<template>
    <span>
       <!-- <span v-for="(perm, _i) in permList" :key="_i">{{prem}} </span> -->
       {{permList}}
    </span>
</template>

<script>
export default {
  name: 'MenuInfo',
  props: {
    permList: {
      type: Array
    }
  }
}
</script>
