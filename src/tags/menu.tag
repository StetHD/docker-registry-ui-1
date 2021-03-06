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
<menu>
  <div id="card-menu" class="mdl-card__menu">
    <button id="registry-menu" name="registry-menu" class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
      <i class="material-icons">more_vert</i>
    </button>
    <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="registry-menu">
      <li class="mdl-menu__item" onclick="registryUI.addTag.show();">Add URL</li>
      <li class="mdl-menu__item" onclick="registryUI.changeTag.show();">Change URL</li>
      <li class="mdl-menu__item" onclick="registryUI.removeTag.show();">Remove URL</li>
    </ul>
  </div>

  <script type="text/javascript">
    registryUI.menuTag = registryUI.menuTag || {};
    registryUI.menuTag.update = this.update;
    this.on('updated', function () {
      componentHandler.upgradeElements(this['card-menu']);
    });
    registryUI.menuTag.update();
  </script>
</menu>
