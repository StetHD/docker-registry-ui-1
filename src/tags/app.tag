<!--
 Copyright (C) 2016  Jones Magloire @Joxit

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU Affero General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU Affero General Public License for more details.

 You should have received a copy of the GNU Affero General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
-->
<app>
  <catalog if="{!rg.router.current || rg.router.current.name == 'home'}"></catalog>
  <taglist if="{rg.router.current.name == 'taglist'}"></taglist>
  <script>

    this.mixin('rg.router');
    this.router.add({name: 'home', url: ''});
    this.router.add({name: 'taglist', url: '/taglist/:repository/:image'});
    this.router.on('go', state => {
      switch (state.name) {
        case 'taglist':
          if (registryUI.taglist.display) {
            registryUI.taglist.loadend = false;
            registryUI.taglist.display();
          }
          break;
        case 'home':
          if (registryUI.catalog.display) {
            registryUI.catalog.loadend = false;
            registryUI.catalog.display();
          }
          break;
      }
    })
    this.router.start();
  </script>
</app>
