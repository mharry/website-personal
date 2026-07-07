import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://mikeharry.info',
  output: 'static',
  build: {
    format: 'file'
  }
});
