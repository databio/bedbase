<!DOCTYPE html>
<html>
<head><meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>bedspace-analysis</title><script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.1.10/require.min.js"></script>




<style type="text/css">
    pre { line-height: 125%; }
td.linenos .normal { color: inherit; background-color: transparent; padding-left: 5px; padding-right: 5px; }
span.linenos { color: inherit; background-color: transparent; padding-left: 5px; padding-right: 5px; }
td.linenos .special { color: #000000; background-color: #ffffc0; padding-left: 5px; padding-right: 5px; }
span.linenos.special { color: #000000; background-color: #ffffc0; padding-left: 5px; padding-right: 5px; }
.highlight .hll { background-color: var(--jp-cell-editor-active-background) }
.highlight { background: var(--jp-cell-editor-background); color: var(--jp-mirror-editor-variable-color) }
.highlight .c { color: var(--jp-mirror-editor-comment-color); font-style: italic } /* Comment */
.highlight .err { color: var(--jp-mirror-editor-error-color) } /* Error */
.highlight .k { color: var(--jp-mirror-editor-keyword-color); font-weight: bold } /* Keyword */
.highlight .o { color: var(--jp-mirror-editor-operator-color); font-weight: bold } /* Operator */
.highlight .p { color: var(--jp-mirror-editor-punctuation-color) } /* Punctuation */
.highlight .ch { color: var(--jp-mirror-editor-comment-color); font-style: italic } /* Comment.Hashbang */
.highlight .cm { color: var(--jp-mirror-editor-comment-color); font-style: italic } /* Comment.Multiline */
.highlight .cp { color: var(--jp-mirror-editor-comment-color); font-style: italic } /* Comment.Preproc */
.highlight .cpf { color: var(--jp-mirror-editor-comment-color); font-style: italic } /* Comment.PreprocFile */
.highlight .c1 { color: var(--jp-mirror-editor-comment-color); font-style: italic } /* Comment.Single */
.highlight .cs { color: var(--jp-mirror-editor-comment-color); font-style: italic } /* Comment.Special */
.highlight .kc { color: var(--jp-mirror-editor-keyword-color); font-weight: bold } /* Keyword.Constant */
.highlight .kd { color: var(--jp-mirror-editor-keyword-color); font-weight: bold } /* Keyword.Declaration */
.highlight .kn { color: var(--jp-mirror-editor-keyword-color); font-weight: bold } /* Keyword.Namespace */
.highlight .kp { color: var(--jp-mirror-editor-keyword-color); font-weight: bold } /* Keyword.Pseudo */
.highlight .kr { color: var(--jp-mirror-editor-keyword-color); font-weight: bold } /* Keyword.Reserved */
.highlight .kt { color: var(--jp-mirror-editor-keyword-color); font-weight: bold } /* Keyword.Type */
.highlight .m { color: var(--jp-mirror-editor-number-color) } /* Literal.Number */
.highlight .s { color: var(--jp-mirror-editor-string-color) } /* Literal.String */
.highlight .ow { color: var(--jp-mirror-editor-operator-color); font-weight: bold } /* Operator.Word */
.highlight .pm { color: var(--jp-mirror-editor-punctuation-color) } /* Punctuation.Marker */
.highlight .w { color: var(--jp-mirror-editor-variable-color) } /* Text.Whitespace */
.highlight .mb { color: var(--jp-mirror-editor-number-color) } /* Literal.Number.Bin */
.highlight .mf { color: var(--jp-mirror-editor-number-color) } /* Literal.Number.Float */
.highlight .mh { color: var(--jp-mirror-editor-number-color) } /* Literal.Number.Hex */
.highlight .mi { color: var(--jp-mirror-editor-number-color) } /* Literal.Number.Integer */
.highlight .mo { color: var(--jp-mirror-editor-number-color) } /* Literal.Number.Oct */
.highlight .sa { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Affix */
.highlight .sb { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Backtick */
.highlight .sc { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Char */
.highlight .dl { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Delimiter */
.highlight .sd { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Doc */
.highlight .s2 { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Double */
.highlight .se { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Escape */
.highlight .sh { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Heredoc */
.highlight .si { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Interpol */
.highlight .sx { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Other */
.highlight .sr { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Regex */
.highlight .s1 { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Single */
.highlight .ss { color: var(--jp-mirror-editor-string-color) } /* Literal.String.Symbol */
.highlight .il { color: var(--jp-mirror-editor-number-color) } /* Literal.Number.Integer.Long */
  </style>



<style type="text/css">
/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*
 * Mozilla scrollbar styling
 */

/* use standard opaque scrollbars for most nodes */
[data-jp-theme-scrollbars='true'] {
  scrollbar-color: rgb(var(--jp-scrollbar-thumb-color))
    var(--jp-scrollbar-background-color);
}

/* for code nodes, use a transparent style of scrollbar. These selectors
 * will match lower in the tree, and so will override the above */
[data-jp-theme-scrollbars='true'] .CodeMirror-hscrollbar,
[data-jp-theme-scrollbars='true'] .CodeMirror-vscrollbar {
  scrollbar-color: rgba(var(--jp-scrollbar-thumb-color), 0.5) transparent;
}

/* tiny scrollbar */

.jp-scrollbar-tiny {
  scrollbar-color: rgba(var(--jp-scrollbar-thumb-color), 0.5) transparent;
  scrollbar-width: thin;
}

/*
 * Webkit scrollbar styling
 */

/* use standard opaque scrollbars for most nodes */

[data-jp-theme-scrollbars='true'] ::-webkit-scrollbar,
[data-jp-theme-scrollbars='true'] ::-webkit-scrollbar-corner {
  background: var(--jp-scrollbar-background-color);
}

[data-jp-theme-scrollbars='true'] ::-webkit-scrollbar-thumb {
  background: rgb(var(--jp-scrollbar-thumb-color));
  border: var(--jp-scrollbar-thumb-margin) solid transparent;
  background-clip: content-box;
  border-radius: var(--jp-scrollbar-thumb-radius);
}

[data-jp-theme-scrollbars='true'] ::-webkit-scrollbar-track:horizontal {
  border-left: var(--jp-scrollbar-endpad) solid
    var(--jp-scrollbar-background-color);
  border-right: var(--jp-scrollbar-endpad) solid
    var(--jp-scrollbar-background-color);
}

[data-jp-theme-scrollbars='true'] ::-webkit-scrollbar-track:vertical {
  border-top: var(--jp-scrollbar-endpad) solid
    var(--jp-scrollbar-background-color);
  border-bottom: var(--jp-scrollbar-endpad) solid
    var(--jp-scrollbar-background-color);
}

/* for code nodes, use a transparent style of scrollbar */

[data-jp-theme-scrollbars='true'] .CodeMirror-hscrollbar::-webkit-scrollbar,
[data-jp-theme-scrollbars='true'] .CodeMirror-vscrollbar::-webkit-scrollbar,
[data-jp-theme-scrollbars='true']
  .CodeMirror-hscrollbar::-webkit-scrollbar-corner,
[data-jp-theme-scrollbars='true']
  .CodeMirror-vscrollbar::-webkit-scrollbar-corner {
  background-color: transparent;
}

[data-jp-theme-scrollbars='true']
  .CodeMirror-hscrollbar::-webkit-scrollbar-thumb,
[data-jp-theme-scrollbars='true']
  .CodeMirror-vscrollbar::-webkit-scrollbar-thumb {
  background: rgba(var(--jp-scrollbar-thumb-color), 0.5);
  border: var(--jp-scrollbar-thumb-margin) solid transparent;
  background-clip: content-box;
  border-radius: var(--jp-scrollbar-thumb-radius);
}

[data-jp-theme-scrollbars='true']
  .CodeMirror-hscrollbar::-webkit-scrollbar-track:horizontal {
  border-left: var(--jp-scrollbar-endpad) solid transparent;
  border-right: var(--jp-scrollbar-endpad) solid transparent;
}

[data-jp-theme-scrollbars='true']
  .CodeMirror-vscrollbar::-webkit-scrollbar-track:vertical {
  border-top: var(--jp-scrollbar-endpad) solid transparent;
  border-bottom: var(--jp-scrollbar-endpad) solid transparent;
}

/* tiny scrollbar */

.jp-scrollbar-tiny::-webkit-scrollbar,
.jp-scrollbar-tiny::-webkit-scrollbar-corner {
  background-color: transparent;
  height: 4px;
  width: 4px;
}

.jp-scrollbar-tiny::-webkit-scrollbar-thumb {
  background: rgba(var(--jp-scrollbar-thumb-color), 0.5);
}

.jp-scrollbar-tiny::-webkit-scrollbar-track:horizontal {
  border-left: 0px solid transparent;
  border-right: 0px solid transparent;
}

.jp-scrollbar-tiny::-webkit-scrollbar-track:vertical {
  border-top: 0px solid transparent;
  border-bottom: 0px solid transparent;
}

/*
 * Phosphor
 */

.lm-ScrollBar[data-orientation='horizontal'] {
  min-height: 16px;
  max-height: 16px;
  min-width: 45px;
  border-top: 1px solid #a0a0a0;
}

.lm-ScrollBar[data-orientation='vertical'] {
  min-width: 16px;
  max-width: 16px;
  min-height: 45px;
  border-left: 1px solid #a0a0a0;
}

.lm-ScrollBar-button {
  background-color: #f0f0f0;
  background-position: center center;
  min-height: 15px;
  max-height: 15px;
  min-width: 15px;
  max-width: 15px;
}

.lm-ScrollBar-button:hover {
  background-color: #dadada;
}

.lm-ScrollBar-button.lm-mod-active {
  background-color: #cdcdcd;
}

.lm-ScrollBar-track {
  background: #f0f0f0;
}

.lm-ScrollBar-thumb {
  background: #cdcdcd;
}

.lm-ScrollBar-thumb:hover {
  background: #bababa;
}

.lm-ScrollBar-thumb.lm-mod-active {
  background: #a0a0a0;
}

.lm-ScrollBar[data-orientation='horizontal'] .lm-ScrollBar-thumb {
  height: 100%;
  min-width: 15px;
  border-left: 1px solid #a0a0a0;
  border-right: 1px solid #a0a0a0;
}

.lm-ScrollBar[data-orientation='vertical'] .lm-ScrollBar-thumb {
  width: 100%;
  min-height: 15px;
  border-top: 1px solid #a0a0a0;
  border-bottom: 1px solid #a0a0a0;
}

.lm-ScrollBar[data-orientation='horizontal']
  .lm-ScrollBar-button[data-action='decrement'] {
  background-image: var(--jp-icon-caret-left);
  background-size: 17px;
}

.lm-ScrollBar[data-orientation='horizontal']
  .lm-ScrollBar-button[data-action='increment'] {
  background-image: var(--jp-icon-caret-right);
  background-size: 17px;
}

.lm-ScrollBar[data-orientation='vertical']
  .lm-ScrollBar-button[data-action='decrement'] {
  background-image: var(--jp-icon-caret-up);
  background-size: 17px;
}

.lm-ScrollBar[data-orientation='vertical']
  .lm-ScrollBar-button[data-action='increment'] {
  background-image: var(--jp-icon-caret-down);
  background-size: 17px;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/

/* <DEPRECATED> */
.p-Widget, /* </DEPRECATED> */
.lm-Widget {
  box-sizing: border-box;
  position: relative;
  overflow: hidden;
  cursor: default;
}

/* <DEPRECATED> */
.p-Widget.p-mod-hidden, /* </DEPRECATED> */
.lm-Widget.lm-mod-hidden {
  display: none !important;
}

.lm-AccordionPanel[data-orientation='horizontal'] > .lm-AccordionPanel-title {
  /* Title is rotated for horizontal accordion panel using CSS */
  display: block;
  transform-origin: top left;
  transform: rotate(-90deg) translate(-100%);
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/

/* <DEPRECATED> */
.p-CommandPalette, /* </DEPRECATED> */
.lm-CommandPalette {
  display: flex;
  flex-direction: column;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* <DEPRECATED> */
.p-CommandPalette-search, /* </DEPRECATED> */
.lm-CommandPalette-search {
  flex: 0 0 auto;
}

/* <DEPRECATED> */
.p-CommandPalette-content, /* </DEPRECATED> */
.lm-CommandPalette-content {
  flex: 1 1 auto;
  margin: 0;
  padding: 0;
  min-height: 0;
  overflow: auto;
  list-style-type: none;
}

/* <DEPRECATED> */
.p-CommandPalette-header, /* </DEPRECATED> */
.lm-CommandPalette-header {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

/* <DEPRECATED> */
.p-CommandPalette-item, /* </DEPRECATED> */
.lm-CommandPalette-item {
  display: flex;
  flex-direction: row;
}

/* <DEPRECATED> */
.p-CommandPalette-itemIcon, /* </DEPRECATED> */
.lm-CommandPalette-itemIcon {
  flex: 0 0 auto;
}

/* <DEPRECATED> */
.p-CommandPalette-itemContent, /* </DEPRECATED> */
.lm-CommandPalette-itemContent {
  flex: 1 1 auto;
  overflow: hidden;
}

/* <DEPRECATED> */
.p-CommandPalette-itemShortcut, /* </DEPRECATED> */
.lm-CommandPalette-itemShortcut {
  flex: 0 0 auto;
}

/* <DEPRECATED> */
.p-CommandPalette-itemLabel, /* </DEPRECATED> */
.lm-CommandPalette-itemLabel {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.lm-close-icon {
  border: 1px solid transparent;
  background-color: transparent;
  position: absolute;
  z-index: 1;
  right: 3%;
  top: 0;
  bottom: 0;
  margin: auto;
  padding: 7px 0;
  display: none;
  vertical-align: middle;
  outline: 0;
  cursor: pointer;
}
.lm-close-icon:after {
  content: 'X';
  display: block;
  width: 15px;
  height: 15px;
  text-align: center;
  color: #000;
  font-weight: normal;
  font-size: 12px;
  cursor: pointer;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/

/* <DEPRECATED> */
.p-DockPanel, /* </DEPRECATED> */
.lm-DockPanel {
  z-index: 0;
}

/* <DEPRECATED> */
.p-DockPanel-widget, /* </DEPRECATED> */
.lm-DockPanel-widget {
  z-index: 0;
}

/* <DEPRECATED> */
.p-DockPanel-tabBar, /* </DEPRECATED> */
.lm-DockPanel-tabBar {
  z-index: 1;
}

/* <DEPRECATED> */
.p-DockPanel-handle, /* </DEPRECATED> */
.lm-DockPanel-handle {
  z-index: 2;
}

/* <DEPRECATED> */
.p-DockPanel-handle.p-mod-hidden, /* </DEPRECATED> */
.lm-DockPanel-handle.lm-mod-hidden {
  display: none !important;
}

/* <DEPRECATED> */
.p-DockPanel-handle:after, /* </DEPRECATED> */
.lm-DockPanel-handle:after {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  content: '';
}

/* <DEPRECATED> */
.p-DockPanel-handle[data-orientation='horizontal'],
/* </DEPRECATED> */
.lm-DockPanel-handle[data-orientation='horizontal'] {
  cursor: ew-resize;
}

/* <DEPRECATED> */
.p-DockPanel-handle[data-orientation='vertical'],
/* </DEPRECATED> */
.lm-DockPanel-handle[data-orientation='vertical'] {
  cursor: ns-resize;
}

/* <DEPRECATED> */
.p-DockPanel-handle[data-orientation='horizontal']:after,
/* </DEPRECATED> */
.lm-DockPanel-handle[data-orientation='horizontal']:after {
  left: 50%;
  min-width: 8px;
  transform: translateX(-50%);
}

/* <DEPRECATED> */
.p-DockPanel-handle[data-orientation='vertical']:after,
/* </DEPRECATED> */
.lm-DockPanel-handle[data-orientation='vertical']:after {
  top: 50%;
  min-height: 8px;
  transform: translateY(-50%);
}

/* <DEPRECATED> */
.p-DockPanel-overlay, /* </DEPRECATED> */
.lm-DockPanel-overlay {
  z-index: 3;
  box-sizing: border-box;
  pointer-events: none;
}

/* <DEPRECATED> */
.p-DockPanel-overlay.p-mod-hidden, /* </DEPRECATED> */
.lm-DockPanel-overlay.lm-mod-hidden {
  display: none !important;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/

/* <DEPRECATED> */
.p-Menu, /* </DEPRECATED> */
.lm-Menu {
  z-index: 10000;
  position: absolute;
  white-space: nowrap;
  overflow-x: hidden;
  overflow-y: auto;
  outline: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* <DEPRECATED> */
.p-Menu-content, /* </DEPRECATED> */
.lm-Menu-content {
  margin: 0;
  padding: 0;
  display: table;
  list-style-type: none;
}

/* <DEPRECATED> */
.p-Menu-item, /* </DEPRECATED> */
.lm-Menu-item {
  display: table-row;
}

/* <DEPRECATED> */
.p-Menu-item.p-mod-hidden,
.p-Menu-item.p-mod-collapsed,
/* </DEPRECATED> */
.lm-Menu-item.lm-mod-hidden,
.lm-Menu-item.lm-mod-collapsed {
  display: none !important;
}

/* <DEPRECATED> */
.p-Menu-itemIcon,
.p-Menu-itemSubmenuIcon,
/* </DEPRECATED> */
.lm-Menu-itemIcon,
.lm-Menu-itemSubmenuIcon {
  display: table-cell;
  text-align: center;
}

/* <DEPRECATED> */
.p-Menu-itemLabel, /* </DEPRECATED> */
.lm-Menu-itemLabel {
  display: table-cell;
  text-align: left;
}

/* <DEPRECATED> */
.p-Menu-itemShortcut, /* </DEPRECATED> */
.lm-Menu-itemShortcut {
  display: table-cell;
  text-align: right;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/

/* <DEPRECATED> */
.p-MenuBar, /* </DEPRECATED> */
.lm-MenuBar {
  outline: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* <DEPRECATED> */
.p-MenuBar-content, /* </DEPRECATED> */
.lm-MenuBar-content {
  margin: 0;
  padding: 0;
  display: flex;
  flex-direction: row;
  list-style-type: none;
}

/* <DEPRECATED> */
.p--MenuBar-item, /* </DEPRECATED> */
.lm-MenuBar-item {
  box-sizing: border-box;
}

/* <DEPRECATED> */
.p-MenuBar-itemIcon,
.p-MenuBar-itemLabel,
/* </DEPRECATED> */
.lm-MenuBar-itemIcon,
.lm-MenuBar-itemLabel {
  display: inline-block;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/

/* <DEPRECATED> */
.p-ScrollBar, /* </DEPRECATED> */
.lm-ScrollBar {
  display: flex;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* <DEPRECATED> */
.p-ScrollBar[data-orientation='horizontal'],
/* </DEPRECATED> */
.lm-ScrollBar[data-orientation='horizontal'] {
  flex-direction: row;
}

/* <DEPRECATED> */
.p-ScrollBar[data-orientation='vertical'],
/* </DEPRECATED> */
.lm-ScrollBar[data-orientation='vertical'] {
  flex-direction: column;
}

/* <DEPRECATED> */
.p-ScrollBar-button, /* </DEPRECATED> */
.lm-ScrollBar-button {
  box-sizing: border-box;
  flex: 0 0 auto;
}

/* <DEPRECATED> */
.p-ScrollBar-track, /* </DEPRECATED> */
.lm-ScrollBar-track {
  box-sizing: border-box;
  position: relative;
  overflow: hidden;
  flex: 1 1 auto;
}

/* <DEPRECATED> */
.p-ScrollBar-thumb, /* </DEPRECATED> */
.lm-ScrollBar-thumb {
  box-sizing: border-box;
  position: absolute;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/

/* <DEPRECATED> */
.p-SplitPanel-child, /* </DEPRECATED> */
.lm-SplitPanel-child {
  z-index: 0;
}

/* <DEPRECATED> */
.p-SplitPanel-handle, /* </DEPRECATED> */
.lm-SplitPanel-handle {
  z-index: 1;
}

/* <DEPRECATED> */
.p-SplitPanel-handle.p-mod-hidden, /* </DEPRECATED> */
.lm-SplitPanel-handle.lm-mod-hidden {
  display: none !important;
}

/* <DEPRECATED> */
.p-SplitPanel-handle:after, /* </DEPRECATED> */
.lm-SplitPanel-handle:after {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  content: '';
}

/* <DEPRECATED> */
.p-SplitPanel[data-orientation='horizontal'] > .p-SplitPanel-handle,
/* </DEPRECATED> */
.lm-SplitPanel[data-orientation='horizontal'] > .lm-SplitPanel-handle {
  cursor: ew-resize;
}

/* <DEPRECATED> */
.p-SplitPanel[data-orientation='vertical'] > .p-SplitPanel-handle,
/* </DEPRECATED> */
.lm-SplitPanel[data-orientation='vertical'] > .lm-SplitPanel-handle {
  cursor: ns-resize;
}

/* <DEPRECATED> */
.p-SplitPanel[data-orientation='horizontal'] > .p-SplitPanel-handle:after,
/* </DEPRECATED> */
.lm-SplitPanel[data-orientation='horizontal'] > .lm-SplitPanel-handle:after {
  left: 50%;
  min-width: 8px;
  transform: translateX(-50%);
}

/* <DEPRECATED> */
.p-SplitPanel[data-orientation='vertical'] > .p-SplitPanel-handle:after,
/* </DEPRECATED> */
.lm-SplitPanel[data-orientation='vertical'] > .lm-SplitPanel-handle:after {
  top: 50%;
  min-height: 8px;
  transform: translateY(-50%);
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/

/* <DEPRECATED> */
.p-TabBar, /* </DEPRECATED> */
.lm-TabBar {
  display: flex;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* <DEPRECATED> */
.p-TabBar[data-orientation='horizontal'], /* </DEPRECATED> */
.lm-TabBar[data-orientation='horizontal'] {
  flex-direction: row;
  align-items: flex-end;
}

/* <DEPRECATED> */
.p-TabBar[data-orientation='vertical'], /* </DEPRECATED> */
.lm-TabBar[data-orientation='vertical'] {
  flex-direction: column;
  align-items: flex-end;
}

/* <DEPRECATED> */
.p-TabBar-content, /* </DEPRECATED> */
.lm-TabBar-content {
  margin: 0;
  padding: 0;
  display: flex;
  flex: 1 1 auto;
  list-style-type: none;
}

/* <DEPRECATED> */
.p-TabBar[data-orientation='horizontal'] > .p-TabBar-content,
/* </DEPRECATED> */
.lm-TabBar[data-orientation='horizontal'] > .lm-TabBar-content {
  flex-direction: row;
}

/* <DEPRECATED> */
.p-TabBar[data-orientation='vertical'] > .p-TabBar-content,
/* </DEPRECATED> */
.lm-TabBar[data-orientation='vertical'] > .lm-TabBar-content {
  flex-direction: column;
}

/* <DEPRECATED> */
.p-TabBar-tab, /* </DEPRECATED> */
.lm-TabBar-tab {
  display: flex;
  flex-direction: row;
  box-sizing: border-box;
  overflow: hidden;
  touch-action: none; /* Disable native Drag/Drop */
}

/* <DEPRECATED> */
.p-TabBar-tabIcon,
.p-TabBar-tabCloseIcon,
/* </DEPRECATED> */
.lm-TabBar-tabIcon,
.lm-TabBar-tabCloseIcon {
  flex: 0 0 auto;
}

/* <DEPRECATED> */
.p-TabBar-tabLabel, /* </DEPRECATED> */
.lm-TabBar-tabLabel {
  flex: 1 1 auto;
  overflow: hidden;
  white-space: nowrap;
}

.lm-TabBar-tabInput {
  user-select: all;
  width: 100%;
  box-sizing: border-box;
}

/* <DEPRECATED> */
.p-TabBar-tab.p-mod-hidden, /* </DEPRECATED> */
.lm-TabBar-tab.lm-mod-hidden {
  display: none !important;
}

.lm-TabBar-addButton.lm-mod-hidden {
  display: none !important;
}

/* <DEPRECATED> */
.p-TabBar.p-mod-dragging .p-TabBar-tab, /* </DEPRECATED> */
.lm-TabBar.lm-mod-dragging .lm-TabBar-tab {
  position: relative;
}

/* <DEPRECATED> */
.p-TabBar.p-mod-dragging[data-orientation='horizontal'] .p-TabBar-tab,
/* </DEPRECATED> */
.lm-TabBar.lm-mod-dragging[data-orientation='horizontal'] .lm-TabBar-tab {
  left: 0;
  transition: left 150ms ease;
}

/* <DEPRECATED> */
.p-TabBar.p-mod-dragging[data-orientation='vertical'] .p-TabBar-tab,
/* </DEPRECATED> */
.lm-TabBar.lm-mod-dragging[data-orientation='vertical'] .lm-TabBar-tab {
  top: 0;
  transition: top 150ms ease;
}

/* <DEPRECATED> */
.p-TabBar.p-mod-dragging .p-TabBar-tab.p-mod-dragging,
/* </DEPRECATED> */
.lm-TabBar.lm-mod-dragging .lm-TabBar-tab.lm-mod-dragging {
  transition: none;
}

.lm-TabBar-tabLabel .lm-TabBar-tabInput {
  user-select: all;
  width: 100%;
  box-sizing: border-box;
  background: inherit;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/

/* <DEPRECATED> */
.p-TabPanel-tabBar, /* </DEPRECATED> */
.lm-TabPanel-tabBar {
  z-index: 1;
}

/* <DEPRECATED> */
.p-TabPanel-stackedPanel, /* </DEPRECATED> */
.lm-TabPanel-stackedPanel {
  z-index: 0;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/

@charset "UTF-8";
html{
  -webkit-box-sizing:border-box;
          box-sizing:border-box; }

*,
*::before,
*::after{
  -webkit-box-sizing:inherit;
          box-sizing:inherit; }

body{
  font-size:14px;
  font-weight:400;
  letter-spacing:0;
  line-height:1.28581;
  text-transform:none;
  color:#182026;
  font-family:-apple-system, "BlinkMacSystemFont", "Segoe UI", "Roboto", "Oxygen", "Ubuntu", "Cantarell", "Open Sans", "Helvetica Neue", "Icons16", sans-serif; }

p{
  margin-bottom:10px;
  margin-top:0; }

small{
  font-size:12px; }

strong{
  font-weight:600; }

::-moz-selection{
  background:rgba(125, 188, 255, 0.6); }

::selection{
  background:rgba(125, 188, 255, 0.6); }
.bp3-heading{
  color:#182026;
  font-weight:600;
  margin:0 0 10px;
  padding:0; }
  .bp3-dark .bp3-heading{
    color:#f5f8fa; }

h1.bp3-heading, .bp3-running-text h1{
  font-size:36px;
  line-height:40px; }

h2.bp3-heading, .bp3-running-text h2{
  font-size:28px;
  line-height:32px; }

h3.bp3-heading, .bp3-running-text h3{
  font-size:22px;
  line-height:25px; }

h4.bp3-heading, .bp3-running-text h4{
  font-size:18px;
  line-height:21px; }

h5.bp3-heading, .bp3-running-text h5{
  font-size:16px;
  line-height:19px; }

h6.bp3-heading, .bp3-running-text h6{
  font-size:14px;
  line-height:16px; }
.bp3-ui-text{
  font-size:14px;
  font-weight:400;
  letter-spacing:0;
  line-height:1.28581;
  text-transform:none; }

.bp3-monospace-text{
  font-family:monospace;
  text-transform:none; }

.bp3-text-muted{
  color:#5c7080; }
  .bp3-dark .bp3-text-muted{
    color:#a7b6c2; }

.bp3-text-disabled{
  color:rgba(92, 112, 128, 0.6); }
  .bp3-dark .bp3-text-disabled{
    color:rgba(167, 182, 194, 0.6); }

.bp3-text-overflow-ellipsis{
  overflow:hidden;
  text-overflow:ellipsis;
  white-space:nowrap;
  word-wrap:normal; }
.bp3-running-text{
  font-size:14px;
  line-height:1.5; }
  .bp3-running-text h1{
    color:#182026;
    font-weight:600;
    margin-bottom:20px;
    margin-top:40px; }
    .bp3-dark .bp3-running-text h1{
      color:#f5f8fa; }
  .bp3-running-text h2{
    color:#182026;
    font-weight:600;
    margin-bottom:20px;
    margin-top:40px; }
    .bp3-dark .bp3-running-text h2{
      color:#f5f8fa; }
  .bp3-running-text h3{
    color:#182026;
    font-weight:600;
    margin-bottom:20px;
    margin-top:40px; }
    .bp3-dark .bp3-running-text h3{
      color:#f5f8fa; }
  .bp3-running-text h4{
    color:#182026;
    font-weight:600;
    margin-bottom:20px;
    margin-top:40px; }
    .bp3-dark .bp3-running-text h4{
      color:#f5f8fa; }
  .bp3-running-text h5{
    color:#182026;
    font-weight:600;
    margin-bottom:20px;
    margin-top:40px; }
    .bp3-dark .bp3-running-text h5{
      color:#f5f8fa; }
  .bp3-running-text h6{
    color:#182026;
    font-weight:600;
    margin-bottom:20px;
    margin-top:40px; }
    .bp3-dark .bp3-running-text h6{
      color:#f5f8fa; }
  .bp3-running-text hr{
    border:none;
    border-bottom:1px solid rgba(16, 22, 26, 0.15);
    margin:20px 0; }
    .bp3-dark .bp3-running-text hr{
      border-color:rgba(255, 255, 255, 0.15); }
  .bp3-running-text p{
    margin:0 0 10px;
    padding:0; }

.bp3-text-large{
  font-size:16px; }

.bp3-text-small{
  font-size:12px; }
a{
  color:#106ba3;
  text-decoration:none; }
  a:hover{
    color:#106ba3;
    cursor:pointer;
    text-decoration:underline; }
  a .bp3-icon, a .bp3-icon-standard, a .bp3-icon-large{
    color:inherit; }
  a code,
  .bp3-dark a code{
    color:inherit; }
  .bp3-dark a,
  .bp3-dark a:hover{
    color:#48aff0; }
    .bp3-dark a .bp3-icon, .bp3-dark a .bp3-icon-standard, .bp3-dark a .bp3-icon-large,
    .bp3-dark a:hover .bp3-icon,
    .bp3-dark a:hover .bp3-icon-standard,
    .bp3-dark a:hover .bp3-icon-large{
      color:inherit; }
.bp3-running-text code, .bp3-code{
  font-family:monospace;
  text-transform:none;
  background:rgba(255, 255, 255, 0.7);
  border-radius:3px;
  -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2);
          box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2);
  color:#5c7080;
  font-size:smaller;
  padding:2px 5px; }
  .bp3-dark .bp3-running-text code, .bp3-running-text .bp3-dark code, .bp3-dark .bp3-code{
    background:rgba(16, 22, 26, 0.3);
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4);
    color:#a7b6c2; }
  .bp3-running-text a > code, a > .bp3-code{
    color:#137cbd; }
    .bp3-dark .bp3-running-text a > code, .bp3-running-text .bp3-dark a > code, .bp3-dark a > .bp3-code{
      color:inherit; }

.bp3-running-text pre, .bp3-code-block{
  font-family:monospace;
  text-transform:none;
  background:rgba(255, 255, 255, 0.7);
  border-radius:3px;
  -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.15);
          box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.15);
  color:#182026;
  display:block;
  font-size:13px;
  line-height:1.4;
  margin:10px 0;
  padding:13px 15px 12px;
  word-break:break-all;
  word-wrap:break-word; }
  .bp3-dark .bp3-running-text pre, .bp3-running-text .bp3-dark pre, .bp3-dark .bp3-code-block{
    background:rgba(16, 22, 26, 0.3);
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4);
    color:#f5f8fa; }
  .bp3-running-text pre > code, .bp3-code-block > code{
    background:none;
    -webkit-box-shadow:none;
            box-shadow:none;
    color:inherit;
    font-size:inherit;
    padding:0; }

.bp3-running-text kbd, .bp3-key{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  background:#ffffff;
  border-radius:3px;
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.2);
  color:#5c7080;
  display:-webkit-inline-box;
  display:-ms-inline-flexbox;
  display:inline-flex;
  font-family:inherit;
  font-size:12px;
  height:24px;
  -webkit-box-pack:center;
      -ms-flex-pack:center;
          justify-content:center;
  line-height:24px;
  min-width:24px;
  padding:3px 6px;
  vertical-align:middle; }
  .bp3-running-text kbd .bp3-icon, .bp3-key .bp3-icon, .bp3-running-text kbd .bp3-icon-standard, .bp3-key .bp3-icon-standard, .bp3-running-text kbd .bp3-icon-large, .bp3-key .bp3-icon-large{
    margin-right:5px; }
  .bp3-dark .bp3-running-text kbd, .bp3-running-text .bp3-dark kbd, .bp3-dark .bp3-key{
    background:#394b59;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4);
    color:#a7b6c2; }
.bp3-running-text blockquote, .bp3-blockquote{
  border-left:solid 4px rgba(167, 182, 194, 0.5);
  margin:0 0 10px;
  padding:0 20px; }
  .bp3-dark .bp3-running-text blockquote, .bp3-running-text .bp3-dark blockquote, .bp3-dark .bp3-blockquote{
    border-color:rgba(115, 134, 148, 0.5); }
.bp3-running-text ul,
.bp3-running-text ol, .bp3-list{
  margin:10px 0;
  padding-left:30px; }
  .bp3-running-text ul li:not(:last-child), .bp3-running-text ol li:not(:last-child), .bp3-list li:not(:last-child){
    margin-bottom:5px; }
  .bp3-running-text ul ol, .bp3-running-text ol ol, .bp3-list ol,
  .bp3-running-text ul ul,
  .bp3-running-text ol ul,
  .bp3-list ul{
    margin-top:5px; }

.bp3-list-unstyled{
  list-style:none;
  margin:0;
  padding:0; }
  .bp3-list-unstyled li{
    padding:0; }
.bp3-rtl{
  text-align:right; }

.bp3-dark{
  color:#f5f8fa; }

:focus{
  outline:rgba(19, 124, 189, 0.6) auto 2px;
  outline-offset:2px;
  -moz-outline-radius:6px; }

.bp3-focus-disabled :focus{
  outline:none !important; }
  .bp3-focus-disabled :focus ~ .bp3-control-indicator{
    outline:none !important; }

.bp3-alert{
  max-width:400px;
  padding:20px; }

.bp3-alert-body{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex; }
  .bp3-alert-body .bp3-icon{
    font-size:40px;
    margin-right:20px;
    margin-top:0; }

.bp3-alert-contents{
  word-break:break-word; }

.bp3-alert-footer{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:horizontal;
  -webkit-box-direction:reverse;
      -ms-flex-direction:row-reverse;
          flex-direction:row-reverse;
  margin-top:10px; }
  .bp3-alert-footer .bp3-button{
    margin-left:10px; }
.bp3-breadcrumbs{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  cursor:default;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -ms-flex-wrap:wrap;
      flex-wrap:wrap;
  height:30px;
  list-style:none;
  margin:0;
  padding:0; }
  .bp3-breadcrumbs > li{
    -webkit-box-align:center;
        -ms-flex-align:center;
            align-items:center;
    display:-webkit-box;
    display:-ms-flexbox;
    display:flex; }
    .bp3-breadcrumbs > li::after{
      background:url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill-rule='evenodd' clip-rule='evenodd' d='M10.71 7.29l-4-4a1.003 1.003 0 00-1.42 1.42L8.59 8 5.3 11.29c-.19.18-.3.43-.3.71a1.003 1.003 0 001.71.71l4-4c.18-.18.29-.43.29-.71 0-.28-.11-.53-.29-.71z' fill='%235C7080'/%3e%3c/svg%3e");
      content:"";
      display:block;
      height:16px;
      margin:0 5px;
      width:16px; }
    .bp3-breadcrumbs > li:last-of-type::after{
      display:none; }

.bp3-breadcrumb,
.bp3-breadcrumb-current,
.bp3-breadcrumbs-collapsed{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  display:-webkit-inline-box;
  display:-ms-inline-flexbox;
  display:inline-flex;
  font-size:16px; }

.bp3-breadcrumb,
.bp3-breadcrumbs-collapsed{
  color:#5c7080; }

.bp3-breadcrumb:hover{
  text-decoration:none; }

.bp3-breadcrumb.bp3-disabled{
  color:rgba(92, 112, 128, 0.6);
  cursor:not-allowed; }

.bp3-breadcrumb .bp3-icon{
  margin-right:5px; }

.bp3-breadcrumb-current{
  color:inherit;
  font-weight:600; }
  .bp3-breadcrumb-current .bp3-input{
    font-size:inherit;
    font-weight:inherit;
    vertical-align:baseline; }

.bp3-breadcrumbs-collapsed{
  background:#ced9e0;
  border:none;
  border-radius:3px;
  cursor:pointer;
  margin-right:2px;
  padding:1px 5px;
  vertical-align:text-bottom; }
  .bp3-breadcrumbs-collapsed::before{
    background:url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cg fill='%235C7080'%3e%3ccircle cx='2' cy='8.03' r='2'/%3e%3ccircle cx='14' cy='8.03' r='2'/%3e%3ccircle cx='8' cy='8.03' r='2'/%3e%3c/g%3e%3c/svg%3e") center no-repeat;
    content:"";
    display:block;
    height:16px;
    width:16px; }
  .bp3-breadcrumbs-collapsed:hover{
    background:#bfccd6;
    color:#182026;
    text-decoration:none; }

.bp3-dark .bp3-breadcrumb,
.bp3-dark .bp3-breadcrumbs-collapsed{
  color:#a7b6c2; }

.bp3-dark .bp3-breadcrumbs > li::after{
  color:#a7b6c2; }

.bp3-dark .bp3-breadcrumb.bp3-disabled{
  color:rgba(167, 182, 194, 0.6); }

.bp3-dark .bp3-breadcrumb-current{
  color:#f5f8fa; }

.bp3-dark .bp3-breadcrumbs-collapsed{
  background:rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-breadcrumbs-collapsed:hover{
    background:rgba(16, 22, 26, 0.6);
    color:#f5f8fa; }
.bp3-button{
  display:-webkit-inline-box;
  display:-ms-inline-flexbox;
  display:inline-flex;
  -webkit-box-orient:horizontal;
  -webkit-box-direction:normal;
      -ms-flex-direction:row;
          flex-direction:row;
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  border:none;
  border-radius:3px;
  cursor:pointer;
  font-size:14px;
  -webkit-box-pack:center;
      -ms-flex-pack:center;
          justify-content:center;
  padding:5px 10px;
  text-align:left;
  vertical-align:middle;
  min-height:30px;
  min-width:30px; }
  .bp3-button > *{
    -webkit-box-flex:0;
        -ms-flex-positive:0;
            flex-grow:0;
    -ms-flex-negative:0;
        flex-shrink:0; }
  .bp3-button > .bp3-fill{
    -webkit-box-flex:1;
        -ms-flex-positive:1;
            flex-grow:1;
    -ms-flex-negative:1;
        flex-shrink:1; }
  .bp3-button::before,
  .bp3-button > *{
    margin-right:7px; }
  .bp3-button:empty::before,
  .bp3-button > :last-child{
    margin-right:0; }
  .bp3-button:empty{
    padding:0 !important; }
  .bp3-button:disabled, .bp3-button.bp3-disabled{
    cursor:not-allowed; }
  .bp3-button.bp3-fill{
    display:-webkit-box;
    display:-ms-flexbox;
    display:flex;
    width:100%; }
  .bp3-button.bp3-align-right,
  .bp3-align-right .bp3-button{
    text-align:right; }
  .bp3-button.bp3-align-left,
  .bp3-align-left .bp3-button{
    text-align:left; }
  .bp3-button:not([class*="bp3-intent-"]){
    background-color:#f5f8fa;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.8)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.8), rgba(255, 255, 255, 0));
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
    color:#182026; }
    .bp3-button:not([class*="bp3-intent-"]):hover{
      background-clip:padding-box;
      background-color:#ebf1f5;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1); }
    .bp3-button:not([class*="bp3-intent-"]):active, .bp3-button:not([class*="bp3-intent-"]).bp3-active{
      background-color:#d8e1e8;
      background-image:none;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-button:not([class*="bp3-intent-"]):disabled, .bp3-button:not([class*="bp3-intent-"]).bp3-disabled{
      background-color:rgba(206, 217, 224, 0.5);
      background-image:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(92, 112, 128, 0.6);
      cursor:not-allowed;
      outline:none; }
      .bp3-button:not([class*="bp3-intent-"]):disabled.bp3-active, .bp3-button:not([class*="bp3-intent-"]):disabled.bp3-active:hover, .bp3-button:not([class*="bp3-intent-"]).bp3-disabled.bp3-active, .bp3-button:not([class*="bp3-intent-"]).bp3-disabled.bp3-active:hover{
        background:rgba(206, 217, 224, 0.7); }
  .bp3-button.bp3-intent-primary{
    background-color:#137cbd;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.1)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0));
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
    color:#ffffff; }
    .bp3-button.bp3-intent-primary:hover, .bp3-button.bp3-intent-primary:active, .bp3-button.bp3-intent-primary.bp3-active{
      color:#ffffff; }
    .bp3-button.bp3-intent-primary:hover{
      background-color:#106ba3;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2); }
    .bp3-button.bp3-intent-primary:active, .bp3-button.bp3-intent-primary.bp3-active{
      background-color:#0e5a8a;
      background-image:none;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-button.bp3-intent-primary:disabled, .bp3-button.bp3-intent-primary.bp3-disabled{
      background-color:rgba(19, 124, 189, 0.5);
      background-image:none;
      border-color:transparent;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(255, 255, 255, 0.6); }
  .bp3-button.bp3-intent-success{
    background-color:#0f9960;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.1)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0));
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
    color:#ffffff; }
    .bp3-button.bp3-intent-success:hover, .bp3-button.bp3-intent-success:active, .bp3-button.bp3-intent-success.bp3-active{
      color:#ffffff; }
    .bp3-button.bp3-intent-success:hover{
      background-color:#0d8050;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2); }
    .bp3-button.bp3-intent-success:active, .bp3-button.bp3-intent-success.bp3-active{
      background-color:#0a6640;
      background-image:none;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-button.bp3-intent-success:disabled, .bp3-button.bp3-intent-success.bp3-disabled{
      background-color:rgba(15, 153, 96, 0.5);
      background-image:none;
      border-color:transparent;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(255, 255, 255, 0.6); }
  .bp3-button.bp3-intent-warning{
    background-color:#d9822b;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.1)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0));
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
    color:#ffffff; }
    .bp3-button.bp3-intent-warning:hover, .bp3-button.bp3-intent-warning:active, .bp3-button.bp3-intent-warning.bp3-active{
      color:#ffffff; }
    .bp3-button.bp3-intent-warning:hover{
      background-color:#bf7326;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2); }
    .bp3-button.bp3-intent-warning:active, .bp3-button.bp3-intent-warning.bp3-active{
      background-color:#a66321;
      background-image:none;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-button.bp3-intent-warning:disabled, .bp3-button.bp3-intent-warning.bp3-disabled{
      background-color:rgba(217, 130, 43, 0.5);
      background-image:none;
      border-color:transparent;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(255, 255, 255, 0.6); }
  .bp3-button.bp3-intent-danger{
    background-color:#db3737;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.1)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0));
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
    color:#ffffff; }
    .bp3-button.bp3-intent-danger:hover, .bp3-button.bp3-intent-danger:active, .bp3-button.bp3-intent-danger.bp3-active{
      color:#ffffff; }
    .bp3-button.bp3-intent-danger:hover{
      background-color:#c23030;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2); }
    .bp3-button.bp3-intent-danger:active, .bp3-button.bp3-intent-danger.bp3-active{
      background-color:#a82a2a;
      background-image:none;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-button.bp3-intent-danger:disabled, .bp3-button.bp3-intent-danger.bp3-disabled{
      background-color:rgba(219, 55, 55, 0.5);
      background-image:none;
      border-color:transparent;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(255, 255, 255, 0.6); }
  .bp3-button[class*="bp3-intent-"] .bp3-button-spinner .bp3-spinner-head{
    stroke:#ffffff; }
  .bp3-button.bp3-large,
  .bp3-large .bp3-button{
    min-height:40px;
    min-width:40px;
    font-size:16px;
    padding:5px 15px; }
    .bp3-button.bp3-large::before,
    .bp3-button.bp3-large > *,
    .bp3-large .bp3-button::before,
    .bp3-large .bp3-button > *{
      margin-right:10px; }
    .bp3-button.bp3-large:empty::before,
    .bp3-button.bp3-large > :last-child,
    .bp3-large .bp3-button:empty::before,
    .bp3-large .bp3-button > :last-child{
      margin-right:0; }
  .bp3-button.bp3-small,
  .bp3-small .bp3-button{
    min-height:24px;
    min-width:24px;
    padding:0 7px; }
  .bp3-button.bp3-loading{
    position:relative; }
    .bp3-button.bp3-loading[class*="bp3-icon-"]::before{
      visibility:hidden; }
    .bp3-button.bp3-loading .bp3-button-spinner{
      margin:0;
      position:absolute; }
    .bp3-button.bp3-loading > :not(.bp3-button-spinner){
      visibility:hidden; }
  .bp3-button[class*="bp3-icon-"]::before{
    font-family:"Icons16", sans-serif;
    font-size:16px;
    font-style:normal;
    font-weight:400;
    line-height:1;
    -moz-osx-font-smoothing:grayscale;
    -webkit-font-smoothing:antialiased;
    color:#5c7080; }
  .bp3-button .bp3-icon, .bp3-button .bp3-icon-standard, .bp3-button .bp3-icon-large{
    color:#5c7080; }
    .bp3-button .bp3-icon.bp3-align-right, .bp3-button .bp3-icon-standard.bp3-align-right, .bp3-button .bp3-icon-large.bp3-align-right{
      margin-left:7px; }
  .bp3-button .bp3-icon:first-child:last-child,
  .bp3-button .bp3-spinner + .bp3-icon:last-child{
    margin:0 -7px; }
  .bp3-dark .bp3-button:not([class*="bp3-intent-"]){
    background-color:#394b59;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.05)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.05), rgba(255, 255, 255, 0));
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
    color:#f5f8fa; }
    .bp3-dark .bp3-button:not([class*="bp3-intent-"]):hover, .bp3-dark .bp3-button:not([class*="bp3-intent-"]):active, .bp3-dark .bp3-button:not([class*="bp3-intent-"]).bp3-active{
      color:#f5f8fa; }
    .bp3-dark .bp3-button:not([class*="bp3-intent-"]):hover{
      background-color:#30404d;
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-button:not([class*="bp3-intent-"]):active, .bp3-dark .bp3-button:not([class*="bp3-intent-"]).bp3-active{
      background-color:#202b33;
      background-image:none;
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-dark .bp3-button:not([class*="bp3-intent-"]):disabled, .bp3-dark .bp3-button:not([class*="bp3-intent-"]).bp3-disabled{
      background-color:rgba(57, 75, 89, 0.5);
      background-image:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(167, 182, 194, 0.6); }
      .bp3-dark .bp3-button:not([class*="bp3-intent-"]):disabled.bp3-active, .bp3-dark .bp3-button:not([class*="bp3-intent-"]).bp3-disabled.bp3-active{
        background:rgba(57, 75, 89, 0.7); }
    .bp3-dark .bp3-button:not([class*="bp3-intent-"]) .bp3-button-spinner .bp3-spinner-head{
      background:rgba(16, 22, 26, 0.5);
      stroke:#8a9ba8; }
    .bp3-dark .bp3-button:not([class*="bp3-intent-"])[class*="bp3-icon-"]::before{
      color:#a7b6c2; }
    .bp3-dark .bp3-button:not([class*="bp3-intent-"]) .bp3-icon, .bp3-dark .bp3-button:not([class*="bp3-intent-"]) .bp3-icon-standard, .bp3-dark .bp3-button:not([class*="bp3-intent-"]) .bp3-icon-large{
      color:#a7b6c2; }
  .bp3-dark .bp3-button[class*="bp3-intent-"]{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-button[class*="bp3-intent-"]:hover{
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-button[class*="bp3-intent-"]:active, .bp3-dark .bp3-button[class*="bp3-intent-"].bp3-active{
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-dark .bp3-button[class*="bp3-intent-"]:disabled, .bp3-dark .bp3-button[class*="bp3-intent-"].bp3-disabled{
      background-image:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(255, 255, 255, 0.3); }
    .bp3-dark .bp3-button[class*="bp3-intent-"] .bp3-button-spinner .bp3-spinner-head{
      stroke:#8a9ba8; }
  .bp3-button:disabled::before,
  .bp3-button:disabled .bp3-icon, .bp3-button:disabled .bp3-icon-standard, .bp3-button:disabled .bp3-icon-large, .bp3-button.bp3-disabled::before,
  .bp3-button.bp3-disabled .bp3-icon, .bp3-button.bp3-disabled .bp3-icon-standard, .bp3-button.bp3-disabled .bp3-icon-large, .bp3-button[class*="bp3-intent-"]::before,
  .bp3-button[class*="bp3-intent-"] .bp3-icon, .bp3-button[class*="bp3-intent-"] .bp3-icon-standard, .bp3-button[class*="bp3-intent-"] .bp3-icon-large{
    color:inherit !important; }
  .bp3-button.bp3-minimal{
    background:none;
    -webkit-box-shadow:none;
            box-shadow:none; }
    .bp3-button.bp3-minimal:hover{
      background:rgba(167, 182, 194, 0.3);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#182026;
      text-decoration:none; }
    .bp3-button.bp3-minimal:active, .bp3-button.bp3-minimal.bp3-active{
      background:rgba(115, 134, 148, 0.3);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#182026; }
    .bp3-button.bp3-minimal:disabled, .bp3-button.bp3-minimal:disabled:hover, .bp3-button.bp3-minimal.bp3-disabled, .bp3-button.bp3-minimal.bp3-disabled:hover{
      background:none;
      color:rgba(92, 112, 128, 0.6);
      cursor:not-allowed; }
      .bp3-button.bp3-minimal:disabled.bp3-active, .bp3-button.bp3-minimal:disabled:hover.bp3-active, .bp3-button.bp3-minimal.bp3-disabled.bp3-active, .bp3-button.bp3-minimal.bp3-disabled:hover.bp3-active{
        background:rgba(115, 134, 148, 0.3); }
    .bp3-dark .bp3-button.bp3-minimal{
      background:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:inherit; }
      .bp3-dark .bp3-button.bp3-minimal:hover, .bp3-dark .bp3-button.bp3-minimal:active, .bp3-dark .bp3-button.bp3-minimal.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none; }
      .bp3-dark .bp3-button.bp3-minimal:hover{
        background:rgba(138, 155, 168, 0.15); }
      .bp3-dark .bp3-button.bp3-minimal:active, .bp3-dark .bp3-button.bp3-minimal.bp3-active{
        background:rgba(138, 155, 168, 0.3);
        color:#f5f8fa; }
      .bp3-dark .bp3-button.bp3-minimal:disabled, .bp3-dark .bp3-button.bp3-minimal:disabled:hover, .bp3-dark .bp3-button.bp3-minimal.bp3-disabled, .bp3-dark .bp3-button.bp3-minimal.bp3-disabled:hover{
        background:none;
        color:rgba(167, 182, 194, 0.6);
        cursor:not-allowed; }
        .bp3-dark .bp3-button.bp3-minimal:disabled.bp3-active, .bp3-dark .bp3-button.bp3-minimal:disabled:hover.bp3-active, .bp3-dark .bp3-button.bp3-minimal.bp3-disabled.bp3-active, .bp3-dark .bp3-button.bp3-minimal.bp3-disabled:hover.bp3-active{
          background:rgba(138, 155, 168, 0.3); }
    .bp3-button.bp3-minimal.bp3-intent-primary{
      color:#106ba3; }
      .bp3-button.bp3-minimal.bp3-intent-primary:hover, .bp3-button.bp3-minimal.bp3-intent-primary:active, .bp3-button.bp3-minimal.bp3-intent-primary.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#106ba3; }
      .bp3-button.bp3-minimal.bp3-intent-primary:hover{
        background:rgba(19, 124, 189, 0.15);
        color:#106ba3; }
      .bp3-button.bp3-minimal.bp3-intent-primary:active, .bp3-button.bp3-minimal.bp3-intent-primary.bp3-active{
        background:rgba(19, 124, 189, 0.3);
        color:#106ba3; }
      .bp3-button.bp3-minimal.bp3-intent-primary:disabled, .bp3-button.bp3-minimal.bp3-intent-primary.bp3-disabled{
        background:none;
        color:rgba(16, 107, 163, 0.5); }
        .bp3-button.bp3-minimal.bp3-intent-primary:disabled.bp3-active, .bp3-button.bp3-minimal.bp3-intent-primary.bp3-disabled.bp3-active{
          background:rgba(19, 124, 189, 0.3); }
      .bp3-button.bp3-minimal.bp3-intent-primary .bp3-button-spinner .bp3-spinner-head{
        stroke:#106ba3; }
      .bp3-dark .bp3-button.bp3-minimal.bp3-intent-primary{
        color:#48aff0; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-primary:hover{
          background:rgba(19, 124, 189, 0.2);
          color:#48aff0; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-primary:active, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-primary.bp3-active{
          background:rgba(19, 124, 189, 0.3);
          color:#48aff0; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-primary:disabled, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-primary.bp3-disabled{
          background:none;
          color:rgba(72, 175, 240, 0.5); }
          .bp3-dark .bp3-button.bp3-minimal.bp3-intent-primary:disabled.bp3-active, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-primary.bp3-disabled.bp3-active{
            background:rgba(19, 124, 189, 0.3); }
    .bp3-button.bp3-minimal.bp3-intent-success{
      color:#0d8050; }
      .bp3-button.bp3-minimal.bp3-intent-success:hover, .bp3-button.bp3-minimal.bp3-intent-success:active, .bp3-button.bp3-minimal.bp3-intent-success.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#0d8050; }
      .bp3-button.bp3-minimal.bp3-intent-success:hover{
        background:rgba(15, 153, 96, 0.15);
        color:#0d8050; }
      .bp3-button.bp3-minimal.bp3-intent-success:active, .bp3-button.bp3-minimal.bp3-intent-success.bp3-active{
        background:rgba(15, 153, 96, 0.3);
        color:#0d8050; }
      .bp3-button.bp3-minimal.bp3-intent-success:disabled, .bp3-button.bp3-minimal.bp3-intent-success.bp3-disabled{
        background:none;
        color:rgba(13, 128, 80, 0.5); }
        .bp3-button.bp3-minimal.bp3-intent-success:disabled.bp3-active, .bp3-button.bp3-minimal.bp3-intent-success.bp3-disabled.bp3-active{
          background:rgba(15, 153, 96, 0.3); }
      .bp3-button.bp3-minimal.bp3-intent-success .bp3-button-spinner .bp3-spinner-head{
        stroke:#0d8050; }
      .bp3-dark .bp3-button.bp3-minimal.bp3-intent-success{
        color:#3dcc91; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-success:hover{
          background:rgba(15, 153, 96, 0.2);
          color:#3dcc91; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-success:active, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-success.bp3-active{
          background:rgba(15, 153, 96, 0.3);
          color:#3dcc91; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-success:disabled, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-success.bp3-disabled{
          background:none;
          color:rgba(61, 204, 145, 0.5); }
          .bp3-dark .bp3-button.bp3-minimal.bp3-intent-success:disabled.bp3-active, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-success.bp3-disabled.bp3-active{
            background:rgba(15, 153, 96, 0.3); }
    .bp3-button.bp3-minimal.bp3-intent-warning{
      color:#bf7326; }
      .bp3-button.bp3-minimal.bp3-intent-warning:hover, .bp3-button.bp3-minimal.bp3-intent-warning:active, .bp3-button.bp3-minimal.bp3-intent-warning.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#bf7326; }
      .bp3-button.bp3-minimal.bp3-intent-warning:hover{
        background:rgba(217, 130, 43, 0.15);
        color:#bf7326; }
      .bp3-button.bp3-minimal.bp3-intent-warning:active, .bp3-button.bp3-minimal.bp3-intent-warning.bp3-active{
        background:rgba(217, 130, 43, 0.3);
        color:#bf7326; }
      .bp3-button.bp3-minimal.bp3-intent-warning:disabled, .bp3-button.bp3-minimal.bp3-intent-warning.bp3-disabled{
        background:none;
        color:rgba(191, 115, 38, 0.5); }
        .bp3-button.bp3-minimal.bp3-intent-warning:disabled.bp3-active, .bp3-button.bp3-minimal.bp3-intent-warning.bp3-disabled.bp3-active{
          background:rgba(217, 130, 43, 0.3); }
      .bp3-button.bp3-minimal.bp3-intent-warning .bp3-button-spinner .bp3-spinner-head{
        stroke:#bf7326; }
      .bp3-dark .bp3-button.bp3-minimal.bp3-intent-warning{
        color:#ffb366; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-warning:hover{
          background:rgba(217, 130, 43, 0.2);
          color:#ffb366; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-warning:active, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-warning.bp3-active{
          background:rgba(217, 130, 43, 0.3);
          color:#ffb366; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-warning:disabled, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-warning.bp3-disabled{
          background:none;
          color:rgba(255, 179, 102, 0.5); }
          .bp3-dark .bp3-button.bp3-minimal.bp3-intent-warning:disabled.bp3-active, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-warning.bp3-disabled.bp3-active{
            background:rgba(217, 130, 43, 0.3); }
    .bp3-button.bp3-minimal.bp3-intent-danger{
      color:#c23030; }
      .bp3-button.bp3-minimal.bp3-intent-danger:hover, .bp3-button.bp3-minimal.bp3-intent-danger:active, .bp3-button.bp3-minimal.bp3-intent-danger.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#c23030; }
      .bp3-button.bp3-minimal.bp3-intent-danger:hover{
        background:rgba(219, 55, 55, 0.15);
        color:#c23030; }
      .bp3-button.bp3-minimal.bp3-intent-danger:active, .bp3-button.bp3-minimal.bp3-intent-danger.bp3-active{
        background:rgba(219, 55, 55, 0.3);
        color:#c23030; }
      .bp3-button.bp3-minimal.bp3-intent-danger:disabled, .bp3-button.bp3-minimal.bp3-intent-danger.bp3-disabled{
        background:none;
        color:rgba(194, 48, 48, 0.5); }
        .bp3-button.bp3-minimal.bp3-intent-danger:disabled.bp3-active, .bp3-button.bp3-minimal.bp3-intent-danger.bp3-disabled.bp3-active{
          background:rgba(219, 55, 55, 0.3); }
      .bp3-button.bp3-minimal.bp3-intent-danger .bp3-button-spinner .bp3-spinner-head{
        stroke:#c23030; }
      .bp3-dark .bp3-button.bp3-minimal.bp3-intent-danger{
        color:#ff7373; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-danger:hover{
          background:rgba(219, 55, 55, 0.2);
          color:#ff7373; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-danger:active, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-danger.bp3-active{
          background:rgba(219, 55, 55, 0.3);
          color:#ff7373; }
        .bp3-dark .bp3-button.bp3-minimal.bp3-intent-danger:disabled, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-danger.bp3-disabled{
          background:none;
          color:rgba(255, 115, 115, 0.5); }
          .bp3-dark .bp3-button.bp3-minimal.bp3-intent-danger:disabled.bp3-active, .bp3-dark .bp3-button.bp3-minimal.bp3-intent-danger.bp3-disabled.bp3-active{
            background:rgba(219, 55, 55, 0.3); }
  .bp3-button.bp3-outlined{
    background:none;
    -webkit-box-shadow:none;
            box-shadow:none;
    border:1px solid rgba(24, 32, 38, 0.2);
    -webkit-box-sizing:border-box;
            box-sizing:border-box; }
    .bp3-button.bp3-outlined:hover{
      background:rgba(167, 182, 194, 0.3);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#182026;
      text-decoration:none; }
    .bp3-button.bp3-outlined:active, .bp3-button.bp3-outlined.bp3-active{
      background:rgba(115, 134, 148, 0.3);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#182026; }
    .bp3-button.bp3-outlined:disabled, .bp3-button.bp3-outlined:disabled:hover, .bp3-button.bp3-outlined.bp3-disabled, .bp3-button.bp3-outlined.bp3-disabled:hover{
      background:none;
      color:rgba(92, 112, 128, 0.6);
      cursor:not-allowed; }
      .bp3-button.bp3-outlined:disabled.bp3-active, .bp3-button.bp3-outlined:disabled:hover.bp3-active, .bp3-button.bp3-outlined.bp3-disabled.bp3-active, .bp3-button.bp3-outlined.bp3-disabled:hover.bp3-active{
        background:rgba(115, 134, 148, 0.3); }
    .bp3-dark .bp3-button.bp3-outlined{
      background:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:inherit; }
      .bp3-dark .bp3-button.bp3-outlined:hover, .bp3-dark .bp3-button.bp3-outlined:active, .bp3-dark .bp3-button.bp3-outlined.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none; }
      .bp3-dark .bp3-button.bp3-outlined:hover{
        background:rgba(138, 155, 168, 0.15); }
      .bp3-dark .bp3-button.bp3-outlined:active, .bp3-dark .bp3-button.bp3-outlined.bp3-active{
        background:rgba(138, 155, 168, 0.3);
        color:#f5f8fa; }
      .bp3-dark .bp3-button.bp3-outlined:disabled, .bp3-dark .bp3-button.bp3-outlined:disabled:hover, .bp3-dark .bp3-button.bp3-outlined.bp3-disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-disabled:hover{
        background:none;
        color:rgba(167, 182, 194, 0.6);
        cursor:not-allowed; }
        .bp3-dark .bp3-button.bp3-outlined:disabled.bp3-active, .bp3-dark .bp3-button.bp3-outlined:disabled:hover.bp3-active, .bp3-dark .bp3-button.bp3-outlined.bp3-disabled.bp3-active, .bp3-dark .bp3-button.bp3-outlined.bp3-disabled:hover.bp3-active{
          background:rgba(138, 155, 168, 0.3); }
    .bp3-button.bp3-outlined.bp3-intent-primary{
      color:#106ba3; }
      .bp3-button.bp3-outlined.bp3-intent-primary:hover, .bp3-button.bp3-outlined.bp3-intent-primary:active, .bp3-button.bp3-outlined.bp3-intent-primary.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#106ba3; }
      .bp3-button.bp3-outlined.bp3-intent-primary:hover{
        background:rgba(19, 124, 189, 0.15);
        color:#106ba3; }
      .bp3-button.bp3-outlined.bp3-intent-primary:active, .bp3-button.bp3-outlined.bp3-intent-primary.bp3-active{
        background:rgba(19, 124, 189, 0.3);
        color:#106ba3; }
      .bp3-button.bp3-outlined.bp3-intent-primary:disabled, .bp3-button.bp3-outlined.bp3-intent-primary.bp3-disabled{
        background:none;
        color:rgba(16, 107, 163, 0.5); }
        .bp3-button.bp3-outlined.bp3-intent-primary:disabled.bp3-active, .bp3-button.bp3-outlined.bp3-intent-primary.bp3-disabled.bp3-active{
          background:rgba(19, 124, 189, 0.3); }
      .bp3-button.bp3-outlined.bp3-intent-primary .bp3-button-spinner .bp3-spinner-head{
        stroke:#106ba3; }
      .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary{
        color:#48aff0; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary:hover{
          background:rgba(19, 124, 189, 0.2);
          color:#48aff0; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary:active, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary.bp3-active{
          background:rgba(19, 124, 189, 0.3);
          color:#48aff0; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary:disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary.bp3-disabled{
          background:none;
          color:rgba(72, 175, 240, 0.5); }
          .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary:disabled.bp3-active, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary.bp3-disabled.bp3-active{
            background:rgba(19, 124, 189, 0.3); }
    .bp3-button.bp3-outlined.bp3-intent-success{
      color:#0d8050; }
      .bp3-button.bp3-outlined.bp3-intent-success:hover, .bp3-button.bp3-outlined.bp3-intent-success:active, .bp3-button.bp3-outlined.bp3-intent-success.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#0d8050; }
      .bp3-button.bp3-outlined.bp3-intent-success:hover{
        background:rgba(15, 153, 96, 0.15);
        color:#0d8050; }
      .bp3-button.bp3-outlined.bp3-intent-success:active, .bp3-button.bp3-outlined.bp3-intent-success.bp3-active{
        background:rgba(15, 153, 96, 0.3);
        color:#0d8050; }
      .bp3-button.bp3-outlined.bp3-intent-success:disabled, .bp3-button.bp3-outlined.bp3-intent-success.bp3-disabled{
        background:none;
        color:rgba(13, 128, 80, 0.5); }
        .bp3-button.bp3-outlined.bp3-intent-success:disabled.bp3-active, .bp3-button.bp3-outlined.bp3-intent-success.bp3-disabled.bp3-active{
          background:rgba(15, 153, 96, 0.3); }
      .bp3-button.bp3-outlined.bp3-intent-success .bp3-button-spinner .bp3-spinner-head{
        stroke:#0d8050; }
      .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success{
        color:#3dcc91; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success:hover{
          background:rgba(15, 153, 96, 0.2);
          color:#3dcc91; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success:active, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success.bp3-active{
          background:rgba(15, 153, 96, 0.3);
          color:#3dcc91; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success:disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success.bp3-disabled{
          background:none;
          color:rgba(61, 204, 145, 0.5); }
          .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success:disabled.bp3-active, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success.bp3-disabled.bp3-active{
            background:rgba(15, 153, 96, 0.3); }
    .bp3-button.bp3-outlined.bp3-intent-warning{
      color:#bf7326; }
      .bp3-button.bp3-outlined.bp3-intent-warning:hover, .bp3-button.bp3-outlined.bp3-intent-warning:active, .bp3-button.bp3-outlined.bp3-intent-warning.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#bf7326; }
      .bp3-button.bp3-outlined.bp3-intent-warning:hover{
        background:rgba(217, 130, 43, 0.15);
        color:#bf7326; }
      .bp3-button.bp3-outlined.bp3-intent-warning:active, .bp3-button.bp3-outlined.bp3-intent-warning.bp3-active{
        background:rgba(217, 130, 43, 0.3);
        color:#bf7326; }
      .bp3-button.bp3-outlined.bp3-intent-warning:disabled, .bp3-button.bp3-outlined.bp3-intent-warning.bp3-disabled{
        background:none;
        color:rgba(191, 115, 38, 0.5); }
        .bp3-button.bp3-outlined.bp3-intent-warning:disabled.bp3-active, .bp3-button.bp3-outlined.bp3-intent-warning.bp3-disabled.bp3-active{
          background:rgba(217, 130, 43, 0.3); }
      .bp3-button.bp3-outlined.bp3-intent-warning .bp3-button-spinner .bp3-spinner-head{
        stroke:#bf7326; }
      .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning{
        color:#ffb366; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning:hover{
          background:rgba(217, 130, 43, 0.2);
          color:#ffb366; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning:active, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning.bp3-active{
          background:rgba(217, 130, 43, 0.3);
          color:#ffb366; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning:disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning.bp3-disabled{
          background:none;
          color:rgba(255, 179, 102, 0.5); }
          .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning:disabled.bp3-active, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning.bp3-disabled.bp3-active{
            background:rgba(217, 130, 43, 0.3); }
    .bp3-button.bp3-outlined.bp3-intent-danger{
      color:#c23030; }
      .bp3-button.bp3-outlined.bp3-intent-danger:hover, .bp3-button.bp3-outlined.bp3-intent-danger:active, .bp3-button.bp3-outlined.bp3-intent-danger.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#c23030; }
      .bp3-button.bp3-outlined.bp3-intent-danger:hover{
        background:rgba(219, 55, 55, 0.15);
        color:#c23030; }
      .bp3-button.bp3-outlined.bp3-intent-danger:active, .bp3-button.bp3-outlined.bp3-intent-danger.bp3-active{
        background:rgba(219, 55, 55, 0.3);
        color:#c23030; }
      .bp3-button.bp3-outlined.bp3-intent-danger:disabled, .bp3-button.bp3-outlined.bp3-intent-danger.bp3-disabled{
        background:none;
        color:rgba(194, 48, 48, 0.5); }
        .bp3-button.bp3-outlined.bp3-intent-danger:disabled.bp3-active, .bp3-button.bp3-outlined.bp3-intent-danger.bp3-disabled.bp3-active{
          background:rgba(219, 55, 55, 0.3); }
      .bp3-button.bp3-outlined.bp3-intent-danger .bp3-button-spinner .bp3-spinner-head{
        stroke:#c23030; }
      .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger{
        color:#ff7373; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger:hover{
          background:rgba(219, 55, 55, 0.2);
          color:#ff7373; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger:active, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger.bp3-active{
          background:rgba(219, 55, 55, 0.3);
          color:#ff7373; }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger:disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger.bp3-disabled{
          background:none;
          color:rgba(255, 115, 115, 0.5); }
          .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger:disabled.bp3-active, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger.bp3-disabled.bp3-active{
            background:rgba(219, 55, 55, 0.3); }
    .bp3-button.bp3-outlined:disabled, .bp3-button.bp3-outlined.bp3-disabled, .bp3-button.bp3-outlined:disabled:hover, .bp3-button.bp3-outlined.bp3-disabled:hover{
      border-color:rgba(92, 112, 128, 0.1); }
    .bp3-dark .bp3-button.bp3-outlined{
      border-color:rgba(255, 255, 255, 0.4); }
      .bp3-dark .bp3-button.bp3-outlined:disabled, .bp3-dark .bp3-button.bp3-outlined:disabled:hover, .bp3-dark .bp3-button.bp3-outlined.bp3-disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-disabled:hover{
        border-color:rgba(255, 255, 255, 0.2); }
    .bp3-button.bp3-outlined.bp3-intent-primary{
      border-color:rgba(16, 107, 163, 0.6); }
      .bp3-button.bp3-outlined.bp3-intent-primary:disabled, .bp3-button.bp3-outlined.bp3-intent-primary.bp3-disabled{
        border-color:rgba(16, 107, 163, 0.2); }
      .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary{
        border-color:rgba(72, 175, 240, 0.6); }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary:disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-primary.bp3-disabled{
          border-color:rgba(72, 175, 240, 0.2); }
    .bp3-button.bp3-outlined.bp3-intent-success{
      border-color:rgba(13, 128, 80, 0.6); }
      .bp3-button.bp3-outlined.bp3-intent-success:disabled, .bp3-button.bp3-outlined.bp3-intent-success.bp3-disabled{
        border-color:rgba(13, 128, 80, 0.2); }
      .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success{
        border-color:rgba(61, 204, 145, 0.6); }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success:disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-success.bp3-disabled{
          border-color:rgba(61, 204, 145, 0.2); }
    .bp3-button.bp3-outlined.bp3-intent-warning{
      border-color:rgba(191, 115, 38, 0.6); }
      .bp3-button.bp3-outlined.bp3-intent-warning:disabled, .bp3-button.bp3-outlined.bp3-intent-warning.bp3-disabled{
        border-color:rgba(191, 115, 38, 0.2); }
      .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning{
        border-color:rgba(255, 179, 102, 0.6); }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning:disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-warning.bp3-disabled{
          border-color:rgba(255, 179, 102, 0.2); }
    .bp3-button.bp3-outlined.bp3-intent-danger{
      border-color:rgba(194, 48, 48, 0.6); }
      .bp3-button.bp3-outlined.bp3-intent-danger:disabled, .bp3-button.bp3-outlined.bp3-intent-danger.bp3-disabled{
        border-color:rgba(194, 48, 48, 0.2); }
      .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger{
        border-color:rgba(255, 115, 115, 0.6); }
        .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger:disabled, .bp3-dark .bp3-button.bp3-outlined.bp3-intent-danger.bp3-disabled{
          border-color:rgba(255, 115, 115, 0.2); }

a.bp3-button{
  text-align:center;
  text-decoration:none;
  -webkit-transition:none;
  transition:none; }
  a.bp3-button, a.bp3-button:hover, a.bp3-button:active{
    color:#182026; }
  a.bp3-button.bp3-disabled{
    color:rgba(92, 112, 128, 0.6); }

.bp3-button-text{
  -webkit-box-flex:0;
      -ms-flex:0 1 auto;
          flex:0 1 auto; }

.bp3-button.bp3-align-left .bp3-button-text, .bp3-button.bp3-align-right .bp3-button-text,
.bp3-button-group.bp3-align-left .bp3-button-text,
.bp3-button-group.bp3-align-right .bp3-button-text{
  -webkit-box-flex:1;
      -ms-flex:1 1 auto;
          flex:1 1 auto; }
.bp3-button-group{
  display:-webkit-inline-box;
  display:-ms-inline-flexbox;
  display:inline-flex; }
  .bp3-button-group .bp3-button{
    -webkit-box-flex:0;
        -ms-flex:0 0 auto;
            flex:0 0 auto;
    position:relative;
    z-index:4; }
    .bp3-button-group .bp3-button:focus{
      z-index:5; }
    .bp3-button-group .bp3-button:hover{
      z-index:6; }
    .bp3-button-group .bp3-button:active, .bp3-button-group .bp3-button.bp3-active{
      z-index:7; }
    .bp3-button-group .bp3-button:disabled, .bp3-button-group .bp3-button.bp3-disabled{
      z-index:3; }
    .bp3-button-group .bp3-button[class*="bp3-intent-"]{
      z-index:9; }
      .bp3-button-group .bp3-button[class*="bp3-intent-"]:focus{
        z-index:10; }
      .bp3-button-group .bp3-button[class*="bp3-intent-"]:hover{
        z-index:11; }
      .bp3-button-group .bp3-button[class*="bp3-intent-"]:active, .bp3-button-group .bp3-button[class*="bp3-intent-"].bp3-active{
        z-index:12; }
      .bp3-button-group .bp3-button[class*="bp3-intent-"]:disabled, .bp3-button-group .bp3-button[class*="bp3-intent-"].bp3-disabled{
        z-index:8; }
  .bp3-button-group:not(.bp3-minimal) > .bp3-popover-wrapper:not(:first-child) .bp3-button,
  .bp3-button-group:not(.bp3-minimal) > .bp3-button:not(:first-child){
    border-bottom-left-radius:0;
    border-top-left-radius:0; }
  .bp3-button-group:not(.bp3-minimal) > .bp3-popover-wrapper:not(:last-child) .bp3-button,
  .bp3-button-group:not(.bp3-minimal) > .bp3-button:not(:last-child){
    border-bottom-right-radius:0;
    border-top-right-radius:0;
    margin-right:-1px; }
  .bp3-button-group.bp3-minimal .bp3-button{
    background:none;
    -webkit-box-shadow:none;
            box-shadow:none; }
    .bp3-button-group.bp3-minimal .bp3-button:hover{
      background:rgba(167, 182, 194, 0.3);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#182026;
      text-decoration:none; }
    .bp3-button-group.bp3-minimal .bp3-button:active, .bp3-button-group.bp3-minimal .bp3-button.bp3-active{
      background:rgba(115, 134, 148, 0.3);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#182026; }
    .bp3-button-group.bp3-minimal .bp3-button:disabled, .bp3-button-group.bp3-minimal .bp3-button:disabled:hover, .bp3-button-group.bp3-minimal .bp3-button.bp3-disabled, .bp3-button-group.bp3-minimal .bp3-button.bp3-disabled:hover{
      background:none;
      color:rgba(92, 112, 128, 0.6);
      cursor:not-allowed; }
      .bp3-button-group.bp3-minimal .bp3-button:disabled.bp3-active, .bp3-button-group.bp3-minimal .bp3-button:disabled:hover.bp3-active, .bp3-button-group.bp3-minimal .bp3-button.bp3-disabled.bp3-active, .bp3-button-group.bp3-minimal .bp3-button.bp3-disabled:hover.bp3-active{
        background:rgba(115, 134, 148, 0.3); }
    .bp3-dark .bp3-button-group.bp3-minimal .bp3-button{
      background:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:inherit; }
      .bp3-dark .bp3-button-group.bp3-minimal .bp3-button:hover, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button:active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none; }
      .bp3-dark .bp3-button-group.bp3-minimal .bp3-button:hover{
        background:rgba(138, 155, 168, 0.15); }
      .bp3-dark .bp3-button-group.bp3-minimal .bp3-button:active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-active{
        background:rgba(138, 155, 168, 0.3);
        color:#f5f8fa; }
      .bp3-dark .bp3-button-group.bp3-minimal .bp3-button:disabled, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button:disabled:hover, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-disabled, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-disabled:hover{
        background:none;
        color:rgba(167, 182, 194, 0.6);
        cursor:not-allowed; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button:disabled.bp3-active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button:disabled:hover.bp3-active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-disabled.bp3-active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-disabled:hover.bp3-active{
          background:rgba(138, 155, 168, 0.3); }
    .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary{
      color:#106ba3; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:hover, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#106ba3; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:hover{
        background:rgba(19, 124, 189, 0.15);
        color:#106ba3; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary.bp3-active{
        background:rgba(19, 124, 189, 0.3);
        color:#106ba3; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:disabled, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary.bp3-disabled{
        background:none;
        color:rgba(16, 107, 163, 0.5); }
        .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:disabled.bp3-active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary.bp3-disabled.bp3-active{
          background:rgba(19, 124, 189, 0.3); }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary .bp3-button-spinner .bp3-spinner-head{
        stroke:#106ba3; }
      .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary{
        color:#48aff0; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:hover{
          background:rgba(19, 124, 189, 0.2);
          color:#48aff0; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary.bp3-active{
          background:rgba(19, 124, 189, 0.3);
          color:#48aff0; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:disabled, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary.bp3-disabled{
          background:none;
          color:rgba(72, 175, 240, 0.5); }
          .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary:disabled.bp3-active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-primary.bp3-disabled.bp3-active{
            background:rgba(19, 124, 189, 0.3); }
    .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success{
      color:#0d8050; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:hover, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#0d8050; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:hover{
        background:rgba(15, 153, 96, 0.15);
        color:#0d8050; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success.bp3-active{
        background:rgba(15, 153, 96, 0.3);
        color:#0d8050; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:disabled, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success.bp3-disabled{
        background:none;
        color:rgba(13, 128, 80, 0.5); }
        .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:disabled.bp3-active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success.bp3-disabled.bp3-active{
          background:rgba(15, 153, 96, 0.3); }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success .bp3-button-spinner .bp3-spinner-head{
        stroke:#0d8050; }
      .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success{
        color:#3dcc91; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:hover{
          background:rgba(15, 153, 96, 0.2);
          color:#3dcc91; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success.bp3-active{
          background:rgba(15, 153, 96, 0.3);
          color:#3dcc91; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:disabled, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success.bp3-disabled{
          background:none;
          color:rgba(61, 204, 145, 0.5); }
          .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success:disabled.bp3-active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-success.bp3-disabled.bp3-active{
            background:rgba(15, 153, 96, 0.3); }
    .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning{
      color:#bf7326; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:hover, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#bf7326; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:hover{
        background:rgba(217, 130, 43, 0.15);
        color:#bf7326; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning.bp3-active{
        background:rgba(217, 130, 43, 0.3);
        color:#bf7326; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:disabled, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning.bp3-disabled{
        background:none;
        color:rgba(191, 115, 38, 0.5); }
        .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:disabled.bp3-active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning.bp3-disabled.bp3-active{
          background:rgba(217, 130, 43, 0.3); }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning .bp3-button-spinner .bp3-spinner-head{
        stroke:#bf7326; }
      .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning{
        color:#ffb366; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:hover{
          background:rgba(217, 130, 43, 0.2);
          color:#ffb366; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning.bp3-active{
          background:rgba(217, 130, 43, 0.3);
          color:#ffb366; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:disabled, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning.bp3-disabled{
          background:none;
          color:rgba(255, 179, 102, 0.5); }
          .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning:disabled.bp3-active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-warning.bp3-disabled.bp3-active{
            background:rgba(217, 130, 43, 0.3); }
    .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger{
      color:#c23030; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:hover, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger.bp3-active{
        background:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:#c23030; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:hover{
        background:rgba(219, 55, 55, 0.15);
        color:#c23030; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger.bp3-active{
        background:rgba(219, 55, 55, 0.3);
        color:#c23030; }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:disabled, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger.bp3-disabled{
        background:none;
        color:rgba(194, 48, 48, 0.5); }
        .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:disabled.bp3-active, .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger.bp3-disabled.bp3-active{
          background:rgba(219, 55, 55, 0.3); }
      .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger .bp3-button-spinner .bp3-spinner-head{
        stroke:#c23030; }
      .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger{
        color:#ff7373; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:hover{
          background:rgba(219, 55, 55, 0.2);
          color:#ff7373; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger.bp3-active{
          background:rgba(219, 55, 55, 0.3);
          color:#ff7373; }
        .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:disabled, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger.bp3-disabled{
          background:none;
          color:rgba(255, 115, 115, 0.5); }
          .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger:disabled.bp3-active, .bp3-dark .bp3-button-group.bp3-minimal .bp3-button.bp3-intent-danger.bp3-disabled.bp3-active{
            background:rgba(219, 55, 55, 0.3); }
  .bp3-button-group .bp3-popover-wrapper,
  .bp3-button-group .bp3-popover-target{
    display:-webkit-box;
    display:-ms-flexbox;
    display:flex;
    -webkit-box-flex:1;
        -ms-flex:1 1 auto;
            flex:1 1 auto; }
  .bp3-button-group.bp3-fill{
    display:-webkit-box;
    display:-ms-flexbox;
    display:flex;
    width:100%; }
  .bp3-button-group .bp3-button.bp3-fill,
  .bp3-button-group.bp3-fill .bp3-button:not(.bp3-fixed){
    -webkit-box-flex:1;
        -ms-flex:1 1 auto;
            flex:1 1 auto; }
  .bp3-button-group.bp3-vertical{
    -webkit-box-align:stretch;
        -ms-flex-align:stretch;
            align-items:stretch;
    -webkit-box-orient:vertical;
    -webkit-box-direction:normal;
        -ms-flex-direction:column;
            flex-direction:column;
    vertical-align:top; }
    .bp3-button-group.bp3-vertical.bp3-fill{
      height:100%;
      width:unset; }
    .bp3-button-group.bp3-vertical .bp3-button{
      margin-right:0 !important;
      width:100%; }
    .bp3-button-group.bp3-vertical:not(.bp3-minimal) > .bp3-popover-wrapper:first-child .bp3-button,
    .bp3-button-group.bp3-vertical:not(.bp3-minimal) > .bp3-button:first-child{
      border-radius:3px 3px 0 0; }
    .bp3-button-group.bp3-vertical:not(.bp3-minimal) > .bp3-popover-wrapper:last-child .bp3-button,
    .bp3-button-group.bp3-vertical:not(.bp3-minimal) > .bp3-button:last-child{
      border-radius:0 0 3px 3px; }
    .bp3-button-group.bp3-vertical:not(.bp3-minimal) > .bp3-popover-wrapper:not(:last-child) .bp3-button,
    .bp3-button-group.bp3-vertical:not(.bp3-minimal) > .bp3-button:not(:last-child){
      margin-bottom:-1px; }
  .bp3-button-group.bp3-align-left .bp3-button{
    text-align:left; }
  .bp3-dark .bp3-button-group:not(.bp3-minimal) > .bp3-popover-wrapper:not(:last-child) .bp3-button,
  .bp3-dark .bp3-button-group:not(.bp3-minimal) > .bp3-button:not(:last-child){
    margin-right:1px; }
  .bp3-dark .bp3-button-group.bp3-vertical > .bp3-popover-wrapper:not(:last-child) .bp3-button,
  .bp3-dark .bp3-button-group.bp3-vertical > .bp3-button:not(:last-child){
    margin-bottom:1px; }
.bp3-callout{
  font-size:14px;
  line-height:1.5;
  background-color:rgba(138, 155, 168, 0.15);
  border-radius:3px;
  padding:10px 12px 9px;
  position:relative;
  width:100%; }
  .bp3-callout[class*="bp3-icon-"]{
    padding-left:40px; }
    .bp3-callout[class*="bp3-icon-"]::before{
      font-family:"Icons20", sans-serif;
      font-size:20px;
      font-style:normal;
      font-weight:400;
      line-height:1;
      -moz-osx-font-smoothing:grayscale;
      -webkit-font-smoothing:antialiased;
      color:#5c7080;
      left:10px;
      position:absolute;
      top:10px; }
  .bp3-callout.bp3-callout-icon{
    padding-left:40px; }
    .bp3-callout.bp3-callout-icon > .bp3-icon:first-child{
      color:#5c7080;
      left:10px;
      position:absolute;
      top:10px; }
  .bp3-callout .bp3-heading{
    line-height:20px;
    margin-bottom:5px;
    margin-top:0; }
    .bp3-callout .bp3-heading:last-child{
      margin-bottom:0; }
  .bp3-dark .bp3-callout{
    background-color:rgba(138, 155, 168, 0.2); }
    .bp3-dark .bp3-callout[class*="bp3-icon-"]::before{
      color:#a7b6c2; }
  .bp3-callout.bp3-intent-primary{
    background-color:rgba(19, 124, 189, 0.15); }
    .bp3-callout.bp3-intent-primary[class*="bp3-icon-"]::before,
    .bp3-callout.bp3-intent-primary > .bp3-icon:first-child,
    .bp3-callout.bp3-intent-primary .bp3-heading{
      color:#106ba3; }
    .bp3-dark .bp3-callout.bp3-intent-primary{
      background-color:rgba(19, 124, 189, 0.25); }
      .bp3-dark .bp3-callout.bp3-intent-primary[class*="bp3-icon-"]::before,
      .bp3-dark .bp3-callout.bp3-intent-primary > .bp3-icon:first-child,
      .bp3-dark .bp3-callout.bp3-intent-primary .bp3-heading{
        color:#48aff0; }
  .bp3-callout.bp3-intent-success{
    background-color:rgba(15, 153, 96, 0.15); }
    .bp3-callout.bp3-intent-success[class*="bp3-icon-"]::before,
    .bp3-callout.bp3-intent-success > .bp3-icon:first-child,
    .bp3-callout.bp3-intent-success .bp3-heading{
      color:#0d8050; }
    .bp3-dark .bp3-callout.bp3-intent-success{
      background-color:rgba(15, 153, 96, 0.25); }
      .bp3-dark .bp3-callout.bp3-intent-success[class*="bp3-icon-"]::before,
      .bp3-dark .bp3-callout.bp3-intent-success > .bp3-icon:first-child,
      .bp3-dark .bp3-callout.bp3-intent-success .bp3-heading{
        color:#3dcc91; }
  .bp3-callout.bp3-intent-warning{
    background-color:rgba(217, 130, 43, 0.15); }
    .bp3-callout.bp3-intent-warning[class*="bp3-icon-"]::before,
    .bp3-callout.bp3-intent-warning > .bp3-icon:first-child,
    .bp3-callout.bp3-intent-warning .bp3-heading{
      color:#bf7326; }
    .bp3-dark .bp3-callout.bp3-intent-warning{
      background-color:rgba(217, 130, 43, 0.25); }
      .bp3-dark .bp3-callout.bp3-intent-warning[class*="bp3-icon-"]::before,
      .bp3-dark .bp3-callout.bp3-intent-warning > .bp3-icon:first-child,
      .bp3-dark .bp3-callout.bp3-intent-warning .bp3-heading{
        color:#ffb366; }
  .bp3-callout.bp3-intent-danger{
    background-color:rgba(219, 55, 55, 0.15); }
    .bp3-callout.bp3-intent-danger[class*="bp3-icon-"]::before,
    .bp3-callout.bp3-intent-danger > .bp3-icon:first-child,
    .bp3-callout.bp3-intent-danger .bp3-heading{
      color:#c23030; }
    .bp3-dark .bp3-callout.bp3-intent-danger{
      background-color:rgba(219, 55, 55, 0.25); }
      .bp3-dark .bp3-callout.bp3-intent-danger[class*="bp3-icon-"]::before,
      .bp3-dark .bp3-callout.bp3-intent-danger > .bp3-icon:first-child,
      .bp3-dark .bp3-callout.bp3-intent-danger .bp3-heading{
        color:#ff7373; }
  .bp3-running-text .bp3-callout{
    margin:20px 0; }
.bp3-card{
  background-color:#ffffff;
  border-radius:3px;
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.15), 0 0 0 rgba(16, 22, 26, 0), 0 0 0 rgba(16, 22, 26, 0);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.15), 0 0 0 rgba(16, 22, 26, 0), 0 0 0 rgba(16, 22, 26, 0);
  padding:20px;
  -webkit-transition:-webkit-transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-box-shadow 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:-webkit-transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-box-shadow 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9), box-shadow 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9), box-shadow 200ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-box-shadow 200ms cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-card.bp3-dark,
  .bp3-dark .bp3-card{
    background-color:#30404d;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), 0 0 0 rgba(16, 22, 26, 0), 0 0 0 rgba(16, 22, 26, 0);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), 0 0 0 rgba(16, 22, 26, 0), 0 0 0 rgba(16, 22, 26, 0); }

.bp3-elevation-0{
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.15), 0 0 0 rgba(16, 22, 26, 0), 0 0 0 rgba(16, 22, 26, 0);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.15), 0 0 0 rgba(16, 22, 26, 0), 0 0 0 rgba(16, 22, 26, 0); }
  .bp3-elevation-0.bp3-dark,
  .bp3-dark .bp3-elevation-0{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), 0 0 0 rgba(16, 22, 26, 0), 0 0 0 rgba(16, 22, 26, 0);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), 0 0 0 rgba(16, 22, 26, 0), 0 0 0 rgba(16, 22, 26, 0); }

.bp3-elevation-1{
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.2); }
  .bp3-elevation-1.bp3-dark,
  .bp3-dark .bp3-elevation-1{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4); }

.bp3-elevation-2{
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 1px 1px rgba(16, 22, 26, 0.2), 0 2px 6px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 1px 1px rgba(16, 22, 26, 0.2), 0 2px 6px rgba(16, 22, 26, 0.2); }
  .bp3-elevation-2.bp3-dark,
  .bp3-dark .bp3-elevation-2{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 1px 1px rgba(16, 22, 26, 0.4), 0 2px 6px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 1px 1px rgba(16, 22, 26, 0.4), 0 2px 6px rgba(16, 22, 26, 0.4); }

.bp3-elevation-3{
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2); }
  .bp3-elevation-3.bp3-dark,
  .bp3-dark .bp3-elevation-3{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4); }

.bp3-elevation-4{
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 4px 8px rgba(16, 22, 26, 0.2), 0 18px 46px 6px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 4px 8px rgba(16, 22, 26, 0.2), 0 18px 46px 6px rgba(16, 22, 26, 0.2); }
  .bp3-elevation-4.bp3-dark,
  .bp3-dark .bp3-elevation-4{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 4px 8px rgba(16, 22, 26, 0.4), 0 18px 46px 6px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 4px 8px rgba(16, 22, 26, 0.4), 0 18px 46px 6px rgba(16, 22, 26, 0.4); }

.bp3-card.bp3-interactive:hover{
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
  cursor:pointer; }
  .bp3-card.bp3-interactive:hover.bp3-dark,
  .bp3-dark .bp3-card.bp3-interactive:hover{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4); }

.bp3-card.bp3-interactive:active{
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.2);
  opacity:0.9;
  -webkit-transition-duration:0;
          transition-duration:0; }
  .bp3-card.bp3-interactive:active.bp3-dark,
  .bp3-dark .bp3-card.bp3-interactive:active{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4); }

.bp3-collapse{
  height:0;
  overflow-y:hidden;
  -webkit-transition:height 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:height 200ms cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-collapse .bp3-collapse-body{
    -webkit-transition:-webkit-transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
    transition:-webkit-transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
    transition:transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
    transition:transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9); }
    .bp3-collapse .bp3-collapse-body[aria-hidden="true"]{
      display:none; }

.bp3-context-menu .bp3-popover-target{
  display:block; }

.bp3-context-menu-popover-target{
  position:fixed; }

.bp3-divider{
  border-bottom:1px solid rgba(16, 22, 26, 0.15);
  border-right:1px solid rgba(16, 22, 26, 0.15);
  margin:5px; }
  .bp3-dark .bp3-divider{
    border-color:rgba(16, 22, 26, 0.4); }
.bp3-dialog-container{
  opacity:1;
  -webkit-transform:scale(1);
          transform:scale(1);
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-pack:center;
      -ms-flex-pack:center;
          justify-content:center;
  min-height:100%;
  pointer-events:none;
  -webkit-user-select:none;
     -moz-user-select:none;
      -ms-user-select:none;
          user-select:none;
  width:100%; }
  .bp3-dialog-container.bp3-overlay-enter > .bp3-dialog, .bp3-dialog-container.bp3-overlay-appear > .bp3-dialog{
    opacity:0;
    -webkit-transform:scale(0.5);
            transform:scale(0.5); }
  .bp3-dialog-container.bp3-overlay-enter-active > .bp3-dialog, .bp3-dialog-container.bp3-overlay-appear-active > .bp3-dialog{
    opacity:1;
    -webkit-transform:scale(1);
            transform:scale(1);
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:300ms;
            transition-duration:300ms;
    -webkit-transition-property:opacity, -webkit-transform;
    transition-property:opacity, -webkit-transform;
    transition-property:opacity, transform;
    transition-property:opacity, transform, -webkit-transform;
    -webkit-transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11);
            transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11); }
  .bp3-dialog-container.bp3-overlay-exit > .bp3-dialog{
    opacity:1;
    -webkit-transform:scale(1);
            transform:scale(1); }
  .bp3-dialog-container.bp3-overlay-exit-active > .bp3-dialog{
    opacity:0;
    -webkit-transform:scale(0.5);
            transform:scale(0.5);
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:300ms;
            transition-duration:300ms;
    -webkit-transition-property:opacity, -webkit-transform;
    transition-property:opacity, -webkit-transform;
    transition-property:opacity, transform;
    transition-property:opacity, transform, -webkit-transform;
    -webkit-transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11);
            transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11); }

.bp3-dialog{
  background:#ebf1f5;
  border-radius:6px;
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 4px 8px rgba(16, 22, 26, 0.2), 0 18px 46px 6px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 4px 8px rgba(16, 22, 26, 0.2), 0 18px 46px 6px rgba(16, 22, 26, 0.2);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:vertical;
  -webkit-box-direction:normal;
      -ms-flex-direction:column;
          flex-direction:column;
  margin:30px 0;
  padding-bottom:20px;
  pointer-events:all;
  -webkit-user-select:text;
     -moz-user-select:text;
      -ms-user-select:text;
          user-select:text;
  width:500px; }
  .bp3-dialog:focus{
    outline:0; }
  .bp3-dialog.bp3-dark,
  .bp3-dark .bp3-dialog{
    background:#293742;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 4px 8px rgba(16, 22, 26, 0.4), 0 18px 46px 6px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 4px 8px rgba(16, 22, 26, 0.4), 0 18px 46px 6px rgba(16, 22, 26, 0.4);
    color:#f5f8fa; }

.bp3-dialog-header{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  background:#ffffff;
  border-radius:6px 6px 0 0;
  -webkit-box-shadow:0 1px 0 rgba(16, 22, 26, 0.15);
          box-shadow:0 1px 0 rgba(16, 22, 26, 0.15);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-flex:0;
      -ms-flex:0 0 auto;
          flex:0 0 auto;
  min-height:40px;
  padding-left:20px;
  padding-right:5px;
  z-index:30; }
  .bp3-dialog-header .bp3-icon-large,
  .bp3-dialog-header .bp3-icon{
    color:#5c7080;
    -webkit-box-flex:0;
        -ms-flex:0 0 auto;
            flex:0 0 auto;
    margin-right:10px; }
  .bp3-dialog-header .bp3-heading{
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
    word-wrap:normal;
    -webkit-box-flex:1;
        -ms-flex:1 1 auto;
            flex:1 1 auto;
    line-height:inherit;
    margin:0; }
    .bp3-dialog-header .bp3-heading:last-child{
      margin-right:20px; }
  .bp3-dark .bp3-dialog-header{
    background:#30404d;
    -webkit-box-shadow:0 1px 0 rgba(16, 22, 26, 0.4);
            box-shadow:0 1px 0 rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-dialog-header .bp3-icon-large,
    .bp3-dark .bp3-dialog-header .bp3-icon{
      color:#a7b6c2; }

.bp3-dialog-body{
  -webkit-box-flex:1;
      -ms-flex:1 1 auto;
          flex:1 1 auto;
  line-height:18px;
  margin:20px; }

.bp3-dialog-footer{
  -webkit-box-flex:0;
      -ms-flex:0 0 auto;
          flex:0 0 auto;
  margin:0 20px; }

.bp3-dialog-footer-actions{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-pack:end;
      -ms-flex-pack:end;
          justify-content:flex-end; }
  .bp3-dialog-footer-actions .bp3-button{
    margin-left:10px; }
.bp3-multistep-dialog-panels{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex; }

.bp3-multistep-dialog-left-panel{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-flex:1;
      -ms-flex:1;
          flex:1;
  -webkit-box-orient:vertical;
  -webkit-box-direction:normal;
      -ms-flex-direction:column;
          flex-direction:column; }
  .bp3-dark .bp3-multistep-dialog-left-panel{
    background:#202b33; }

.bp3-multistep-dialog-right-panel{
  background-color:#f5f8fa;
  border-left:1px solid rgba(16, 22, 26, 0.15);
  border-radius:0 0 6px 0;
  -webkit-box-flex:3;
      -ms-flex:3;
          flex:3;
  min-width:0; }
  .bp3-dark .bp3-multistep-dialog-right-panel{
    background-color:#293742;
    border-left:1px solid rgba(16, 22, 26, 0.4); }

.bp3-multistep-dialog-footer{
  background-color:#ffffff;
  border-radius:0 0 6px 0;
  border-top:1px solid rgba(16, 22, 26, 0.15);
  padding:10px; }
  .bp3-dark .bp3-multistep-dialog-footer{
    background:#30404d;
    border-top:1px solid rgba(16, 22, 26, 0.4); }

.bp3-dialog-step-container{
  background-color:#f5f8fa;
  border-bottom:1px solid rgba(16, 22, 26, 0.15); }
  .bp3-dark .bp3-dialog-step-container{
    background:#293742;
    border-bottom:1px solid rgba(16, 22, 26, 0.4); }
  .bp3-dialog-step-container.bp3-dialog-step-viewed{
    background-color:#ffffff; }
    .bp3-dark .bp3-dialog-step-container.bp3-dialog-step-viewed{
      background:#30404d; }

.bp3-dialog-step{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  background-color:#f5f8fa;
  border-radius:6px;
  cursor:not-allowed;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  margin:4px;
  padding:6px 14px; }
  .bp3-dark .bp3-dialog-step{
    background:#293742; }
  .bp3-dialog-step-viewed .bp3-dialog-step{
    background-color:#ffffff;
    cursor:pointer; }
    .bp3-dark .bp3-dialog-step-viewed .bp3-dialog-step{
      background:#30404d; }
  .bp3-dialog-step:hover{
    background-color:#f5f8fa; }
    .bp3-dark .bp3-dialog-step:hover{
      background:#293742; }

.bp3-dialog-step-icon{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  background-color:rgba(92, 112, 128, 0.6);
  border-radius:50%;
  color:#ffffff;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  height:25px;
  -webkit-box-pack:center;
      -ms-flex-pack:center;
          justify-content:center;
  width:25px; }
  .bp3-dark .bp3-dialog-step-icon{
    background-color:rgba(167, 182, 194, 0.6); }
  .bp3-active.bp3-dialog-step-viewed .bp3-dialog-step-icon{
    background-color:#2b95d6; }
  .bp3-dialog-step-viewed .bp3-dialog-step-icon{
    background-color:#8a9ba8; }

.bp3-dialog-step-title{
  color:rgba(92, 112, 128, 0.6);
  -webkit-box-flex:1;
      -ms-flex:1;
          flex:1;
  padding-left:10px; }
  .bp3-dark .bp3-dialog-step-title{
    color:rgba(167, 182, 194, 0.6); }
  .bp3-active.bp3-dialog-step-viewed .bp3-dialog-step-title{
    color:#2b95d6; }
  .bp3-dialog-step-viewed:not(.bp3-active) .bp3-dialog-step-title{
    color:#182026; }
    .bp3-dark .bp3-dialog-step-viewed:not(.bp3-active) .bp3-dialog-step-title{
      color:#f5f8fa; }
.bp3-drawer{
  background:#ffffff;
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 4px 8px rgba(16, 22, 26, 0.2), 0 18px 46px 6px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 4px 8px rgba(16, 22, 26, 0.2), 0 18px 46px 6px rgba(16, 22, 26, 0.2);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:vertical;
  -webkit-box-direction:normal;
      -ms-flex-direction:column;
          flex-direction:column;
  margin:0;
  padding:0; }
  .bp3-drawer:focus{
    outline:0; }
  .bp3-drawer.bp3-position-top{
    height:50%;
    left:0;
    right:0;
    top:0; }
    .bp3-drawer.bp3-position-top.bp3-overlay-enter, .bp3-drawer.bp3-position-top.bp3-overlay-appear{
      -webkit-transform:translateY(-100%);
              transform:translateY(-100%); }
    .bp3-drawer.bp3-position-top.bp3-overlay-enter-active, .bp3-drawer.bp3-position-top.bp3-overlay-appear-active{
      -webkit-transform:translateY(0);
              transform:translateY(0);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:200ms;
              transition-duration:200ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
    .bp3-drawer.bp3-position-top.bp3-overlay-exit{
      -webkit-transform:translateY(0);
              transform:translateY(0); }
    .bp3-drawer.bp3-position-top.bp3-overlay-exit-active{
      -webkit-transform:translateY(-100%);
              transform:translateY(-100%);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:100ms;
              transition-duration:100ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-drawer.bp3-position-bottom{
    bottom:0;
    height:50%;
    left:0;
    right:0; }
    .bp3-drawer.bp3-position-bottom.bp3-overlay-enter, .bp3-drawer.bp3-position-bottom.bp3-overlay-appear{
      -webkit-transform:translateY(100%);
              transform:translateY(100%); }
    .bp3-drawer.bp3-position-bottom.bp3-overlay-enter-active, .bp3-drawer.bp3-position-bottom.bp3-overlay-appear-active{
      -webkit-transform:translateY(0);
              transform:translateY(0);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:200ms;
              transition-duration:200ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
    .bp3-drawer.bp3-position-bottom.bp3-overlay-exit{
      -webkit-transform:translateY(0);
              transform:translateY(0); }
    .bp3-drawer.bp3-position-bottom.bp3-overlay-exit-active{
      -webkit-transform:translateY(100%);
              transform:translateY(100%);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:100ms;
              transition-duration:100ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-drawer.bp3-position-left{
    bottom:0;
    left:0;
    top:0;
    width:50%; }
    .bp3-drawer.bp3-position-left.bp3-overlay-enter, .bp3-drawer.bp3-position-left.bp3-overlay-appear{
      -webkit-transform:translateX(-100%);
              transform:translateX(-100%); }
    .bp3-drawer.bp3-position-left.bp3-overlay-enter-active, .bp3-drawer.bp3-position-left.bp3-overlay-appear-active{
      -webkit-transform:translateX(0);
              transform:translateX(0);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:200ms;
              transition-duration:200ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
    .bp3-drawer.bp3-position-left.bp3-overlay-exit{
      -webkit-transform:translateX(0);
              transform:translateX(0); }
    .bp3-drawer.bp3-position-left.bp3-overlay-exit-active{
      -webkit-transform:translateX(-100%);
              transform:translateX(-100%);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:100ms;
              transition-duration:100ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-drawer.bp3-position-right{
    bottom:0;
    right:0;
    top:0;
    width:50%; }
    .bp3-drawer.bp3-position-right.bp3-overlay-enter, .bp3-drawer.bp3-position-right.bp3-overlay-appear{
      -webkit-transform:translateX(100%);
              transform:translateX(100%); }
    .bp3-drawer.bp3-position-right.bp3-overlay-enter-active, .bp3-drawer.bp3-position-right.bp3-overlay-appear-active{
      -webkit-transform:translateX(0);
              transform:translateX(0);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:200ms;
              transition-duration:200ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
    .bp3-drawer.bp3-position-right.bp3-overlay-exit{
      -webkit-transform:translateX(0);
              transform:translateX(0); }
    .bp3-drawer.bp3-position-right.bp3-overlay-exit-active{
      -webkit-transform:translateX(100%);
              transform:translateX(100%);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:100ms;
              transition-duration:100ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
  .bp3-position-right):not(.bp3-vertical){
    bottom:0;
    right:0;
    top:0;
    width:50%; }
    .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right):not(.bp3-vertical).bp3-overlay-enter, .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right):not(.bp3-vertical).bp3-overlay-appear{
      -webkit-transform:translateX(100%);
              transform:translateX(100%); }
    .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right):not(.bp3-vertical).bp3-overlay-enter-active, .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right):not(.bp3-vertical).bp3-overlay-appear-active{
      -webkit-transform:translateX(0);
              transform:translateX(0);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:200ms;
              transition-duration:200ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
    .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right):not(.bp3-vertical).bp3-overlay-exit{
      -webkit-transform:translateX(0);
              transform:translateX(0); }
    .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right):not(.bp3-vertical).bp3-overlay-exit-active{
      -webkit-transform:translateX(100%);
              transform:translateX(100%);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:100ms;
              transition-duration:100ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
  .bp3-position-right).bp3-vertical{
    bottom:0;
    height:50%;
    left:0;
    right:0; }
    .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right).bp3-vertical.bp3-overlay-enter, .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right).bp3-vertical.bp3-overlay-appear{
      -webkit-transform:translateY(100%);
              transform:translateY(100%); }
    .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right).bp3-vertical.bp3-overlay-enter-active, .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right).bp3-vertical.bp3-overlay-appear-active{
      -webkit-transform:translateY(0);
              transform:translateY(0);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:200ms;
              transition-duration:200ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
    .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right).bp3-vertical.bp3-overlay-exit{
      -webkit-transform:translateY(0);
              transform:translateY(0); }
    .bp3-drawer:not(.bp3-position-top):not(.bp3-position-bottom):not(.bp3-position-left):not(
    .bp3-position-right).bp3-vertical.bp3-overlay-exit-active{
      -webkit-transform:translateY(100%);
              transform:translateY(100%);
      -webkit-transition-delay:0;
              transition-delay:0;
      -webkit-transition-duration:100ms;
              transition-duration:100ms;
      -webkit-transition-property:-webkit-transform;
      transition-property:-webkit-transform;
      transition-property:transform;
      transition-property:transform, -webkit-transform;
      -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
              transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-drawer.bp3-dark,
  .bp3-dark .bp3-drawer{
    background:#30404d;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 4px 8px rgba(16, 22, 26, 0.4), 0 18px 46px 6px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 4px 8px rgba(16, 22, 26, 0.4), 0 18px 46px 6px rgba(16, 22, 26, 0.4);
    color:#f5f8fa; }

.bp3-drawer-header{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  border-radius:0;
  -webkit-box-shadow:0 1px 0 rgba(16, 22, 26, 0.15);
          box-shadow:0 1px 0 rgba(16, 22, 26, 0.15);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-flex:0;
      -ms-flex:0 0 auto;
          flex:0 0 auto;
  min-height:40px;
  padding:5px;
  padding-left:20px;
  position:relative; }
  .bp3-drawer-header .bp3-icon-large,
  .bp3-drawer-header .bp3-icon{
    color:#5c7080;
    -webkit-box-flex:0;
        -ms-flex:0 0 auto;
            flex:0 0 auto;
    margin-right:10px; }
  .bp3-drawer-header .bp3-heading{
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
    word-wrap:normal;
    -webkit-box-flex:1;
        -ms-flex:1 1 auto;
            flex:1 1 auto;
    line-height:inherit;
    margin:0; }
    .bp3-drawer-header .bp3-heading:last-child{
      margin-right:20px; }
  .bp3-dark .bp3-drawer-header{
    -webkit-box-shadow:0 1px 0 rgba(16, 22, 26, 0.4);
            box-shadow:0 1px 0 rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-drawer-header .bp3-icon-large,
    .bp3-dark .bp3-drawer-header .bp3-icon{
      color:#a7b6c2; }

.bp3-drawer-body{
  -webkit-box-flex:1;
      -ms-flex:1 1 auto;
          flex:1 1 auto;
  line-height:18px;
  overflow:auto; }

.bp3-drawer-footer{
  -webkit-box-shadow:inset 0 1px 0 rgba(16, 22, 26, 0.15);
          box-shadow:inset 0 1px 0 rgba(16, 22, 26, 0.15);
  -webkit-box-flex:0;
      -ms-flex:0 0 auto;
          flex:0 0 auto;
  padding:10px 20px;
  position:relative; }
  .bp3-dark .bp3-drawer-footer{
    -webkit-box-shadow:inset 0 1px 0 rgba(16, 22, 26, 0.4);
            box-shadow:inset 0 1px 0 rgba(16, 22, 26, 0.4); }
.bp3-editable-text{
  cursor:text;
  display:inline-block;
  max-width:100%;
  position:relative;
  vertical-align:top;
  white-space:nowrap; }
  .bp3-editable-text::before{
    bottom:-3px;
    left:-3px;
    position:absolute;
    right:-3px;
    top:-3px;
    border-radius:3px;
    content:"";
    -webkit-transition:background-color 100ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
    transition:background-color 100ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
    transition:background-color 100ms cubic-bezier(0.4, 1, 0.75, 0.9), box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
    transition:background-color 100ms cubic-bezier(0.4, 1, 0.75, 0.9), box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-editable-text:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.15);
            box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.15); }
  .bp3-editable-text.bp3-editable-text-editing::before{
    background-color:#ffffff;
    -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
  .bp3-editable-text.bp3-disabled::before{
    -webkit-box-shadow:none;
            box-shadow:none; }
  .bp3-editable-text.bp3-intent-primary .bp3-editable-text-input,
  .bp3-editable-text.bp3-intent-primary .bp3-editable-text-content{
    color:#137cbd; }
  .bp3-editable-text.bp3-intent-primary:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(19, 124, 189, 0.4);
            box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(19, 124, 189, 0.4); }
  .bp3-editable-text.bp3-intent-primary.bp3-editable-text-editing::before{
    -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
  .bp3-editable-text.bp3-intent-success .bp3-editable-text-input,
  .bp3-editable-text.bp3-intent-success .bp3-editable-text-content{
    color:#0f9960; }
  .bp3-editable-text.bp3-intent-success:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), inset 0 0 0 1px rgba(15, 153, 96, 0.4);
            box-shadow:0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), inset 0 0 0 1px rgba(15, 153, 96, 0.4); }
  .bp3-editable-text.bp3-intent-success.bp3-editable-text-editing::before{
    -webkit-box-shadow:0 0 0 1px #0f9960, 0 0 0 3px rgba(15, 153, 96, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px #0f9960, 0 0 0 3px rgba(15, 153, 96, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
  .bp3-editable-text.bp3-intent-warning .bp3-editable-text-input,
  .bp3-editable-text.bp3-intent-warning .bp3-editable-text-content{
    color:#d9822b; }
  .bp3-editable-text.bp3-intent-warning:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), inset 0 0 0 1px rgba(217, 130, 43, 0.4);
            box-shadow:0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), inset 0 0 0 1px rgba(217, 130, 43, 0.4); }
  .bp3-editable-text.bp3-intent-warning.bp3-editable-text-editing::before{
    -webkit-box-shadow:0 0 0 1px #d9822b, 0 0 0 3px rgba(217, 130, 43, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px #d9822b, 0 0 0 3px rgba(217, 130, 43, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
  .bp3-editable-text.bp3-intent-danger .bp3-editable-text-input,
  .bp3-editable-text.bp3-intent-danger .bp3-editable-text-content{
    color:#db3737; }
  .bp3-editable-text.bp3-intent-danger:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), inset 0 0 0 1px rgba(219, 55, 55, 0.4);
            box-shadow:0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), inset 0 0 0 1px rgba(219, 55, 55, 0.4); }
  .bp3-editable-text.bp3-intent-danger.bp3-editable-text-editing::before{
    -webkit-box-shadow:0 0 0 1px #db3737, 0 0 0 3px rgba(219, 55, 55, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px #db3737, 0 0 0 3px rgba(219, 55, 55, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
  .bp3-dark .bp3-editable-text:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(255, 255, 255, 0.15);
            box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(255, 255, 255, 0.15); }
  .bp3-dark .bp3-editable-text.bp3-editable-text-editing::before{
    background-color:rgba(16, 22, 26, 0.3);
    -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-editable-text.bp3-disabled::before{
    -webkit-box-shadow:none;
            box-shadow:none; }
  .bp3-dark .bp3-editable-text.bp3-intent-primary .bp3-editable-text-content{
    color:#48aff0; }
  .bp3-dark .bp3-editable-text.bp3-intent-primary:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(72, 175, 240, 0), 0 0 0 0 rgba(72, 175, 240, 0), inset 0 0 0 1px rgba(72, 175, 240, 0.4);
            box-shadow:0 0 0 0 rgba(72, 175, 240, 0), 0 0 0 0 rgba(72, 175, 240, 0), inset 0 0 0 1px rgba(72, 175, 240, 0.4); }
  .bp3-dark .bp3-editable-text.bp3-intent-primary.bp3-editable-text-editing::before{
    -webkit-box-shadow:0 0 0 1px #48aff0, 0 0 0 3px rgba(72, 175, 240, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px #48aff0, 0 0 0 3px rgba(72, 175, 240, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-editable-text.bp3-intent-success .bp3-editable-text-content{
    color:#3dcc91; }
  .bp3-dark .bp3-editable-text.bp3-intent-success:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(61, 204, 145, 0), 0 0 0 0 rgba(61, 204, 145, 0), inset 0 0 0 1px rgba(61, 204, 145, 0.4);
            box-shadow:0 0 0 0 rgba(61, 204, 145, 0), 0 0 0 0 rgba(61, 204, 145, 0), inset 0 0 0 1px rgba(61, 204, 145, 0.4); }
  .bp3-dark .bp3-editable-text.bp3-intent-success.bp3-editable-text-editing::before{
    -webkit-box-shadow:0 0 0 1px #3dcc91, 0 0 0 3px rgba(61, 204, 145, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px #3dcc91, 0 0 0 3px rgba(61, 204, 145, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-editable-text.bp3-intent-warning .bp3-editable-text-content{
    color:#ffb366; }
  .bp3-dark .bp3-editable-text.bp3-intent-warning:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(255, 179, 102, 0), 0 0 0 0 rgba(255, 179, 102, 0), inset 0 0 0 1px rgba(255, 179, 102, 0.4);
            box-shadow:0 0 0 0 rgba(255, 179, 102, 0), 0 0 0 0 rgba(255, 179, 102, 0), inset 0 0 0 1px rgba(255, 179, 102, 0.4); }
  .bp3-dark .bp3-editable-text.bp3-intent-warning.bp3-editable-text-editing::before{
    -webkit-box-shadow:0 0 0 1px #ffb366, 0 0 0 3px rgba(255, 179, 102, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px #ffb366, 0 0 0 3px rgba(255, 179, 102, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-editable-text.bp3-intent-danger .bp3-editable-text-content{
    color:#ff7373; }
  .bp3-dark .bp3-editable-text.bp3-intent-danger:hover::before{
    -webkit-box-shadow:0 0 0 0 rgba(255, 115, 115, 0), 0 0 0 0 rgba(255, 115, 115, 0), inset 0 0 0 1px rgba(255, 115, 115, 0.4);
            box-shadow:0 0 0 0 rgba(255, 115, 115, 0), 0 0 0 0 rgba(255, 115, 115, 0), inset 0 0 0 1px rgba(255, 115, 115, 0.4); }
  .bp3-dark .bp3-editable-text.bp3-intent-danger.bp3-editable-text-editing::before{
    -webkit-box-shadow:0 0 0 1px #ff7373, 0 0 0 3px rgba(255, 115, 115, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px #ff7373, 0 0 0 3px rgba(255, 115, 115, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }

.bp3-editable-text-input,
.bp3-editable-text-content{
  color:inherit;
  display:inherit;
  font:inherit;
  letter-spacing:inherit;
  max-width:inherit;
  min-width:inherit;
  position:relative;
  resize:none;
  text-transform:inherit;
  vertical-align:top; }

.bp3-editable-text-input{
  background:none;
  border:none;
  -webkit-box-shadow:none;
          box-shadow:none;
  padding:0;
  white-space:pre-wrap;
  width:100%; }
  .bp3-editable-text-input::-webkit-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-editable-text-input::-moz-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-editable-text-input:-ms-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-editable-text-input::-ms-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-editable-text-input::placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-editable-text-input:focus{
    outline:none; }
  .bp3-editable-text-input::-ms-clear{
    display:none; }

.bp3-editable-text-content{
  overflow:hidden;
  padding-right:2px;
  text-overflow:ellipsis;
  white-space:pre; }
  .bp3-editable-text-editing > .bp3-editable-text-content{
    left:0;
    position:absolute;
    visibility:hidden; }
  .bp3-editable-text-placeholder > .bp3-editable-text-content{
    color:rgba(92, 112, 128, 0.6); }
    .bp3-dark .bp3-editable-text-placeholder > .bp3-editable-text-content{
      color:rgba(167, 182, 194, 0.6); }

.bp3-editable-text.bp3-multiline{
  display:block; }
  .bp3-editable-text.bp3-multiline .bp3-editable-text-content{
    overflow:auto;
    white-space:pre-wrap;
    word-wrap:break-word; }
.bp3-divider{
  border-bottom:1px solid rgba(16, 22, 26, 0.15);
  border-right:1px solid rgba(16, 22, 26, 0.15);
  margin:5px; }
  .bp3-dark .bp3-divider{
    border-color:rgba(16, 22, 26, 0.4); }
.bp3-control-group{
  -webkit-transform:translateZ(0);
          transform:translateZ(0);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:horizontal;
  -webkit-box-direction:normal;
      -ms-flex-direction:row;
          flex-direction:row;
  -webkit-box-align:stretch;
      -ms-flex-align:stretch;
          align-items:stretch; }
  .bp3-control-group > *{
    -webkit-box-flex:0;
        -ms-flex-positive:0;
            flex-grow:0;
    -ms-flex-negative:0;
        flex-shrink:0; }
  .bp3-control-group > .bp3-fill{
    -webkit-box-flex:1;
        -ms-flex-positive:1;
            flex-grow:1;
    -ms-flex-negative:1;
        flex-shrink:1; }
  .bp3-control-group .bp3-button,
  .bp3-control-group .bp3-html-select,
  .bp3-control-group .bp3-input,
  .bp3-control-group .bp3-select{
    position:relative; }
  .bp3-control-group .bp3-input{
    border-radius:inherit;
    z-index:2; }
    .bp3-control-group .bp3-input:focus{
      border-radius:3px;
      z-index:14; }
    .bp3-control-group .bp3-input[class*="bp3-intent"]{
      z-index:13; }
      .bp3-control-group .bp3-input[class*="bp3-intent"]:focus{
        z-index:15; }
    .bp3-control-group .bp3-input[readonly], .bp3-control-group .bp3-input:disabled, .bp3-control-group .bp3-input.bp3-disabled{
      z-index:1; }
  .bp3-control-group .bp3-input-group[class*="bp3-intent"] .bp3-input{
    z-index:13; }
    .bp3-control-group .bp3-input-group[class*="bp3-intent"] .bp3-input:focus{
      z-index:15; }
  .bp3-control-group .bp3-button,
  .bp3-control-group .bp3-html-select select,
  .bp3-control-group .bp3-select select{
    -webkit-transform:translateZ(0);
            transform:translateZ(0);
    border-radius:inherit;
    z-index:4; }
    .bp3-control-group .bp3-button:focus,
    .bp3-control-group .bp3-html-select select:focus,
    .bp3-control-group .bp3-select select:focus{
      z-index:5; }
    .bp3-control-group .bp3-button:hover,
    .bp3-control-group .bp3-html-select select:hover,
    .bp3-control-group .bp3-select select:hover{
      z-index:6; }
    .bp3-control-group .bp3-button:active,
    .bp3-control-group .bp3-html-select select:active,
    .bp3-control-group .bp3-select select:active{
      z-index:7; }
    .bp3-control-group .bp3-button[readonly], .bp3-control-group .bp3-button:disabled, .bp3-control-group .bp3-button.bp3-disabled,
    .bp3-control-group .bp3-html-select select[readonly],
    .bp3-control-group .bp3-html-select select:disabled,
    .bp3-control-group .bp3-html-select select.bp3-disabled,
    .bp3-control-group .bp3-select select[readonly],
    .bp3-control-group .bp3-select select:disabled,
    .bp3-control-group .bp3-select select.bp3-disabled{
      z-index:3; }
    .bp3-control-group .bp3-button[class*="bp3-intent"],
    .bp3-control-group .bp3-html-select select[class*="bp3-intent"],
    .bp3-control-group .bp3-select select[class*="bp3-intent"]{
      z-index:9; }
      .bp3-control-group .bp3-button[class*="bp3-intent"]:focus,
      .bp3-control-group .bp3-html-select select[class*="bp3-intent"]:focus,
      .bp3-control-group .bp3-select select[class*="bp3-intent"]:focus{
        z-index:10; }
      .bp3-control-group .bp3-button[class*="bp3-intent"]:hover,
      .bp3-control-group .bp3-html-select select[class*="bp3-intent"]:hover,
      .bp3-control-group .bp3-select select[class*="bp3-intent"]:hover{
        z-index:11; }
      .bp3-control-group .bp3-button[class*="bp3-intent"]:active,
      .bp3-control-group .bp3-html-select select[class*="bp3-intent"]:active,
      .bp3-control-group .bp3-select select[class*="bp3-intent"]:active{
        z-index:12; }
      .bp3-control-group .bp3-button[class*="bp3-intent"][readonly], .bp3-control-group .bp3-button[class*="bp3-intent"]:disabled, .bp3-control-group .bp3-button[class*="bp3-intent"].bp3-disabled,
      .bp3-control-group .bp3-html-select select[class*="bp3-intent"][readonly],
      .bp3-control-group .bp3-html-select select[class*="bp3-intent"]:disabled,
      .bp3-control-group .bp3-html-select select[class*="bp3-intent"].bp3-disabled,
      .bp3-control-group .bp3-select select[class*="bp3-intent"][readonly],
      .bp3-control-group .bp3-select select[class*="bp3-intent"]:disabled,
      .bp3-control-group .bp3-select select[class*="bp3-intent"].bp3-disabled{
        z-index:8; }
  .bp3-control-group .bp3-input-group > .bp3-icon,
  .bp3-control-group .bp3-input-group > .bp3-button,
  .bp3-control-group .bp3-input-group > .bp3-input-left-container,
  .bp3-control-group .bp3-input-group > .bp3-input-action{
    z-index:16; }
  .bp3-control-group .bp3-select::after,
  .bp3-control-group .bp3-html-select::after,
  .bp3-control-group .bp3-select > .bp3-icon,
  .bp3-control-group .bp3-html-select > .bp3-icon{
    z-index:17; }
  .bp3-control-group .bp3-select:focus-within{
    z-index:5; }
  .bp3-control-group:not(.bp3-vertical) > *:not(.bp3-divider){
    margin-right:-1px; }
  .bp3-control-group:not(.bp3-vertical) > .bp3-divider:not(:first-child){
    margin-left:6px; }
  .bp3-dark .bp3-control-group:not(.bp3-vertical) > *:not(.bp3-divider){
    margin-right:0; }
  .bp3-dark .bp3-control-group:not(.bp3-vertical) > .bp3-button + .bp3-button{
    margin-left:1px; }
  .bp3-control-group .bp3-popover-wrapper,
  .bp3-control-group .bp3-popover-target{
    border-radius:inherit; }
  .bp3-control-group > :first-child{
    border-radius:3px 0 0 3px; }
  .bp3-control-group > :last-child{
    border-radius:0 3px 3px 0;
    margin-right:0; }
  .bp3-control-group > :only-child{
    border-radius:3px;
    margin-right:0; }
  .bp3-control-group .bp3-input-group .bp3-button{
    border-radius:3px; }
  .bp3-control-group .bp3-numeric-input:not(:first-child) .bp3-input-group{
    border-bottom-left-radius:0;
    border-top-left-radius:0; }
  .bp3-control-group.bp3-fill{
    width:100%; }
  .bp3-control-group > .bp3-fill{
    -webkit-box-flex:1;
        -ms-flex:1 1 auto;
            flex:1 1 auto; }
  .bp3-control-group.bp3-fill > *:not(.bp3-fixed){
    -webkit-box-flex:1;
        -ms-flex:1 1 auto;
            flex:1 1 auto; }
  .bp3-control-group.bp3-vertical{
    -webkit-box-orient:vertical;
    -webkit-box-direction:normal;
        -ms-flex-direction:column;
            flex-direction:column; }
    .bp3-control-group.bp3-vertical > *{
      margin-top:-1px; }
    .bp3-control-group.bp3-vertical > :first-child{
      border-radius:3px 3px 0 0;
      margin-top:0; }
    .bp3-control-group.bp3-vertical > :last-child{
      border-radius:0 0 3px 3px; }
.bp3-control{
  cursor:pointer;
  display:block;
  margin-bottom:10px;
  position:relative;
  text-transform:none; }
  .bp3-control input:checked ~ .bp3-control-indicator{
    background-color:#137cbd;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.1)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0));
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
    color:#ffffff; }
  .bp3-control:hover input:checked ~ .bp3-control-indicator{
    background-color:#106ba3;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2); }
  .bp3-control input:not(:disabled):active:checked ~ .bp3-control-indicator{
    background:#0e5a8a;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
  .bp3-control input:disabled:checked ~ .bp3-control-indicator{
    background:rgba(19, 124, 189, 0.5);
    -webkit-box-shadow:none;
            box-shadow:none; }
  .bp3-dark .bp3-control input:checked ~ .bp3-control-indicator{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-control:hover input:checked ~ .bp3-control-indicator{
    background-color:#106ba3;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-control input:not(:disabled):active:checked ~ .bp3-control-indicator{
    background-color:#0e5a8a;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
  .bp3-dark .bp3-control input:disabled:checked ~ .bp3-control-indicator{
    background:rgba(14, 90, 138, 0.5);
    -webkit-box-shadow:none;
            box-shadow:none; }
  .bp3-control:not(.bp3-align-right){
    padding-left:26px; }
    .bp3-control:not(.bp3-align-right) .bp3-control-indicator{
      margin-left:-26px; }
  .bp3-control.bp3-align-right{
    padding-right:26px; }
    .bp3-control.bp3-align-right .bp3-control-indicator{
      margin-right:-26px; }
  .bp3-control.bp3-disabled{
    color:rgba(92, 112, 128, 0.6);
    cursor:not-allowed; }
  .bp3-control.bp3-inline{
    display:inline-block;
    margin-right:20px; }
  .bp3-control input{
    left:0;
    opacity:0;
    position:absolute;
    top:0;
    z-index:-1; }
  .bp3-control .bp3-control-indicator{
    background-clip:padding-box;
    background-color:#f5f8fa;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.8)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.8), rgba(255, 255, 255, 0));
    border:none;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
    cursor:pointer;
    display:inline-block;
    font-size:16px;
    height:1em;
    margin-right:10px;
    margin-top:-3px;
    position:relative;
    -webkit-user-select:none;
       -moz-user-select:none;
        -ms-user-select:none;
            user-select:none;
    vertical-align:middle;
    width:1em; }
    .bp3-control .bp3-control-indicator::before{
      content:"";
      display:block;
      height:1em;
      width:1em; }
  .bp3-control:hover .bp3-control-indicator{
    background-color:#ebf1f5; }
  .bp3-control input:not(:disabled):active ~ .bp3-control-indicator{
    background:#d8e1e8;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
  .bp3-control input:disabled ~ .bp3-control-indicator{
    background:rgba(206, 217, 224, 0.5);
    -webkit-box-shadow:none;
            box-shadow:none;
    cursor:not-allowed; }
  .bp3-control input:focus ~ .bp3-control-indicator{
    outline:rgba(19, 124, 189, 0.6) auto 2px;
    outline-offset:2px;
    -moz-outline-radius:6px; }
  .bp3-control.bp3-align-right .bp3-control-indicator{
    float:right;
    margin-left:10px;
    margin-top:1px; }
  .bp3-control.bp3-large{
    font-size:16px; }
    .bp3-control.bp3-large:not(.bp3-align-right){
      padding-left:30px; }
      .bp3-control.bp3-large:not(.bp3-align-right) .bp3-control-indicator{
        margin-left:-30px; }
    .bp3-control.bp3-large.bp3-align-right{
      padding-right:30px; }
      .bp3-control.bp3-large.bp3-align-right .bp3-control-indicator{
        margin-right:-30px; }
    .bp3-control.bp3-large .bp3-control-indicator{
      font-size:20px; }
    .bp3-control.bp3-large.bp3-align-right .bp3-control-indicator{
      margin-top:0; }
  .bp3-control.bp3-checkbox input:indeterminate ~ .bp3-control-indicator{
    background-color:#137cbd;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.1)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0));
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
    color:#ffffff; }
  .bp3-control.bp3-checkbox:hover input:indeterminate ~ .bp3-control-indicator{
    background-color:#106ba3;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 -1px 0 rgba(16, 22, 26, 0.2); }
  .bp3-control.bp3-checkbox input:not(:disabled):active:indeterminate ~ .bp3-control-indicator{
    background:#0e5a8a;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
  .bp3-control.bp3-checkbox input:disabled:indeterminate ~ .bp3-control-indicator{
    background:rgba(19, 124, 189, 0.5);
    -webkit-box-shadow:none;
            box-shadow:none; }
  .bp3-dark .bp3-control.bp3-checkbox input:indeterminate ~ .bp3-control-indicator{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-control.bp3-checkbox:hover input:indeterminate ~ .bp3-control-indicator{
    background-color:#106ba3;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-control.bp3-checkbox input:not(:disabled):active:indeterminate ~ .bp3-control-indicator{
    background-color:#0e5a8a;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
  .bp3-dark .bp3-control.bp3-checkbox input:disabled:indeterminate ~ .bp3-control-indicator{
    background:rgba(14, 90, 138, 0.5);
    -webkit-box-shadow:none;
            box-shadow:none; }
  .bp3-control.bp3-checkbox .bp3-control-indicator{
    border-radius:3px; }
  .bp3-control.bp3-checkbox input:checked ~ .bp3-control-indicator::before{
    background-image:url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill-rule='evenodd' clip-rule='evenodd' d='M12 5c-.28 0-.53.11-.71.29L7 9.59l-2.29-2.3a1.003 1.003 0 00-1.42 1.42l3 3c.18.18.43.29.71.29s.53-.11.71-.29l5-5A1.003 1.003 0 0012 5z' fill='white'/%3e%3c/svg%3e"); }
  .bp3-control.bp3-checkbox input:indeterminate ~ .bp3-control-indicator::before{
    background-image:url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill-rule='evenodd' clip-rule='evenodd' d='M11 7H5c-.55 0-1 .45-1 1s.45 1 1 1h6c.55 0 1-.45 1-1s-.45-1-1-1z' fill='white'/%3e%3c/svg%3e"); }
  .bp3-control.bp3-radio .bp3-control-indicator{
    border-radius:50%; }
  .bp3-control.bp3-radio input:checked ~ .bp3-control-indicator::before{
    background-image:radial-gradient(#ffffff, #ffffff 28%, transparent 32%); }
  .bp3-control.bp3-radio input:checked:disabled ~ .bp3-control-indicator::before{
    opacity:0.5; }
  .bp3-control.bp3-radio input:focus ~ .bp3-control-indicator{
    -moz-outline-radius:16px; }
  .bp3-control.bp3-switch input ~ .bp3-control-indicator{
    background:rgba(167, 182, 194, 0.5); }
  .bp3-control.bp3-switch:hover input ~ .bp3-control-indicator{
    background:rgba(115, 134, 148, 0.5); }
  .bp3-control.bp3-switch input:not(:disabled):active ~ .bp3-control-indicator{
    background:rgba(92, 112, 128, 0.5); }
  .bp3-control.bp3-switch input:disabled ~ .bp3-control-indicator{
    background:rgba(206, 217, 224, 0.5); }
    .bp3-control.bp3-switch input:disabled ~ .bp3-control-indicator::before{
      background:rgba(255, 255, 255, 0.8); }
  .bp3-control.bp3-switch input:checked ~ .bp3-control-indicator{
    background:#137cbd; }
  .bp3-control.bp3-switch:hover input:checked ~ .bp3-control-indicator{
    background:#106ba3; }
  .bp3-control.bp3-switch input:checked:not(:disabled):active ~ .bp3-control-indicator{
    background:#0e5a8a; }
  .bp3-control.bp3-switch input:checked:disabled ~ .bp3-control-indicator{
    background:rgba(19, 124, 189, 0.5); }
    .bp3-control.bp3-switch input:checked:disabled ~ .bp3-control-indicator::before{
      background:rgba(255, 255, 255, 0.8); }
  .bp3-control.bp3-switch:not(.bp3-align-right){
    padding-left:38px; }
    .bp3-control.bp3-switch:not(.bp3-align-right) .bp3-control-indicator{
      margin-left:-38px; }
  .bp3-control.bp3-switch.bp3-align-right{
    padding-right:38px; }
    .bp3-control.bp3-switch.bp3-align-right .bp3-control-indicator{
      margin-right:-38px; }
  .bp3-control.bp3-switch .bp3-control-indicator{
    border:none;
    border-radius:1.75em;
    -webkit-box-shadow:none !important;
            box-shadow:none !important;
    min-width:1.75em;
    -webkit-transition:background-color 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
    transition:background-color 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
    width:auto; }
    .bp3-control.bp3-switch .bp3-control-indicator::before{
      background:#ffffff;
      border-radius:50%;
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 1px 1px rgba(16, 22, 26, 0.2);
      height:calc(1em - 4px);
      left:0;
      margin:2px;
      position:absolute;
      -webkit-transition:left 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
      transition:left 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
      width:calc(1em - 4px); }
  .bp3-control.bp3-switch input:checked ~ .bp3-control-indicator::before{
    left:calc(100% - 1em); }
  .bp3-control.bp3-switch.bp3-large:not(.bp3-align-right){
    padding-left:45px; }
    .bp3-control.bp3-switch.bp3-large:not(.bp3-align-right) .bp3-control-indicator{
      margin-left:-45px; }
  .bp3-control.bp3-switch.bp3-large.bp3-align-right{
    padding-right:45px; }
    .bp3-control.bp3-switch.bp3-large.bp3-align-right .bp3-control-indicator{
      margin-right:-45px; }
  .bp3-dark .bp3-control.bp3-switch input ~ .bp3-control-indicator{
    background:rgba(16, 22, 26, 0.5); }
  .bp3-dark .bp3-control.bp3-switch:hover input ~ .bp3-control-indicator{
    background:rgba(16, 22, 26, 0.7); }
  .bp3-dark .bp3-control.bp3-switch input:not(:disabled):active ~ .bp3-control-indicator{
    background:rgba(16, 22, 26, 0.9); }
  .bp3-dark .bp3-control.bp3-switch input:disabled ~ .bp3-control-indicator{
    background:rgba(57, 75, 89, 0.5); }
    .bp3-dark .bp3-control.bp3-switch input:disabled ~ .bp3-control-indicator::before{
      background:rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-control.bp3-switch input:checked ~ .bp3-control-indicator{
    background:#137cbd; }
  .bp3-dark .bp3-control.bp3-switch:hover input:checked ~ .bp3-control-indicator{
    background:#106ba3; }
  .bp3-dark .bp3-control.bp3-switch input:checked:not(:disabled):active ~ .bp3-control-indicator{
    background:#0e5a8a; }
  .bp3-dark .bp3-control.bp3-switch input:checked:disabled ~ .bp3-control-indicator{
    background:rgba(14, 90, 138, 0.5); }
    .bp3-dark .bp3-control.bp3-switch input:checked:disabled ~ .bp3-control-indicator::before{
      background:rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-control.bp3-switch .bp3-control-indicator::before{
    background:#394b59;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-control.bp3-switch input:checked ~ .bp3-control-indicator::before{
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4); }
  .bp3-control.bp3-switch .bp3-switch-inner-text{
    font-size:0.7em;
    text-align:center; }
  .bp3-control.bp3-switch .bp3-control-indicator-child:first-child{
    line-height:0;
    margin-left:0.5em;
    margin-right:1.2em;
    visibility:hidden; }
  .bp3-control.bp3-switch .bp3-control-indicator-child:last-child{
    line-height:1em;
    margin-left:1.2em;
    margin-right:0.5em;
    visibility:visible; }
  .bp3-control.bp3-switch input:checked ~ .bp3-control-indicator .bp3-control-indicator-child:first-child{
    line-height:1em;
    visibility:visible; }
  .bp3-control.bp3-switch input:checked ~ .bp3-control-indicator .bp3-control-indicator-child:last-child{
    line-height:0;
    visibility:hidden; }
  .bp3-dark .bp3-control{
    color:#f5f8fa; }
    .bp3-dark .bp3-control.bp3-disabled{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-control .bp3-control-indicator{
      background-color:#394b59;
      background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.05)), to(rgba(255, 255, 255, 0)));
      background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.05), rgba(255, 255, 255, 0));
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-control:hover .bp3-control-indicator{
      background-color:#30404d; }
    .bp3-dark .bp3-control input:not(:disabled):active ~ .bp3-control-indicator{
      background:#202b33;
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-dark .bp3-control input:disabled ~ .bp3-control-indicator{
      background:rgba(57, 75, 89, 0.5);
      -webkit-box-shadow:none;
              box-shadow:none;
      cursor:not-allowed; }
    .bp3-dark .bp3-control.bp3-checkbox input:disabled:checked ~ .bp3-control-indicator, .bp3-dark .bp3-control.bp3-checkbox input:disabled:indeterminate ~ .bp3-control-indicator{
      color:rgba(167, 182, 194, 0.6); }
.bp3-file-input{
  cursor:pointer;
  display:inline-block;
  height:30px;
  position:relative; }
  .bp3-file-input input{
    margin:0;
    min-width:200px;
    opacity:0; }
    .bp3-file-input input:disabled + .bp3-file-upload-input,
    .bp3-file-input input.bp3-disabled + .bp3-file-upload-input{
      background:rgba(206, 217, 224, 0.5);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(92, 112, 128, 0.6);
      cursor:not-allowed;
      resize:none; }
      .bp3-file-input input:disabled + .bp3-file-upload-input::after,
      .bp3-file-input input.bp3-disabled + .bp3-file-upload-input::after{
        background-color:rgba(206, 217, 224, 0.5);
        background-image:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:rgba(92, 112, 128, 0.6);
        cursor:not-allowed;
        outline:none; }
        .bp3-file-input input:disabled + .bp3-file-upload-input::after.bp3-active, .bp3-file-input input:disabled + .bp3-file-upload-input::after.bp3-active:hover,
        .bp3-file-input input.bp3-disabled + .bp3-file-upload-input::after.bp3-active,
        .bp3-file-input input.bp3-disabled + .bp3-file-upload-input::after.bp3-active:hover{
          background:rgba(206, 217, 224, 0.7); }
      .bp3-dark .bp3-file-input input:disabled + .bp3-file-upload-input, .bp3-dark
      .bp3-file-input input.bp3-disabled + .bp3-file-upload-input{
        background:rgba(57, 75, 89, 0.5);
        -webkit-box-shadow:none;
                box-shadow:none;
        color:rgba(167, 182, 194, 0.6); }
        .bp3-dark .bp3-file-input input:disabled + .bp3-file-upload-input::after, .bp3-dark
        .bp3-file-input input.bp3-disabled + .bp3-file-upload-input::after{
          background-color:rgba(57, 75, 89, 0.5);
          background-image:none;
          -webkit-box-shadow:none;
                  box-shadow:none;
          color:rgba(167, 182, 194, 0.6); }
          .bp3-dark .bp3-file-input input:disabled + .bp3-file-upload-input::after.bp3-active, .bp3-dark
          .bp3-file-input input.bp3-disabled + .bp3-file-upload-input::after.bp3-active{
            background:rgba(57, 75, 89, 0.7); }
  .bp3-file-input.bp3-file-input-has-selection .bp3-file-upload-input{
    color:#182026; }
  .bp3-dark .bp3-file-input.bp3-file-input-has-selection .bp3-file-upload-input{
    color:#f5f8fa; }
  .bp3-file-input.bp3-fill{
    width:100%; }
  .bp3-file-input.bp3-large,
  .bp3-large .bp3-file-input{
    height:40px; }
  .bp3-file-input .bp3-file-upload-input-custom-text::after{
    content:attr(bp3-button-text); }

.bp3-file-upload-input{
  -webkit-appearance:none;
     -moz-appearance:none;
          appearance:none;
  background:#ffffff;
  border:none;
  border-radius:3px;
  -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
  color:#182026;
  font-size:14px;
  font-weight:400;
  height:30px;
  line-height:30px;
  outline:none;
  padding:0 10px;
  -webkit-transition:-webkit-box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:-webkit-box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
  vertical-align:middle;
  overflow:hidden;
  text-overflow:ellipsis;
  white-space:nowrap;
  word-wrap:normal;
  color:rgba(92, 112, 128, 0.6);
  left:0;
  padding-right:80px;
  position:absolute;
  right:0;
  top:0;
  -webkit-user-select:none;
     -moz-user-select:none;
      -ms-user-select:none;
          user-select:none; }
  .bp3-file-upload-input::-webkit-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-file-upload-input::-moz-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-file-upload-input:-ms-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-file-upload-input::-ms-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-file-upload-input::placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-file-upload-input:focus, .bp3-file-upload-input.bp3-active{
    -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
  .bp3-file-upload-input[type="search"], .bp3-file-upload-input.bp3-round{
    border-radius:30px;
    -webkit-box-sizing:border-box;
            box-sizing:border-box;
    padding-left:10px; }
  .bp3-file-upload-input[readonly]{
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.15);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.15); }
  .bp3-file-upload-input:disabled, .bp3-file-upload-input.bp3-disabled{
    background:rgba(206, 217, 224, 0.5);
    -webkit-box-shadow:none;
            box-shadow:none;
    color:rgba(92, 112, 128, 0.6);
    cursor:not-allowed;
    resize:none; }
  .bp3-file-upload-input::after{
    background-color:#f5f8fa;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.8)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.8), rgba(255, 255, 255, 0));
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
    color:#182026;
    min-height:24px;
    min-width:24px;
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
    word-wrap:normal;
    border-radius:3px;
    content:"Browse";
    line-height:24px;
    margin:3px;
    position:absolute;
    right:0;
    text-align:center;
    top:0;
    width:70px; }
    .bp3-file-upload-input::after:hover{
      background-clip:padding-box;
      background-color:#ebf1f5;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1); }
    .bp3-file-upload-input::after:active, .bp3-file-upload-input::after.bp3-active{
      background-color:#d8e1e8;
      background-image:none;
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-file-upload-input::after:disabled, .bp3-file-upload-input::after.bp3-disabled{
      background-color:rgba(206, 217, 224, 0.5);
      background-image:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(92, 112, 128, 0.6);
      cursor:not-allowed;
      outline:none; }
      .bp3-file-upload-input::after:disabled.bp3-active, .bp3-file-upload-input::after:disabled.bp3-active:hover, .bp3-file-upload-input::after.bp3-disabled.bp3-active, .bp3-file-upload-input::after.bp3-disabled.bp3-active:hover{
        background:rgba(206, 217, 224, 0.7); }
  .bp3-file-upload-input:hover::after{
    background-clip:padding-box;
    background-color:#ebf1f5;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1); }
  .bp3-file-upload-input:active::after{
    background-color:#d8e1e8;
    background-image:none;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
  .bp3-large .bp3-file-upload-input{
    font-size:16px;
    height:40px;
    line-height:40px;
    padding-right:95px; }
    .bp3-large .bp3-file-upload-input[type="search"], .bp3-large .bp3-file-upload-input.bp3-round{
      padding:0 15px; }
    .bp3-large .bp3-file-upload-input::after{
      min-height:30px;
      min-width:30px;
      line-height:30px;
      margin:5px;
      width:85px; }
  .bp3-dark .bp3-file-upload-input{
    background:rgba(16, 22, 26, 0.3);
    -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
    color:#f5f8fa;
    color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-file-upload-input::-webkit-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-file-upload-input::-moz-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-file-upload-input:-ms-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-file-upload-input::-ms-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-file-upload-input::placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-file-upload-input:focus{
      -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-file-upload-input[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-file-upload-input:disabled, .bp3-dark .bp3-file-upload-input.bp3-disabled{
      background:rgba(57, 75, 89, 0.5);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-file-upload-input::after{
      background-color:#394b59;
      background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.05)), to(rgba(255, 255, 255, 0)));
      background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.05), rgba(255, 255, 255, 0));
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
      color:#f5f8fa; }
      .bp3-dark .bp3-file-upload-input::after:hover, .bp3-dark .bp3-file-upload-input::after:active, .bp3-dark .bp3-file-upload-input::after.bp3-active{
        color:#f5f8fa; }
      .bp3-dark .bp3-file-upload-input::after:hover{
        background-color:#30404d;
        -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
                box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
      .bp3-dark .bp3-file-upload-input::after:active, .bp3-dark .bp3-file-upload-input::after.bp3-active{
        background-color:#202b33;
        background-image:none;
        -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2);
                box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
      .bp3-dark .bp3-file-upload-input::after:disabled, .bp3-dark .bp3-file-upload-input::after.bp3-disabled{
        background-color:rgba(57, 75, 89, 0.5);
        background-image:none;
        -webkit-box-shadow:none;
                box-shadow:none;
        color:rgba(167, 182, 194, 0.6); }
        .bp3-dark .bp3-file-upload-input::after:disabled.bp3-active, .bp3-dark .bp3-file-upload-input::after.bp3-disabled.bp3-active{
          background:rgba(57, 75, 89, 0.7); }
      .bp3-dark .bp3-file-upload-input::after .bp3-button-spinner .bp3-spinner-head{
        background:rgba(16, 22, 26, 0.5);
        stroke:#8a9ba8; }
    .bp3-dark .bp3-file-upload-input:hover::after{
      background-color:#30404d;
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-file-upload-input:active::after{
      background-color:#202b33;
      background-image:none;
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
.bp3-file-upload-input::after{
  -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
          box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1); }
.bp3-form-group{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:vertical;
  -webkit-box-direction:normal;
      -ms-flex-direction:column;
          flex-direction:column;
  margin:0 0 15px; }
  .bp3-form-group label.bp3-label{
    margin-bottom:5px; }
  .bp3-form-group .bp3-control{
    margin-top:7px; }
  .bp3-form-group .bp3-form-helper-text{
    color:#5c7080;
    font-size:12px;
    margin-top:5px; }
  .bp3-form-group.bp3-intent-primary .bp3-form-helper-text{
    color:#106ba3; }
  .bp3-form-group.bp3-intent-success .bp3-form-helper-text{
    color:#0d8050; }
  .bp3-form-group.bp3-intent-warning .bp3-form-helper-text{
    color:#bf7326; }
  .bp3-form-group.bp3-intent-danger .bp3-form-helper-text{
    color:#c23030; }
  .bp3-form-group.bp3-inline{
    -webkit-box-align:start;
        -ms-flex-align:start;
            align-items:flex-start;
    -webkit-box-orient:horizontal;
    -webkit-box-direction:normal;
        -ms-flex-direction:row;
            flex-direction:row; }
    .bp3-form-group.bp3-inline.bp3-large label.bp3-label{
      line-height:40px;
      margin:0 10px 0 0; }
    .bp3-form-group.bp3-inline label.bp3-label{
      line-height:30px;
      margin:0 10px 0 0; }
  .bp3-form-group.bp3-disabled .bp3-label,
  .bp3-form-group.bp3-disabled .bp3-text-muted,
  .bp3-form-group.bp3-disabled .bp3-form-helper-text{
    color:rgba(92, 112, 128, 0.6) !important; }
  .bp3-dark .bp3-form-group.bp3-intent-primary .bp3-form-helper-text{
    color:#48aff0; }
  .bp3-dark .bp3-form-group.bp3-intent-success .bp3-form-helper-text{
    color:#3dcc91; }
  .bp3-dark .bp3-form-group.bp3-intent-warning .bp3-form-helper-text{
    color:#ffb366; }
  .bp3-dark .bp3-form-group.bp3-intent-danger .bp3-form-helper-text{
    color:#ff7373; }
  .bp3-dark .bp3-form-group .bp3-form-helper-text{
    color:#a7b6c2; }
  .bp3-dark .bp3-form-group.bp3-disabled .bp3-label,
  .bp3-dark .bp3-form-group.bp3-disabled .bp3-text-muted,
  .bp3-dark .bp3-form-group.bp3-disabled .bp3-form-helper-text{
    color:rgba(167, 182, 194, 0.6) !important; }
.bp3-input-group{
  display:block;
  position:relative; }
  .bp3-input-group .bp3-input{
    position:relative;
    width:100%; }
    .bp3-input-group .bp3-input:not(:first-child){
      padding-left:30px; }
    .bp3-input-group .bp3-input:not(:last-child){
      padding-right:30px; }
  .bp3-input-group .bp3-input-action,
  .bp3-input-group > .bp3-input-left-container,
  .bp3-input-group > .bp3-button,
  .bp3-input-group > .bp3-icon{
    position:absolute;
    top:0; }
    .bp3-input-group .bp3-input-action:first-child,
    .bp3-input-group > .bp3-input-left-container:first-child,
    .bp3-input-group > .bp3-button:first-child,
    .bp3-input-group > .bp3-icon:first-child{
      left:0; }
    .bp3-input-group .bp3-input-action:last-child,
    .bp3-input-group > .bp3-input-left-container:last-child,
    .bp3-input-group > .bp3-button:last-child,
    .bp3-input-group > .bp3-icon:last-child{
      right:0; }
  .bp3-input-group .bp3-button{
    min-height:24px;
    min-width:24px;
    margin:3px;
    padding:0 7px; }
    .bp3-input-group .bp3-button:empty{
      padding:0; }
  .bp3-input-group > .bp3-input-left-container,
  .bp3-input-group > .bp3-icon{
    z-index:1; }
  .bp3-input-group > .bp3-input-left-container > .bp3-icon,
  .bp3-input-group > .bp3-icon{
    color:#5c7080; }
    .bp3-input-group > .bp3-input-left-container > .bp3-icon:empty,
    .bp3-input-group > .bp3-icon:empty{
      font-family:"Icons16", sans-serif;
      font-size:16px;
      font-style:normal;
      font-weight:400;
      line-height:1;
      -moz-osx-font-smoothing:grayscale;
      -webkit-font-smoothing:antialiased; }
  .bp3-input-group > .bp3-input-left-container > .bp3-icon,
  .bp3-input-group > .bp3-icon,
  .bp3-input-group .bp3-input-action > .bp3-spinner{
    margin:7px; }
  .bp3-input-group .bp3-tag{
    margin:5px; }
  .bp3-input-group .bp3-input:not(:focus) + .bp3-button.bp3-minimal:not(:hover):not(:focus),
  .bp3-input-group .bp3-input:not(:focus) + .bp3-input-action .bp3-button.bp3-minimal:not(:hover):not(:focus){
    color:#5c7080; }
    .bp3-dark .bp3-input-group .bp3-input:not(:focus) + .bp3-button.bp3-minimal:not(:hover):not(:focus), .bp3-dark
    .bp3-input-group .bp3-input:not(:focus) + .bp3-input-action .bp3-button.bp3-minimal:not(:hover):not(:focus){
      color:#a7b6c2; }
    .bp3-input-group .bp3-input:not(:focus) + .bp3-button.bp3-minimal:not(:hover):not(:focus) .bp3-icon, .bp3-input-group .bp3-input:not(:focus) + .bp3-button.bp3-minimal:not(:hover):not(:focus) .bp3-icon-standard, .bp3-input-group .bp3-input:not(:focus) + .bp3-button.bp3-minimal:not(:hover):not(:focus) .bp3-icon-large,
    .bp3-input-group .bp3-input:not(:focus) + .bp3-input-action .bp3-button.bp3-minimal:not(:hover):not(:focus) .bp3-icon,
    .bp3-input-group .bp3-input:not(:focus) + .bp3-input-action .bp3-button.bp3-minimal:not(:hover):not(:focus) .bp3-icon-standard,
    .bp3-input-group .bp3-input:not(:focus) + .bp3-input-action .bp3-button.bp3-minimal:not(:hover):not(:focus) .bp3-icon-large{
      color:#5c7080; }
  .bp3-input-group .bp3-input:not(:focus) + .bp3-button.bp3-minimal:disabled,
  .bp3-input-group .bp3-input:not(:focus) + .bp3-input-action .bp3-button.bp3-minimal:disabled{
    color:rgba(92, 112, 128, 0.6) !important; }
    .bp3-input-group .bp3-input:not(:focus) + .bp3-button.bp3-minimal:disabled .bp3-icon, .bp3-input-group .bp3-input:not(:focus) + .bp3-button.bp3-minimal:disabled .bp3-icon-standard, .bp3-input-group .bp3-input:not(:focus) + .bp3-button.bp3-minimal:disabled .bp3-icon-large,
    .bp3-input-group .bp3-input:not(:focus) + .bp3-input-action .bp3-button.bp3-minimal:disabled .bp3-icon,
    .bp3-input-group .bp3-input:not(:focus) + .bp3-input-action .bp3-button.bp3-minimal:disabled .bp3-icon-standard,
    .bp3-input-group .bp3-input:not(:focus) + .bp3-input-action .bp3-button.bp3-minimal:disabled .bp3-icon-large{
      color:rgba(92, 112, 128, 0.6) !important; }
  .bp3-input-group.bp3-disabled{
    cursor:not-allowed; }
    .bp3-input-group.bp3-disabled .bp3-icon{
      color:rgba(92, 112, 128, 0.6); }
  .bp3-input-group.bp3-large .bp3-button{
    min-height:30px;
    min-width:30px;
    margin:5px; }
  .bp3-input-group.bp3-large > .bp3-input-left-container > .bp3-icon,
  .bp3-input-group.bp3-large > .bp3-icon,
  .bp3-input-group.bp3-large .bp3-input-action > .bp3-spinner{
    margin:12px; }
  .bp3-input-group.bp3-large .bp3-input{
    font-size:16px;
    height:40px;
    line-height:40px; }
    .bp3-input-group.bp3-large .bp3-input[type="search"], .bp3-input-group.bp3-large .bp3-input.bp3-round{
      padding:0 15px; }
    .bp3-input-group.bp3-large .bp3-input:not(:first-child){
      padding-left:40px; }
    .bp3-input-group.bp3-large .bp3-input:not(:last-child){
      padding-right:40px; }
  .bp3-input-group.bp3-small .bp3-button{
    min-height:20px;
    min-width:20px;
    margin:2px; }
  .bp3-input-group.bp3-small .bp3-tag{
    min-height:20px;
    min-width:20px;
    margin:2px; }
  .bp3-input-group.bp3-small > .bp3-input-left-container > .bp3-icon,
  .bp3-input-group.bp3-small > .bp3-icon,
  .bp3-input-group.bp3-small .bp3-input-action > .bp3-spinner{
    margin:4px; }
  .bp3-input-group.bp3-small .bp3-input{
    font-size:12px;
    height:24px;
    line-height:24px;
    padding-left:8px;
    padding-right:8px; }
    .bp3-input-group.bp3-small .bp3-input[type="search"], .bp3-input-group.bp3-small .bp3-input.bp3-round{
      padding:0 12px; }
    .bp3-input-group.bp3-small .bp3-input:not(:first-child){
      padding-left:24px; }
    .bp3-input-group.bp3-small .bp3-input:not(:last-child){
      padding-right:24px; }
  .bp3-input-group.bp3-fill{
    -webkit-box-flex:1;
        -ms-flex:1 1 auto;
            flex:1 1 auto;
    width:100%; }
  .bp3-input-group.bp3-round .bp3-button,
  .bp3-input-group.bp3-round .bp3-input,
  .bp3-input-group.bp3-round .bp3-tag{
    border-radius:30px; }
  .bp3-dark .bp3-input-group .bp3-icon{
    color:#a7b6c2; }
  .bp3-dark .bp3-input-group.bp3-disabled .bp3-icon{
    color:rgba(167, 182, 194, 0.6); }
  .bp3-input-group.bp3-intent-primary .bp3-input{
    -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px #137cbd, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px #137cbd, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input-group.bp3-intent-primary .bp3-input:focus{
      -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input-group.bp3-intent-primary .bp3-input[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px #137cbd;
              box-shadow:inset 0 0 0 1px #137cbd; }
    .bp3-input-group.bp3-intent-primary .bp3-input:disabled, .bp3-input-group.bp3-intent-primary .bp3-input.bp3-disabled{
      -webkit-box-shadow:none;
              box-shadow:none; }
  .bp3-input-group.bp3-intent-primary > .bp3-icon{
    color:#106ba3; }
    .bp3-dark .bp3-input-group.bp3-intent-primary > .bp3-icon{
      color:#48aff0; }
  .bp3-input-group.bp3-intent-success .bp3-input{
    -webkit-box-shadow:0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), inset 0 0 0 1px #0f9960, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), inset 0 0 0 1px #0f9960, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input-group.bp3-intent-success .bp3-input:focus{
      -webkit-box-shadow:0 0 0 1px #0f9960, 0 0 0 3px rgba(15, 153, 96, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #0f9960, 0 0 0 3px rgba(15, 153, 96, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input-group.bp3-intent-success .bp3-input[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px #0f9960;
              box-shadow:inset 0 0 0 1px #0f9960; }
    .bp3-input-group.bp3-intent-success .bp3-input:disabled, .bp3-input-group.bp3-intent-success .bp3-input.bp3-disabled{
      -webkit-box-shadow:none;
              box-shadow:none; }
  .bp3-input-group.bp3-intent-success > .bp3-icon{
    color:#0d8050; }
    .bp3-dark .bp3-input-group.bp3-intent-success > .bp3-icon{
      color:#3dcc91; }
  .bp3-input-group.bp3-intent-warning .bp3-input{
    -webkit-box-shadow:0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), inset 0 0 0 1px #d9822b, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), inset 0 0 0 1px #d9822b, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input-group.bp3-intent-warning .bp3-input:focus{
      -webkit-box-shadow:0 0 0 1px #d9822b, 0 0 0 3px rgba(217, 130, 43, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #d9822b, 0 0 0 3px rgba(217, 130, 43, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input-group.bp3-intent-warning .bp3-input[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px #d9822b;
              box-shadow:inset 0 0 0 1px #d9822b; }
    .bp3-input-group.bp3-intent-warning .bp3-input:disabled, .bp3-input-group.bp3-intent-warning .bp3-input.bp3-disabled{
      -webkit-box-shadow:none;
              box-shadow:none; }
  .bp3-input-group.bp3-intent-warning > .bp3-icon{
    color:#bf7326; }
    .bp3-dark .bp3-input-group.bp3-intent-warning > .bp3-icon{
      color:#ffb366; }
  .bp3-input-group.bp3-intent-danger .bp3-input{
    -webkit-box-shadow:0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), inset 0 0 0 1px #db3737, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), inset 0 0 0 1px #db3737, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input-group.bp3-intent-danger .bp3-input:focus{
      -webkit-box-shadow:0 0 0 1px #db3737, 0 0 0 3px rgba(219, 55, 55, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #db3737, 0 0 0 3px rgba(219, 55, 55, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input-group.bp3-intent-danger .bp3-input[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px #db3737;
              box-shadow:inset 0 0 0 1px #db3737; }
    .bp3-input-group.bp3-intent-danger .bp3-input:disabled, .bp3-input-group.bp3-intent-danger .bp3-input.bp3-disabled{
      -webkit-box-shadow:none;
              box-shadow:none; }
  .bp3-input-group.bp3-intent-danger > .bp3-icon{
    color:#c23030; }
    .bp3-dark .bp3-input-group.bp3-intent-danger > .bp3-icon{
      color:#ff7373; }
.bp3-input{
  -webkit-appearance:none;
     -moz-appearance:none;
          appearance:none;
  background:#ffffff;
  border:none;
  border-radius:3px;
  -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
  color:#182026;
  font-size:14px;
  font-weight:400;
  height:30px;
  line-height:30px;
  outline:none;
  padding:0 10px;
  -webkit-transition:-webkit-box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:-webkit-box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-box-shadow 100ms cubic-bezier(0.4, 1, 0.75, 0.9);
  vertical-align:middle; }
  .bp3-input::-webkit-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input::-moz-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input:-ms-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input::-ms-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input::placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input:focus, .bp3-input.bp3-active{
    -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
  .bp3-input[type="search"], .bp3-input.bp3-round{
    border-radius:30px;
    -webkit-box-sizing:border-box;
            box-sizing:border-box;
    padding-left:10px; }
  .bp3-input[readonly]{
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.15);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.15); }
  .bp3-input:disabled, .bp3-input.bp3-disabled{
    background:rgba(206, 217, 224, 0.5);
    -webkit-box-shadow:none;
            box-shadow:none;
    color:rgba(92, 112, 128, 0.6);
    cursor:not-allowed;
    resize:none; }
  .bp3-input.bp3-large{
    font-size:16px;
    height:40px;
    line-height:40px; }
    .bp3-input.bp3-large[type="search"], .bp3-input.bp3-large.bp3-round{
      padding:0 15px; }
  .bp3-input.bp3-small{
    font-size:12px;
    height:24px;
    line-height:24px;
    padding-left:8px;
    padding-right:8px; }
    .bp3-input.bp3-small[type="search"], .bp3-input.bp3-small.bp3-round{
      padding:0 12px; }
  .bp3-input.bp3-fill{
    -webkit-box-flex:1;
        -ms-flex:1 1 auto;
            flex:1 1 auto;
    width:100%; }
  .bp3-dark .bp3-input{
    background:rgba(16, 22, 26, 0.3);
    -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
    color:#f5f8fa; }
    .bp3-dark .bp3-input::-webkit-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-input::-moz-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-input:-ms-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-input::-ms-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-input::placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-input:focus{
      -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-input[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-input:disabled, .bp3-dark .bp3-input.bp3-disabled{
      background:rgba(57, 75, 89, 0.5);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(167, 182, 194, 0.6); }
  .bp3-input.bp3-intent-primary{
    -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px #137cbd, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px #137cbd, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input.bp3-intent-primary:focus{
      -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input.bp3-intent-primary[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px #137cbd;
              box-shadow:inset 0 0 0 1px #137cbd; }
    .bp3-input.bp3-intent-primary:disabled, .bp3-input.bp3-intent-primary.bp3-disabled{
      -webkit-box-shadow:none;
              box-shadow:none; }
    .bp3-dark .bp3-input.bp3-intent-primary{
      -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px #137cbd, inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px #137cbd, inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
      .bp3-dark .bp3-input.bp3-intent-primary:focus{
        -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
                box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
      .bp3-dark .bp3-input.bp3-intent-primary[readonly]{
        -webkit-box-shadow:inset 0 0 0 1px #137cbd;
                box-shadow:inset 0 0 0 1px #137cbd; }
      .bp3-dark .bp3-input.bp3-intent-primary:disabled, .bp3-dark .bp3-input.bp3-intent-primary.bp3-disabled{
        -webkit-box-shadow:none;
                box-shadow:none; }
  .bp3-input.bp3-intent-success{
    -webkit-box-shadow:0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), inset 0 0 0 1px #0f9960, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), inset 0 0 0 1px #0f9960, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input.bp3-intent-success:focus{
      -webkit-box-shadow:0 0 0 1px #0f9960, 0 0 0 3px rgba(15, 153, 96, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #0f9960, 0 0 0 3px rgba(15, 153, 96, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input.bp3-intent-success[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px #0f9960;
              box-shadow:inset 0 0 0 1px #0f9960; }
    .bp3-input.bp3-intent-success:disabled, .bp3-input.bp3-intent-success.bp3-disabled{
      -webkit-box-shadow:none;
              box-shadow:none; }
    .bp3-dark .bp3-input.bp3-intent-success{
      -webkit-box-shadow:0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), inset 0 0 0 1px #0f9960, inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), 0 0 0 0 rgba(15, 153, 96, 0), inset 0 0 0 1px #0f9960, inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
      .bp3-dark .bp3-input.bp3-intent-success:focus{
        -webkit-box-shadow:0 0 0 1px #0f9960, 0 0 0 1px #0f9960, 0 0 0 3px rgba(15, 153, 96, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
                box-shadow:0 0 0 1px #0f9960, 0 0 0 1px #0f9960, 0 0 0 3px rgba(15, 153, 96, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
      .bp3-dark .bp3-input.bp3-intent-success[readonly]{
        -webkit-box-shadow:inset 0 0 0 1px #0f9960;
                box-shadow:inset 0 0 0 1px #0f9960; }
      .bp3-dark .bp3-input.bp3-intent-success:disabled, .bp3-dark .bp3-input.bp3-intent-success.bp3-disabled{
        -webkit-box-shadow:none;
                box-shadow:none; }
  .bp3-input.bp3-intent-warning{
    -webkit-box-shadow:0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), inset 0 0 0 1px #d9822b, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), inset 0 0 0 1px #d9822b, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input.bp3-intent-warning:focus{
      -webkit-box-shadow:0 0 0 1px #d9822b, 0 0 0 3px rgba(217, 130, 43, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #d9822b, 0 0 0 3px rgba(217, 130, 43, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input.bp3-intent-warning[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px #d9822b;
              box-shadow:inset 0 0 0 1px #d9822b; }
    .bp3-input.bp3-intent-warning:disabled, .bp3-input.bp3-intent-warning.bp3-disabled{
      -webkit-box-shadow:none;
              box-shadow:none; }
    .bp3-dark .bp3-input.bp3-intent-warning{
      -webkit-box-shadow:0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), inset 0 0 0 1px #d9822b, inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), 0 0 0 0 rgba(217, 130, 43, 0), inset 0 0 0 1px #d9822b, inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
      .bp3-dark .bp3-input.bp3-intent-warning:focus{
        -webkit-box-shadow:0 0 0 1px #d9822b, 0 0 0 1px #d9822b, 0 0 0 3px rgba(217, 130, 43, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
                box-shadow:0 0 0 1px #d9822b, 0 0 0 1px #d9822b, 0 0 0 3px rgba(217, 130, 43, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
      .bp3-dark .bp3-input.bp3-intent-warning[readonly]{
        -webkit-box-shadow:inset 0 0 0 1px #d9822b;
                box-shadow:inset 0 0 0 1px #d9822b; }
      .bp3-dark .bp3-input.bp3-intent-warning:disabled, .bp3-dark .bp3-input.bp3-intent-warning.bp3-disabled{
        -webkit-box-shadow:none;
                box-shadow:none; }
  .bp3-input.bp3-intent-danger{
    -webkit-box-shadow:0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), inset 0 0 0 1px #db3737, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), inset 0 0 0 1px #db3737, inset 0 0 0 1px rgba(16, 22, 26, 0.15), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input.bp3-intent-danger:focus{
      -webkit-box-shadow:0 0 0 1px #db3737, 0 0 0 3px rgba(219, 55, 55, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #db3737, 0 0 0 3px rgba(219, 55, 55, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-input.bp3-intent-danger[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px #db3737;
              box-shadow:inset 0 0 0 1px #db3737; }
    .bp3-input.bp3-intent-danger:disabled, .bp3-input.bp3-intent-danger.bp3-disabled{
      -webkit-box-shadow:none;
              box-shadow:none; }
    .bp3-dark .bp3-input.bp3-intent-danger{
      -webkit-box-shadow:0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), inset 0 0 0 1px #db3737, inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), 0 0 0 0 rgba(219, 55, 55, 0), inset 0 0 0 1px #db3737, inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
      .bp3-dark .bp3-input.bp3-intent-danger:focus{
        -webkit-box-shadow:0 0 0 1px #db3737, 0 0 0 1px #db3737, 0 0 0 3px rgba(219, 55, 55, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
                box-shadow:0 0 0 1px #db3737, 0 0 0 1px #db3737, 0 0 0 3px rgba(219, 55, 55, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
      .bp3-dark .bp3-input.bp3-intent-danger[readonly]{
        -webkit-box-shadow:inset 0 0 0 1px #db3737;
                box-shadow:inset 0 0 0 1px #db3737; }
      .bp3-dark .bp3-input.bp3-intent-danger:disabled, .bp3-dark .bp3-input.bp3-intent-danger.bp3-disabled{
        -webkit-box-shadow:none;
                box-shadow:none; }
  .bp3-input::-ms-clear{
    display:none; }
textarea.bp3-input{
  max-width:100%;
  padding:10px; }
  textarea.bp3-input, textarea.bp3-input.bp3-large, textarea.bp3-input.bp3-small{
    height:auto;
    line-height:inherit; }
  textarea.bp3-input.bp3-small{
    padding:8px; }
  .bp3-dark textarea.bp3-input{
    background:rgba(16, 22, 26, 0.3);
    -webkit-box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), 0 0 0 0 rgba(19, 124, 189, 0), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
    color:#f5f8fa; }
    .bp3-dark textarea.bp3-input::-webkit-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark textarea.bp3-input::-moz-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark textarea.bp3-input:-ms-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark textarea.bp3-input::-ms-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark textarea.bp3-input::placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark textarea.bp3-input:focus{
      -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark textarea.bp3-input[readonly]{
      -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4);
              box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark textarea.bp3-input:disabled, .bp3-dark textarea.bp3-input.bp3-disabled{
      background:rgba(57, 75, 89, 0.5);
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(167, 182, 194, 0.6); }
label.bp3-label{
  display:block;
  margin-bottom:15px;
  margin-top:0; }
  label.bp3-label .bp3-html-select,
  label.bp3-label .bp3-input,
  label.bp3-label .bp3-select,
  label.bp3-label .bp3-slider,
  label.bp3-label .bp3-popover-wrapper{
    display:block;
    margin-top:5px;
    text-transform:none; }
  label.bp3-label .bp3-button-group{
    margin-top:5px; }
  label.bp3-label .bp3-select select,
  label.bp3-label .bp3-html-select select{
    font-weight:400;
    vertical-align:top;
    width:100%; }
  label.bp3-label.bp3-disabled,
  label.bp3-label.bp3-disabled .bp3-text-muted{
    color:rgba(92, 112, 128, 0.6); }
  label.bp3-label.bp3-inline{
    line-height:30px; }
    label.bp3-label.bp3-inline .bp3-html-select,
    label.bp3-label.bp3-inline .bp3-input,
    label.bp3-label.bp3-inline .bp3-input-group,
    label.bp3-label.bp3-inline .bp3-select,
    label.bp3-label.bp3-inline .bp3-popover-wrapper{
      display:inline-block;
      margin:0 0 0 5px;
      vertical-align:top; }
    label.bp3-label.bp3-inline .bp3-button-group{
      margin:0 0 0 5px; }
    label.bp3-label.bp3-inline .bp3-input-group .bp3-input{
      margin-left:0; }
    label.bp3-label.bp3-inline.bp3-large{
      line-height:40px; }
  label.bp3-label:not(.bp3-inline) .bp3-popover-target{
    display:block; }
  .bp3-dark label.bp3-label{
    color:#f5f8fa; }
    .bp3-dark label.bp3-label.bp3-disabled,
    .bp3-dark label.bp3-label.bp3-disabled .bp3-text-muted{
      color:rgba(167, 182, 194, 0.6); }
.bp3-numeric-input .bp3-button-group.bp3-vertical > .bp3-button{
  -webkit-box-flex:1;
      -ms-flex:1 1 14px;
          flex:1 1 14px;
  min-height:0;
  padding:0;
  width:30px; }
  .bp3-numeric-input .bp3-button-group.bp3-vertical > .bp3-button:first-child{
    border-radius:0 3px 0 0; }
  .bp3-numeric-input .bp3-button-group.bp3-vertical > .bp3-button:last-child{
    border-radius:0 0 3px 0; }

.bp3-numeric-input .bp3-button-group.bp3-vertical:first-child > .bp3-button:first-child{
  border-radius:3px 0 0 0; }

.bp3-numeric-input .bp3-button-group.bp3-vertical:first-child > .bp3-button:last-child{
  border-radius:0 0 0 3px; }

.bp3-numeric-input.bp3-large .bp3-button-group.bp3-vertical > .bp3-button{
  width:40px; }

form{
  display:block; }
.bp3-html-select select,
.bp3-select select{
  display:-webkit-inline-box;
  display:-ms-inline-flexbox;
  display:inline-flex;
  -webkit-box-orient:horizontal;
  -webkit-box-direction:normal;
      -ms-flex-direction:row;
          flex-direction:row;
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  border:none;
  border-radius:3px;
  cursor:pointer;
  font-size:14px;
  -webkit-box-pack:center;
      -ms-flex-pack:center;
          justify-content:center;
  padding:5px 10px;
  text-align:left;
  vertical-align:middle;
  background-color:#f5f8fa;
  background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.8)), to(rgba(255, 255, 255, 0)));
  background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.8), rgba(255, 255, 255, 0));
  -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
          box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
  color:#182026;
  -moz-appearance:none;
  -webkit-appearance:none;
  border-radius:3px;
  height:30px;
  padding:0 25px 0 10px;
  width:100%; }
  .bp3-html-select select > *, .bp3-select select > *{
    -webkit-box-flex:0;
        -ms-flex-positive:0;
            flex-grow:0;
    -ms-flex-negative:0;
        flex-shrink:0; }
  .bp3-html-select select > .bp3-fill, .bp3-select select > .bp3-fill{
    -webkit-box-flex:1;
        -ms-flex-positive:1;
            flex-grow:1;
    -ms-flex-negative:1;
        flex-shrink:1; }
  .bp3-html-select select::before,
  .bp3-select select::before, .bp3-html-select select > *, .bp3-select select > *{
    margin-right:7px; }
  .bp3-html-select select:empty::before,
  .bp3-select select:empty::before,
  .bp3-html-select select > :last-child,
  .bp3-select select > :last-child{
    margin-right:0; }
  .bp3-html-select select:hover,
  .bp3-select select:hover{
    background-clip:padding-box;
    background-color:#ebf1f5;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1); }
  .bp3-html-select select:active,
  .bp3-select select:active, .bp3-html-select select.bp3-active,
  .bp3-select select.bp3-active{
    background-color:#d8e1e8;
    background-image:none;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
  .bp3-html-select select:disabled,
  .bp3-select select:disabled, .bp3-html-select select.bp3-disabled,
  .bp3-select select.bp3-disabled{
    background-color:rgba(206, 217, 224, 0.5);
    background-image:none;
    -webkit-box-shadow:none;
            box-shadow:none;
    color:rgba(92, 112, 128, 0.6);
    cursor:not-allowed;
    outline:none; }
    .bp3-html-select select:disabled.bp3-active,
    .bp3-select select:disabled.bp3-active, .bp3-html-select select:disabled.bp3-active:hover,
    .bp3-select select:disabled.bp3-active:hover, .bp3-html-select select.bp3-disabled.bp3-active,
    .bp3-select select.bp3-disabled.bp3-active, .bp3-html-select select.bp3-disabled.bp3-active:hover,
    .bp3-select select.bp3-disabled.bp3-active:hover{
      background:rgba(206, 217, 224, 0.7); }

.bp3-html-select.bp3-minimal select,
.bp3-select.bp3-minimal select{
  background:none;
  -webkit-box-shadow:none;
          box-shadow:none; }
  .bp3-html-select.bp3-minimal select:hover,
  .bp3-select.bp3-minimal select:hover{
    background:rgba(167, 182, 194, 0.3);
    -webkit-box-shadow:none;
            box-shadow:none;
    color:#182026;
    text-decoration:none; }
  .bp3-html-select.bp3-minimal select:active,
  .bp3-select.bp3-minimal select:active, .bp3-html-select.bp3-minimal select.bp3-active,
  .bp3-select.bp3-minimal select.bp3-active{
    background:rgba(115, 134, 148, 0.3);
    -webkit-box-shadow:none;
            box-shadow:none;
    color:#182026; }
  .bp3-html-select.bp3-minimal select:disabled,
  .bp3-select.bp3-minimal select:disabled, .bp3-html-select.bp3-minimal select:disabled:hover,
  .bp3-select.bp3-minimal select:disabled:hover, .bp3-html-select.bp3-minimal select.bp3-disabled,
  .bp3-select.bp3-minimal select.bp3-disabled, .bp3-html-select.bp3-minimal select.bp3-disabled:hover,
  .bp3-select.bp3-minimal select.bp3-disabled:hover{
    background:none;
    color:rgba(92, 112, 128, 0.6);
    cursor:not-allowed; }
    .bp3-html-select.bp3-minimal select:disabled.bp3-active,
    .bp3-select.bp3-minimal select:disabled.bp3-active, .bp3-html-select.bp3-minimal select:disabled:hover.bp3-active,
    .bp3-select.bp3-minimal select:disabled:hover.bp3-active, .bp3-html-select.bp3-minimal select.bp3-disabled.bp3-active,
    .bp3-select.bp3-minimal select.bp3-disabled.bp3-active, .bp3-html-select.bp3-minimal select.bp3-disabled:hover.bp3-active,
    .bp3-select.bp3-minimal select.bp3-disabled:hover.bp3-active{
      background:rgba(115, 134, 148, 0.3); }
  .bp3-dark .bp3-html-select.bp3-minimal select, .bp3-html-select.bp3-minimal .bp3-dark select,
  .bp3-dark .bp3-select.bp3-minimal select, .bp3-select.bp3-minimal .bp3-dark select{
    background:none;
    -webkit-box-shadow:none;
            box-shadow:none;
    color:inherit; }
    .bp3-dark .bp3-html-select.bp3-minimal select:hover, .bp3-html-select.bp3-minimal .bp3-dark select:hover,
    .bp3-dark .bp3-select.bp3-minimal select:hover, .bp3-select.bp3-minimal .bp3-dark select:hover, .bp3-dark .bp3-html-select.bp3-minimal select:active, .bp3-html-select.bp3-minimal .bp3-dark select:active,
    .bp3-dark .bp3-select.bp3-minimal select:active, .bp3-select.bp3-minimal .bp3-dark select:active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-active,
    .bp3-dark .bp3-select.bp3-minimal select.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-active{
      background:none;
      -webkit-box-shadow:none;
              box-shadow:none; }
    .bp3-dark .bp3-html-select.bp3-minimal select:hover, .bp3-html-select.bp3-minimal .bp3-dark select:hover,
    .bp3-dark .bp3-select.bp3-minimal select:hover, .bp3-select.bp3-minimal .bp3-dark select:hover{
      background:rgba(138, 155, 168, 0.15); }
    .bp3-dark .bp3-html-select.bp3-minimal select:active, .bp3-html-select.bp3-minimal .bp3-dark select:active,
    .bp3-dark .bp3-select.bp3-minimal select:active, .bp3-select.bp3-minimal .bp3-dark select:active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-active,
    .bp3-dark .bp3-select.bp3-minimal select.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-active{
      background:rgba(138, 155, 168, 0.3);
      color:#f5f8fa; }
    .bp3-dark .bp3-html-select.bp3-minimal select:disabled, .bp3-html-select.bp3-minimal .bp3-dark select:disabled,
    .bp3-dark .bp3-select.bp3-minimal select:disabled, .bp3-select.bp3-minimal .bp3-dark select:disabled, .bp3-dark .bp3-html-select.bp3-minimal select:disabled:hover, .bp3-html-select.bp3-minimal .bp3-dark select:disabled:hover,
    .bp3-dark .bp3-select.bp3-minimal select:disabled:hover, .bp3-select.bp3-minimal .bp3-dark select:disabled:hover, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-disabled, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-disabled,
    .bp3-dark .bp3-select.bp3-minimal select.bp3-disabled, .bp3-select.bp3-minimal .bp3-dark select.bp3-disabled, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-disabled:hover, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-disabled:hover,
    .bp3-dark .bp3-select.bp3-minimal select.bp3-disabled:hover, .bp3-select.bp3-minimal .bp3-dark select.bp3-disabled:hover{
      background:none;
      color:rgba(167, 182, 194, 0.6);
      cursor:not-allowed; }
      .bp3-dark .bp3-html-select.bp3-minimal select:disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select:disabled.bp3-active,
      .bp3-dark .bp3-select.bp3-minimal select:disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select:disabled.bp3-active, .bp3-dark .bp3-html-select.bp3-minimal select:disabled:hover.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select:disabled:hover.bp3-active,
      .bp3-dark .bp3-select.bp3-minimal select:disabled:hover.bp3-active, .bp3-select.bp3-minimal .bp3-dark select:disabled:hover.bp3-active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-disabled.bp3-active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-disabled.bp3-active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-disabled:hover.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-disabled:hover.bp3-active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-disabled:hover.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-disabled:hover.bp3-active{
        background:rgba(138, 155, 168, 0.3); }
  .bp3-html-select.bp3-minimal select.bp3-intent-primary,
  .bp3-select.bp3-minimal select.bp3-intent-primary{
    color:#106ba3; }
    .bp3-html-select.bp3-minimal select.bp3-intent-primary:hover,
    .bp3-select.bp3-minimal select.bp3-intent-primary:hover, .bp3-html-select.bp3-minimal select.bp3-intent-primary:active,
    .bp3-select.bp3-minimal select.bp3-intent-primary:active, .bp3-html-select.bp3-minimal select.bp3-intent-primary.bp3-active,
    .bp3-select.bp3-minimal select.bp3-intent-primary.bp3-active{
      background:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#106ba3; }
    .bp3-html-select.bp3-minimal select.bp3-intent-primary:hover,
    .bp3-select.bp3-minimal select.bp3-intent-primary:hover{
      background:rgba(19, 124, 189, 0.15);
      color:#106ba3; }
    .bp3-html-select.bp3-minimal select.bp3-intent-primary:active,
    .bp3-select.bp3-minimal select.bp3-intent-primary:active, .bp3-html-select.bp3-minimal select.bp3-intent-primary.bp3-active,
    .bp3-select.bp3-minimal select.bp3-intent-primary.bp3-active{
      background:rgba(19, 124, 189, 0.3);
      color:#106ba3; }
    .bp3-html-select.bp3-minimal select.bp3-intent-primary:disabled,
    .bp3-select.bp3-minimal select.bp3-intent-primary:disabled, .bp3-html-select.bp3-minimal select.bp3-intent-primary.bp3-disabled,
    .bp3-select.bp3-minimal select.bp3-intent-primary.bp3-disabled{
      background:none;
      color:rgba(16, 107, 163, 0.5); }
      .bp3-html-select.bp3-minimal select.bp3-intent-primary:disabled.bp3-active,
      .bp3-select.bp3-minimal select.bp3-intent-primary:disabled.bp3-active, .bp3-html-select.bp3-minimal select.bp3-intent-primary.bp3-disabled.bp3-active,
      .bp3-select.bp3-minimal select.bp3-intent-primary.bp3-disabled.bp3-active{
        background:rgba(19, 124, 189, 0.3); }
    .bp3-html-select.bp3-minimal select.bp3-intent-primary .bp3-button-spinner .bp3-spinner-head, .bp3-select.bp3-minimal select.bp3-intent-primary .bp3-button-spinner .bp3-spinner-head{
      stroke:#106ba3; }
    .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-primary, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-primary,
    .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-primary, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-primary{
      color:#48aff0; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-primary:hover, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-primary:hover,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-primary:hover, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-primary:hover{
        background:rgba(19, 124, 189, 0.2);
        color:#48aff0; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-primary:active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-primary:active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-primary:active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-primary:active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-primary.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-primary.bp3-active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-primary.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-primary.bp3-active{
        background:rgba(19, 124, 189, 0.3);
        color:#48aff0; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-primary:disabled, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-primary:disabled,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-primary:disabled, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-primary:disabled, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-primary.bp3-disabled, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-primary.bp3-disabled,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-primary.bp3-disabled, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-primary.bp3-disabled{
        background:none;
        color:rgba(72, 175, 240, 0.5); }
        .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-primary:disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-primary:disabled.bp3-active,
        .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-primary:disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-primary:disabled.bp3-active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-primary.bp3-disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-primary.bp3-disabled.bp3-active,
        .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-primary.bp3-disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-primary.bp3-disabled.bp3-active{
          background:rgba(19, 124, 189, 0.3); }
  .bp3-html-select.bp3-minimal select.bp3-intent-success,
  .bp3-select.bp3-minimal select.bp3-intent-success{
    color:#0d8050; }
    .bp3-html-select.bp3-minimal select.bp3-intent-success:hover,
    .bp3-select.bp3-minimal select.bp3-intent-success:hover, .bp3-html-select.bp3-minimal select.bp3-intent-success:active,
    .bp3-select.bp3-minimal select.bp3-intent-success:active, .bp3-html-select.bp3-minimal select.bp3-intent-success.bp3-active,
    .bp3-select.bp3-minimal select.bp3-intent-success.bp3-active{
      background:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#0d8050; }
    .bp3-html-select.bp3-minimal select.bp3-intent-success:hover,
    .bp3-select.bp3-minimal select.bp3-intent-success:hover{
      background:rgba(15, 153, 96, 0.15);
      color:#0d8050; }
    .bp3-html-select.bp3-minimal select.bp3-intent-success:active,
    .bp3-select.bp3-minimal select.bp3-intent-success:active, .bp3-html-select.bp3-minimal select.bp3-intent-success.bp3-active,
    .bp3-select.bp3-minimal select.bp3-intent-success.bp3-active{
      background:rgba(15, 153, 96, 0.3);
      color:#0d8050; }
    .bp3-html-select.bp3-minimal select.bp3-intent-success:disabled,
    .bp3-select.bp3-minimal select.bp3-intent-success:disabled, .bp3-html-select.bp3-minimal select.bp3-intent-success.bp3-disabled,
    .bp3-select.bp3-minimal select.bp3-intent-success.bp3-disabled{
      background:none;
      color:rgba(13, 128, 80, 0.5); }
      .bp3-html-select.bp3-minimal select.bp3-intent-success:disabled.bp3-active,
      .bp3-select.bp3-minimal select.bp3-intent-success:disabled.bp3-active, .bp3-html-select.bp3-minimal select.bp3-intent-success.bp3-disabled.bp3-active,
      .bp3-select.bp3-minimal select.bp3-intent-success.bp3-disabled.bp3-active{
        background:rgba(15, 153, 96, 0.3); }
    .bp3-html-select.bp3-minimal select.bp3-intent-success .bp3-button-spinner .bp3-spinner-head, .bp3-select.bp3-minimal select.bp3-intent-success .bp3-button-spinner .bp3-spinner-head{
      stroke:#0d8050; }
    .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-success, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-success,
    .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-success, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-success{
      color:#3dcc91; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-success:hover, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-success:hover,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-success:hover, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-success:hover{
        background:rgba(15, 153, 96, 0.2);
        color:#3dcc91; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-success:active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-success:active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-success:active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-success:active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-success.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-success.bp3-active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-success.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-success.bp3-active{
        background:rgba(15, 153, 96, 0.3);
        color:#3dcc91; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-success:disabled, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-success:disabled,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-success:disabled, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-success:disabled, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-success.bp3-disabled, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-success.bp3-disabled,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-success.bp3-disabled, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-success.bp3-disabled{
        background:none;
        color:rgba(61, 204, 145, 0.5); }
        .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-success:disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-success:disabled.bp3-active,
        .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-success:disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-success:disabled.bp3-active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-success.bp3-disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-success.bp3-disabled.bp3-active,
        .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-success.bp3-disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-success.bp3-disabled.bp3-active{
          background:rgba(15, 153, 96, 0.3); }
  .bp3-html-select.bp3-minimal select.bp3-intent-warning,
  .bp3-select.bp3-minimal select.bp3-intent-warning{
    color:#bf7326; }
    .bp3-html-select.bp3-minimal select.bp3-intent-warning:hover,
    .bp3-select.bp3-minimal select.bp3-intent-warning:hover, .bp3-html-select.bp3-minimal select.bp3-intent-warning:active,
    .bp3-select.bp3-minimal select.bp3-intent-warning:active, .bp3-html-select.bp3-minimal select.bp3-intent-warning.bp3-active,
    .bp3-select.bp3-minimal select.bp3-intent-warning.bp3-active{
      background:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#bf7326; }
    .bp3-html-select.bp3-minimal select.bp3-intent-warning:hover,
    .bp3-select.bp3-minimal select.bp3-intent-warning:hover{
      background:rgba(217, 130, 43, 0.15);
      color:#bf7326; }
    .bp3-html-select.bp3-minimal select.bp3-intent-warning:active,
    .bp3-select.bp3-minimal select.bp3-intent-warning:active, .bp3-html-select.bp3-minimal select.bp3-intent-warning.bp3-active,
    .bp3-select.bp3-minimal select.bp3-intent-warning.bp3-active{
      background:rgba(217, 130, 43, 0.3);
      color:#bf7326; }
    .bp3-html-select.bp3-minimal select.bp3-intent-warning:disabled,
    .bp3-select.bp3-minimal select.bp3-intent-warning:disabled, .bp3-html-select.bp3-minimal select.bp3-intent-warning.bp3-disabled,
    .bp3-select.bp3-minimal select.bp3-intent-warning.bp3-disabled{
      background:none;
      color:rgba(191, 115, 38, 0.5); }
      .bp3-html-select.bp3-minimal select.bp3-intent-warning:disabled.bp3-active,
      .bp3-select.bp3-minimal select.bp3-intent-warning:disabled.bp3-active, .bp3-html-select.bp3-minimal select.bp3-intent-warning.bp3-disabled.bp3-active,
      .bp3-select.bp3-minimal select.bp3-intent-warning.bp3-disabled.bp3-active{
        background:rgba(217, 130, 43, 0.3); }
    .bp3-html-select.bp3-minimal select.bp3-intent-warning .bp3-button-spinner .bp3-spinner-head, .bp3-select.bp3-minimal select.bp3-intent-warning .bp3-button-spinner .bp3-spinner-head{
      stroke:#bf7326; }
    .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-warning, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-warning,
    .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-warning, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-warning{
      color:#ffb366; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-warning:hover, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-warning:hover,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-warning:hover, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-warning:hover{
        background:rgba(217, 130, 43, 0.2);
        color:#ffb366; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-warning:active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-warning:active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-warning:active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-warning:active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-warning.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-warning.bp3-active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-warning.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-warning.bp3-active{
        background:rgba(217, 130, 43, 0.3);
        color:#ffb366; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-warning:disabled, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-warning:disabled,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-warning:disabled, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-warning:disabled, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-warning.bp3-disabled, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-warning.bp3-disabled,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-warning.bp3-disabled, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-warning.bp3-disabled{
        background:none;
        color:rgba(255, 179, 102, 0.5); }
        .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-warning:disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-warning:disabled.bp3-active,
        .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-warning:disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-warning:disabled.bp3-active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-warning.bp3-disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-warning.bp3-disabled.bp3-active,
        .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-warning.bp3-disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-warning.bp3-disabled.bp3-active{
          background:rgba(217, 130, 43, 0.3); }
  .bp3-html-select.bp3-minimal select.bp3-intent-danger,
  .bp3-select.bp3-minimal select.bp3-intent-danger{
    color:#c23030; }
    .bp3-html-select.bp3-minimal select.bp3-intent-danger:hover,
    .bp3-select.bp3-minimal select.bp3-intent-danger:hover, .bp3-html-select.bp3-minimal select.bp3-intent-danger:active,
    .bp3-select.bp3-minimal select.bp3-intent-danger:active, .bp3-html-select.bp3-minimal select.bp3-intent-danger.bp3-active,
    .bp3-select.bp3-minimal select.bp3-intent-danger.bp3-active{
      background:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:#c23030; }
    .bp3-html-select.bp3-minimal select.bp3-intent-danger:hover,
    .bp3-select.bp3-minimal select.bp3-intent-danger:hover{
      background:rgba(219, 55, 55, 0.15);
      color:#c23030; }
    .bp3-html-select.bp3-minimal select.bp3-intent-danger:active,
    .bp3-select.bp3-minimal select.bp3-intent-danger:active, .bp3-html-select.bp3-minimal select.bp3-intent-danger.bp3-active,
    .bp3-select.bp3-minimal select.bp3-intent-danger.bp3-active{
      background:rgba(219, 55, 55, 0.3);
      color:#c23030; }
    .bp3-html-select.bp3-minimal select.bp3-intent-danger:disabled,
    .bp3-select.bp3-minimal select.bp3-intent-danger:disabled, .bp3-html-select.bp3-minimal select.bp3-intent-danger.bp3-disabled,
    .bp3-select.bp3-minimal select.bp3-intent-danger.bp3-disabled{
      background:none;
      color:rgba(194, 48, 48, 0.5); }
      .bp3-html-select.bp3-minimal select.bp3-intent-danger:disabled.bp3-active,
      .bp3-select.bp3-minimal select.bp3-intent-danger:disabled.bp3-active, .bp3-html-select.bp3-minimal select.bp3-intent-danger.bp3-disabled.bp3-active,
      .bp3-select.bp3-minimal select.bp3-intent-danger.bp3-disabled.bp3-active{
        background:rgba(219, 55, 55, 0.3); }
    .bp3-html-select.bp3-minimal select.bp3-intent-danger .bp3-button-spinner .bp3-spinner-head, .bp3-select.bp3-minimal select.bp3-intent-danger .bp3-button-spinner .bp3-spinner-head{
      stroke:#c23030; }
    .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-danger, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-danger,
    .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-danger, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-danger{
      color:#ff7373; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-danger:hover, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-danger:hover,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-danger:hover, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-danger:hover{
        background:rgba(219, 55, 55, 0.2);
        color:#ff7373; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-danger:active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-danger:active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-danger:active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-danger:active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-danger.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-danger.bp3-active,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-danger.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-danger.bp3-active{
        background:rgba(219, 55, 55, 0.3);
        color:#ff7373; }
      .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-danger:disabled, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-danger:disabled,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-danger:disabled, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-danger:disabled, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-danger.bp3-disabled, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-danger.bp3-disabled,
      .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-danger.bp3-disabled, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-danger.bp3-disabled{
        background:none;
        color:rgba(255, 115, 115, 0.5); }
        .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-danger:disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-danger:disabled.bp3-active,
        .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-danger:disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-danger:disabled.bp3-active, .bp3-dark .bp3-html-select.bp3-minimal select.bp3-intent-danger.bp3-disabled.bp3-active, .bp3-html-select.bp3-minimal .bp3-dark select.bp3-intent-danger.bp3-disabled.bp3-active,
        .bp3-dark .bp3-select.bp3-minimal select.bp3-intent-danger.bp3-disabled.bp3-active, .bp3-select.bp3-minimal .bp3-dark select.bp3-intent-danger.bp3-disabled.bp3-active{
          background:rgba(219, 55, 55, 0.3); }

.bp3-html-select.bp3-large select,
.bp3-select.bp3-large select{
  font-size:16px;
  height:40px;
  padding-right:35px; }

.bp3-dark .bp3-html-select select, .bp3-dark .bp3-select select{
  background-color:#394b59;
  background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.05)), to(rgba(255, 255, 255, 0)));
  background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.05), rgba(255, 255, 255, 0));
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
  color:#f5f8fa; }
  .bp3-dark .bp3-html-select select:hover, .bp3-dark .bp3-select select:hover, .bp3-dark .bp3-html-select select:active, .bp3-dark .bp3-select select:active, .bp3-dark .bp3-html-select select.bp3-active, .bp3-dark .bp3-select select.bp3-active{
    color:#f5f8fa; }
  .bp3-dark .bp3-html-select select:hover, .bp3-dark .bp3-select select:hover{
    background-color:#30404d;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-html-select select:active, .bp3-dark .bp3-select select:active, .bp3-dark .bp3-html-select select.bp3-active, .bp3-dark .bp3-select select.bp3-active{
    background-color:#202b33;
    background-image:none;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
  .bp3-dark .bp3-html-select select:disabled, .bp3-dark .bp3-select select:disabled, .bp3-dark .bp3-html-select select.bp3-disabled, .bp3-dark .bp3-select select.bp3-disabled{
    background-color:rgba(57, 75, 89, 0.5);
    background-image:none;
    -webkit-box-shadow:none;
            box-shadow:none;
    color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-html-select select:disabled.bp3-active, .bp3-dark .bp3-select select:disabled.bp3-active, .bp3-dark .bp3-html-select select.bp3-disabled.bp3-active, .bp3-dark .bp3-select select.bp3-disabled.bp3-active{
      background:rgba(57, 75, 89, 0.7); }
  .bp3-dark .bp3-html-select select .bp3-button-spinner .bp3-spinner-head, .bp3-dark .bp3-select select .bp3-button-spinner .bp3-spinner-head{
    background:rgba(16, 22, 26, 0.5);
    stroke:#8a9ba8; }

.bp3-html-select select:disabled,
.bp3-select select:disabled{
  background-color:rgba(206, 217, 224, 0.5);
  -webkit-box-shadow:none;
          box-shadow:none;
  color:rgba(92, 112, 128, 0.6);
  cursor:not-allowed; }

.bp3-html-select .bp3-icon,
.bp3-select .bp3-icon, .bp3-select::after{
  color:#5c7080;
  pointer-events:none;
  position:absolute;
  right:7px;
  top:7px; }
  .bp3-html-select .bp3-disabled.bp3-icon,
  .bp3-select .bp3-disabled.bp3-icon, .bp3-disabled.bp3-select::after{
    color:rgba(92, 112, 128, 0.6); }
.bp3-html-select,
.bp3-select{
  display:inline-block;
  letter-spacing:normal;
  position:relative;
  vertical-align:middle; }
  .bp3-html-select select::-ms-expand,
  .bp3-select select::-ms-expand{
    display:none; }
  .bp3-html-select .bp3-icon,
  .bp3-select .bp3-icon{
    color:#5c7080; }
    .bp3-html-select .bp3-icon:hover,
    .bp3-select .bp3-icon:hover{
      color:#182026; }
    .bp3-dark .bp3-html-select .bp3-icon, .bp3-dark
    .bp3-select .bp3-icon{
      color:#a7b6c2; }
      .bp3-dark .bp3-html-select .bp3-icon:hover, .bp3-dark
      .bp3-select .bp3-icon:hover{
        color:#f5f8fa; }
  .bp3-html-select.bp3-large::after,
  .bp3-html-select.bp3-large .bp3-icon,
  .bp3-select.bp3-large::after,
  .bp3-select.bp3-large .bp3-icon{
    right:12px;
    top:12px; }
  .bp3-html-select.bp3-fill,
  .bp3-html-select.bp3-fill select,
  .bp3-select.bp3-fill,
  .bp3-select.bp3-fill select{
    width:100%; }
  .bp3-dark .bp3-html-select option, .bp3-dark
  .bp3-select option{
    background-color:#30404d;
    color:#f5f8fa; }
  .bp3-dark .bp3-html-select option:disabled, .bp3-dark
  .bp3-select option:disabled{
    color:rgba(167, 182, 194, 0.6); }
  .bp3-dark .bp3-html-select::after, .bp3-dark
  .bp3-select::after{
    color:#a7b6c2; }

.bp3-select::after{
  font-family:"Icons16", sans-serif;
  font-size:16px;
  font-style:normal;
  font-weight:400;
  line-height:1;
  -moz-osx-font-smoothing:grayscale;
  -webkit-font-smoothing:antialiased;
  content:""; }
.bp3-running-text table, table.bp3-html-table{
  border-spacing:0;
  font-size:14px; }
  .bp3-running-text table th, table.bp3-html-table th,
  .bp3-running-text table td,
  table.bp3-html-table td{
    padding:11px;
    text-align:left;
    vertical-align:top; }
  .bp3-running-text table th, table.bp3-html-table th{
    color:#182026;
    font-weight:600; }
  
  .bp3-running-text table td,
  table.bp3-html-table td{
    color:#182026; }
  .bp3-running-text table tbody tr:first-child th, table.bp3-html-table tbody tr:first-child th,
  .bp3-running-text table tbody tr:first-child td,
  table.bp3-html-table tbody tr:first-child td,
  .bp3-running-text table tfoot tr:first-child th,
  table.bp3-html-table tfoot tr:first-child th,
  .bp3-running-text table tfoot tr:first-child td,
  table.bp3-html-table tfoot tr:first-child td{
    -webkit-box-shadow:inset 0 1px 0 0 rgba(16, 22, 26, 0.15);
            box-shadow:inset 0 1px 0 0 rgba(16, 22, 26, 0.15); }
  .bp3-dark .bp3-running-text table th, .bp3-running-text .bp3-dark table th, .bp3-dark table.bp3-html-table th{
    color:#f5f8fa; }
  .bp3-dark .bp3-running-text table td, .bp3-running-text .bp3-dark table td, .bp3-dark table.bp3-html-table td{
    color:#f5f8fa; }
  .bp3-dark .bp3-running-text table tbody tr:first-child th, .bp3-running-text .bp3-dark table tbody tr:first-child th, .bp3-dark table.bp3-html-table tbody tr:first-child th,
  .bp3-dark .bp3-running-text table tbody tr:first-child td,
  .bp3-running-text .bp3-dark table tbody tr:first-child td,
  .bp3-dark table.bp3-html-table tbody tr:first-child td,
  .bp3-dark .bp3-running-text table tfoot tr:first-child th,
  .bp3-running-text .bp3-dark table tfoot tr:first-child th,
  .bp3-dark table.bp3-html-table tfoot tr:first-child th,
  .bp3-dark .bp3-running-text table tfoot tr:first-child td,
  .bp3-running-text .bp3-dark table tfoot tr:first-child td,
  .bp3-dark table.bp3-html-table tfoot tr:first-child td{
    -webkit-box-shadow:inset 0 1px 0 0 rgba(255, 255, 255, 0.15);
            box-shadow:inset 0 1px 0 0 rgba(255, 255, 255, 0.15); }

table.bp3-html-table.bp3-html-table-condensed th,
table.bp3-html-table.bp3-html-table-condensed td, table.bp3-html-table.bp3-small th,
table.bp3-html-table.bp3-small td{
  padding-bottom:6px;
  padding-top:6px; }

table.bp3-html-table.bp3-html-table-striped tbody tr:nth-child(odd) td{
  background:rgba(191, 204, 214, 0.15); }

table.bp3-html-table.bp3-html-table-bordered th:not(:first-child){
  -webkit-box-shadow:inset 1px 0 0 0 rgba(16, 22, 26, 0.15);
          box-shadow:inset 1px 0 0 0 rgba(16, 22, 26, 0.15); }

table.bp3-html-table.bp3-html-table-bordered tbody tr td,
table.bp3-html-table.bp3-html-table-bordered tfoot tr td{
  -webkit-box-shadow:inset 0 1px 0 0 rgba(16, 22, 26, 0.15);
          box-shadow:inset 0 1px 0 0 rgba(16, 22, 26, 0.15); }
  table.bp3-html-table.bp3-html-table-bordered tbody tr td:not(:first-child),
  table.bp3-html-table.bp3-html-table-bordered tfoot tr td:not(:first-child){
    -webkit-box-shadow:inset 1px 1px 0 0 rgba(16, 22, 26, 0.15);
            box-shadow:inset 1px 1px 0 0 rgba(16, 22, 26, 0.15); }

table.bp3-html-table.bp3-html-table-bordered.bp3-html-table-striped tbody tr:not(:first-child) td{
  -webkit-box-shadow:none;
          box-shadow:none; }
  table.bp3-html-table.bp3-html-table-bordered.bp3-html-table-striped tbody tr:not(:first-child) td:not(:first-child){
    -webkit-box-shadow:inset 1px 0 0 0 rgba(16, 22, 26, 0.15);
            box-shadow:inset 1px 0 0 0 rgba(16, 22, 26, 0.15); }

table.bp3-html-table.bp3-interactive tbody tr:hover td{
  background-color:rgba(191, 204, 214, 0.3);
  cursor:pointer; }

table.bp3-html-table.bp3-interactive tbody tr:active td{
  background-color:rgba(191, 204, 214, 0.4); }

.bp3-dark table.bp3-html-table{ }
  .bp3-dark table.bp3-html-table.bp3-html-table-striped tbody tr:nth-child(odd) td{
    background:rgba(92, 112, 128, 0.15); }
  .bp3-dark table.bp3-html-table.bp3-html-table-bordered th:not(:first-child){
    -webkit-box-shadow:inset 1px 0 0 0 rgba(255, 255, 255, 0.15);
            box-shadow:inset 1px 0 0 0 rgba(255, 255, 255, 0.15); }
  .bp3-dark table.bp3-html-table.bp3-html-table-bordered tbody tr td,
  .bp3-dark table.bp3-html-table.bp3-html-table-bordered tfoot tr td{
    -webkit-box-shadow:inset 0 1px 0 0 rgba(255, 255, 255, 0.15);
            box-shadow:inset 0 1px 0 0 rgba(255, 255, 255, 0.15); }
    .bp3-dark table.bp3-html-table.bp3-html-table-bordered tbody tr td:not(:first-child),
    .bp3-dark table.bp3-html-table.bp3-html-table-bordered tfoot tr td:not(:first-child){
      -webkit-box-shadow:inset 1px 1px 0 0 rgba(255, 255, 255, 0.15);
              box-shadow:inset 1px 1px 0 0 rgba(255, 255, 255, 0.15); }
  .bp3-dark table.bp3-html-table.bp3-html-table-bordered.bp3-html-table-striped tbody tr:not(:first-child) td{
    -webkit-box-shadow:inset 1px 0 0 0 rgba(255, 255, 255, 0.15);
            box-shadow:inset 1px 0 0 0 rgba(255, 255, 255, 0.15); }
    .bp3-dark table.bp3-html-table.bp3-html-table-bordered.bp3-html-table-striped tbody tr:not(:first-child) td:first-child{
      -webkit-box-shadow:none;
              box-shadow:none; }
  .bp3-dark table.bp3-html-table.bp3-interactive tbody tr:hover td{
    background-color:rgba(92, 112, 128, 0.3);
    cursor:pointer; }
  .bp3-dark table.bp3-html-table.bp3-interactive tbody tr:active td{
    background-color:rgba(92, 112, 128, 0.4); }

.bp3-key-combo{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:horizontal;
  -webkit-box-direction:normal;
      -ms-flex-direction:row;
          flex-direction:row;
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center; }
  .bp3-key-combo > *{
    -webkit-box-flex:0;
        -ms-flex-positive:0;
            flex-grow:0;
    -ms-flex-negative:0;
        flex-shrink:0; }
  .bp3-key-combo > .bp3-fill{
    -webkit-box-flex:1;
        -ms-flex-positive:1;
            flex-grow:1;
    -ms-flex-negative:1;
        flex-shrink:1; }
  .bp3-key-combo::before,
  .bp3-key-combo > *{
    margin-right:5px; }
  .bp3-key-combo:empty::before,
  .bp3-key-combo > :last-child{
    margin-right:0; }

.bp3-hotkey-dialog{
  padding-bottom:0;
  top:40px; }
  .bp3-hotkey-dialog .bp3-dialog-body{
    margin:0;
    padding:0; }
  .bp3-hotkey-dialog .bp3-hotkey-label{
    -webkit-box-flex:1;
        -ms-flex-positive:1;
            flex-grow:1; }

.bp3-hotkey-column{
  margin:auto;
  max-height:80vh;
  overflow-y:auto;
  padding:30px; }
  .bp3-hotkey-column .bp3-heading{
    margin-bottom:20px; }
    .bp3-hotkey-column .bp3-heading:not(:first-child){
      margin-top:40px; }

.bp3-hotkey{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-pack:justify;
      -ms-flex-pack:justify;
          justify-content:space-between;
  margin-left:0;
  margin-right:0; }
  .bp3-hotkey:not(:last-child){
    margin-bottom:10px; }
.bp3-icon{
  display:inline-block;
  -webkit-box-flex:0;
      -ms-flex:0 0 auto;
          flex:0 0 auto;
  vertical-align:text-bottom; }
  .bp3-icon:not(:empty)::before{
    content:"" !important;
    content:unset !important; }
  .bp3-icon > svg{
    display:block; }
    .bp3-icon > svg:not([fill]){
      fill:currentColor; }

.bp3-icon.bp3-intent-primary, .bp3-icon-standard.bp3-intent-primary, .bp3-icon-large.bp3-intent-primary{
  color:#106ba3; }
  .bp3-dark .bp3-icon.bp3-intent-primary, .bp3-dark .bp3-icon-standard.bp3-intent-primary, .bp3-dark .bp3-icon-large.bp3-intent-primary{
    color:#48aff0; }

.bp3-icon.bp3-intent-success, .bp3-icon-standard.bp3-intent-success, .bp3-icon-large.bp3-intent-success{
  color:#0d8050; }
  .bp3-dark .bp3-icon.bp3-intent-success, .bp3-dark .bp3-icon-standard.bp3-intent-success, .bp3-dark .bp3-icon-large.bp3-intent-success{
    color:#3dcc91; }

.bp3-icon.bp3-intent-warning, .bp3-icon-standard.bp3-intent-warning, .bp3-icon-large.bp3-intent-warning{
  color:#bf7326; }
  .bp3-dark .bp3-icon.bp3-intent-warning, .bp3-dark .bp3-icon-standard.bp3-intent-warning, .bp3-dark .bp3-icon-large.bp3-intent-warning{
    color:#ffb366; }

.bp3-icon.bp3-intent-danger, .bp3-icon-standard.bp3-intent-danger, .bp3-icon-large.bp3-intent-danger{
  color:#c23030; }
  .bp3-dark .bp3-icon.bp3-intent-danger, .bp3-dark .bp3-icon-standard.bp3-intent-danger, .bp3-dark .bp3-icon-large.bp3-intent-danger{
    color:#ff7373; }

span.bp3-icon-standard{
  font-family:"Icons16", sans-serif;
  font-size:16px;
  font-style:normal;
  font-weight:400;
  line-height:1;
  -moz-osx-font-smoothing:grayscale;
  -webkit-font-smoothing:antialiased;
  display:inline-block; }

span.bp3-icon-large{
  font-family:"Icons20", sans-serif;
  font-size:20px;
  font-style:normal;
  font-weight:400;
  line-height:1;
  -moz-osx-font-smoothing:grayscale;
  -webkit-font-smoothing:antialiased;
  display:inline-block; }

span.bp3-icon:empty{
  font-family:"Icons20";
  font-size:inherit;
  font-style:normal;
  font-weight:400;
  line-height:1; }
  span.bp3-icon:empty::before{
    -moz-osx-font-smoothing:grayscale;
    -webkit-font-smoothing:antialiased; }

.bp3-icon-add::before{
  content:""; }

.bp3-icon-add-column-left::before{
  content:""; }

.bp3-icon-add-column-right::before{
  content:""; }

.bp3-icon-add-row-bottom::before{
  content:""; }

.bp3-icon-add-row-top::before{
  content:""; }

.bp3-icon-add-to-artifact::before{
  content:""; }

.bp3-icon-add-to-folder::before{
  content:""; }

.bp3-icon-airplane::before{
  content:""; }

.bp3-icon-align-center::before{
  content:""; }

.bp3-icon-align-justify::before{
  content:""; }

.bp3-icon-align-left::before{
  content:""; }

.bp3-icon-align-right::before{
  content:""; }

.bp3-icon-alignment-bottom::before{
  content:""; }

.bp3-icon-alignment-horizontal-center::before{
  content:""; }

.bp3-icon-alignment-left::before{
  content:""; }

.bp3-icon-alignment-right::before{
  content:""; }

.bp3-icon-alignment-top::before{
  content:""; }

.bp3-icon-alignment-vertical-center::before{
  content:""; }

.bp3-icon-annotation::before{
  content:""; }

.bp3-icon-application::before{
  content:""; }

.bp3-icon-applications::before{
  content:""; }

.bp3-icon-archive::before{
  content:""; }

.bp3-icon-arrow-bottom-left::before{
  content:"↙"; }

.bp3-icon-arrow-bottom-right::before{
  content:"↘"; }

.bp3-icon-arrow-down::before{
  content:"↓"; }

.bp3-icon-arrow-left::before{
  content:"←"; }

.bp3-icon-arrow-right::before{
  content:"→"; }

.bp3-icon-arrow-top-left::before{
  content:"↖"; }

.bp3-icon-arrow-top-right::before{
  content:"↗"; }

.bp3-icon-arrow-up::before{
  content:"↑"; }

.bp3-icon-arrows-horizontal::before{
  content:"↔"; }

.bp3-icon-arrows-vertical::before{
  content:"↕"; }

.bp3-icon-asterisk::before{
  content:"*"; }

.bp3-icon-automatic-updates::before{
  content:""; }

.bp3-icon-badge::before{
  content:""; }

.bp3-icon-ban-circle::before{
  content:""; }

.bp3-icon-bank-account::before{
  content:""; }

.bp3-icon-barcode::before{
  content:""; }

.bp3-icon-blank::before{
  content:""; }

.bp3-icon-blocked-person::before{
  content:""; }

.bp3-icon-bold::before{
  content:""; }

.bp3-icon-book::before{
  content:""; }

.bp3-icon-bookmark::before{
  content:""; }

.bp3-icon-box::before{
  content:""; }

.bp3-icon-briefcase::before{
  content:""; }

.bp3-icon-bring-data::before{
  content:""; }

.bp3-icon-build::before{
  content:""; }

.bp3-icon-calculator::before{
  content:""; }

.bp3-icon-calendar::before{
  content:""; }

.bp3-icon-camera::before{
  content:""; }

.bp3-icon-caret-down::before{
  content:"⌄"; }

.bp3-icon-caret-left::before{
  content:"〈"; }

.bp3-icon-caret-right::before{
  content:"〉"; }

.bp3-icon-caret-up::before{
  content:"⌃"; }

.bp3-icon-cell-tower::before{
  content:""; }

.bp3-icon-changes::before{
  content:""; }

.bp3-icon-chart::before{
  content:""; }

.bp3-icon-chat::before{
  content:""; }

.bp3-icon-chevron-backward::before{
  content:""; }

.bp3-icon-chevron-down::before{
  content:""; }

.bp3-icon-chevron-forward::before{
  content:""; }

.bp3-icon-chevron-left::before{
  content:""; }

.bp3-icon-chevron-right::before{
  content:""; }

.bp3-icon-chevron-up::before{
  content:""; }

.bp3-icon-circle::before{
  content:""; }

.bp3-icon-circle-arrow-down::before{
  content:""; }

.bp3-icon-circle-arrow-left::before{
  content:""; }

.bp3-icon-circle-arrow-right::before{
  content:""; }

.bp3-icon-circle-arrow-up::before{
  content:""; }

.bp3-icon-citation::before{
  content:""; }

.bp3-icon-clean::before{
  content:""; }

.bp3-icon-clipboard::before{
  content:""; }

.bp3-icon-cloud::before{
  content:"☁"; }

.bp3-icon-cloud-download::before{
  content:""; }

.bp3-icon-cloud-upload::before{
  content:""; }

.bp3-icon-code::before{
  content:""; }

.bp3-icon-code-block::before{
  content:""; }

.bp3-icon-cog::before{
  content:""; }

.bp3-icon-collapse-all::before{
  content:""; }

.bp3-icon-column-layout::before{
  content:""; }

.bp3-icon-comment::before{
  content:""; }

.bp3-icon-comparison::before{
  content:""; }

.bp3-icon-compass::before{
  content:""; }

.bp3-icon-compressed::before{
  content:""; }

.bp3-icon-confirm::before{
  content:""; }

.bp3-icon-console::before{
  content:""; }

.bp3-icon-contrast::before{
  content:""; }

.bp3-icon-control::before{
  content:""; }

.bp3-icon-credit-card::before{
  content:""; }

.bp3-icon-cross::before{
  content:"✗"; }

.bp3-icon-crown::before{
  content:""; }

.bp3-icon-cube::before{
  content:""; }

.bp3-icon-cube-add::before{
  content:""; }

.bp3-icon-cube-remove::before{
  content:""; }

.bp3-icon-curved-range-chart::before{
  content:""; }

.bp3-icon-cut::before{
  content:""; }

.bp3-icon-dashboard::before{
  content:""; }

.bp3-icon-data-lineage::before{
  content:""; }

.bp3-icon-database::before{
  content:""; }

.bp3-icon-delete::before{
  content:""; }

.bp3-icon-delta::before{
  content:"Δ"; }

.bp3-icon-derive-column::before{
  content:""; }

.bp3-icon-desktop::before{
  content:""; }

.bp3-icon-diagnosis::before{
  content:""; }

.bp3-icon-diagram-tree::before{
  content:""; }

.bp3-icon-direction-left::before{
  content:""; }

.bp3-icon-direction-right::before{
  content:""; }

.bp3-icon-disable::before{
  content:""; }

.bp3-icon-document::before{
  content:""; }

.bp3-icon-document-open::before{
  content:""; }

.bp3-icon-document-share::before{
  content:""; }

.bp3-icon-dollar::before{
  content:"$"; }

.bp3-icon-dot::before{
  content:"•"; }

.bp3-icon-double-caret-horizontal::before{
  content:""; }

.bp3-icon-double-caret-vertical::before{
  content:""; }

.bp3-icon-double-chevron-down::before{
  content:""; }

.bp3-icon-double-chevron-left::before{
  content:""; }

.bp3-icon-double-chevron-right::before{
  content:""; }

.bp3-icon-double-chevron-up::before{
  content:""; }

.bp3-icon-doughnut-chart::before{
  content:""; }

.bp3-icon-download::before{
  content:""; }

.bp3-icon-drag-handle-horizontal::before{
  content:""; }

.bp3-icon-drag-handle-vertical::before{
  content:""; }

.bp3-icon-draw::before{
  content:""; }

.bp3-icon-drive-time::before{
  content:""; }

.bp3-icon-duplicate::before{
  content:""; }

.bp3-icon-edit::before{
  content:"✎"; }

.bp3-icon-eject::before{
  content:"⏏"; }

.bp3-icon-endorsed::before{
  content:""; }

.bp3-icon-envelope::before{
  content:"✉"; }

.bp3-icon-equals::before{
  content:""; }

.bp3-icon-eraser::before{
  content:""; }

.bp3-icon-error::before{
  content:""; }

.bp3-icon-euro::before{
  content:"€"; }

.bp3-icon-exchange::before{
  content:""; }

.bp3-icon-exclude-row::before{
  content:""; }

.bp3-icon-expand-all::before{
  content:""; }

.bp3-icon-export::before{
  content:""; }

.bp3-icon-eye-off::before{
  content:""; }

.bp3-icon-eye-on::before{
  content:""; }

.bp3-icon-eye-open::before{
  content:""; }

.bp3-icon-fast-backward::before{
  content:""; }

.bp3-icon-fast-forward::before{
  content:""; }

.bp3-icon-feed::before{
  content:""; }

.bp3-icon-feed-subscribed::before{
  content:""; }

.bp3-icon-film::before{
  content:""; }

.bp3-icon-filter::before{
  content:""; }

.bp3-icon-filter-keep::before{
  content:""; }

.bp3-icon-filter-list::before{
  content:""; }

.bp3-icon-filter-open::before{
  content:""; }

.bp3-icon-filter-remove::before{
  content:""; }

.bp3-icon-flag::before{
  content:"⚑"; }

.bp3-icon-flame::before{
  content:""; }

.bp3-icon-flash::before{
  content:""; }

.bp3-icon-floppy-disk::before{
  content:""; }

.bp3-icon-flow-branch::before{
  content:""; }

.bp3-icon-flow-end::before{
  content:""; }

.bp3-icon-flow-linear::before{
  content:""; }

.bp3-icon-flow-review::before{
  content:""; }

.bp3-icon-flow-review-branch::before{
  content:""; }

.bp3-icon-flows::before{
  content:""; }

.bp3-icon-folder-close::before{
  content:""; }

.bp3-icon-folder-new::before{
  content:""; }

.bp3-icon-folder-open::before{
  content:""; }

.bp3-icon-folder-shared::before{
  content:""; }

.bp3-icon-folder-shared-open::before{
  content:""; }

.bp3-icon-follower::before{
  content:""; }

.bp3-icon-following::before{
  content:""; }

.bp3-icon-font::before{
  content:""; }

.bp3-icon-fork::before{
  content:""; }

.bp3-icon-form::before{
  content:""; }

.bp3-icon-full-circle::before{
  content:""; }

.bp3-icon-full-stacked-chart::before{
  content:""; }

.bp3-icon-fullscreen::before{
  content:""; }

.bp3-icon-function::before{
  content:""; }

.bp3-icon-gantt-chart::before{
  content:""; }

.bp3-icon-geolocation::before{
  content:""; }

.bp3-icon-geosearch::before{
  content:""; }

.bp3-icon-git-branch::before{
  content:""; }

.bp3-icon-git-commit::before{
  content:""; }

.bp3-icon-git-merge::before{
  content:""; }

.bp3-icon-git-new-branch::before{
  content:""; }

.bp3-icon-git-pull::before{
  content:""; }

.bp3-icon-git-push::before{
  content:""; }

.bp3-icon-git-repo::before{
  content:""; }

.bp3-icon-glass::before{
  content:""; }

.bp3-icon-globe::before{
  content:""; }

.bp3-icon-globe-network::before{
  content:""; }

.bp3-icon-graph::before{
  content:""; }

.bp3-icon-graph-remove::before{
  content:""; }

.bp3-icon-greater-than::before{
  content:""; }

.bp3-icon-greater-than-or-equal-to::before{
  content:""; }

.bp3-icon-grid::before{
  content:""; }

.bp3-icon-grid-view::before{
  content:""; }

.bp3-icon-group-objects::before{
  content:""; }

.bp3-icon-grouped-bar-chart::before{
  content:""; }

.bp3-icon-hand::before{
  content:""; }

.bp3-icon-hand-down::before{
  content:""; }

.bp3-icon-hand-left::before{
  content:""; }

.bp3-icon-hand-right::before{
  content:""; }

.bp3-icon-hand-up::before{
  content:""; }

.bp3-icon-header::before{
  content:""; }

.bp3-icon-header-one::before{
  content:""; }

.bp3-icon-header-two::before{
  content:""; }

.bp3-icon-headset::before{
  content:""; }

.bp3-icon-heart::before{
  content:"♥"; }

.bp3-icon-heart-broken::before{
  content:""; }

.bp3-icon-heat-grid::before{
  content:""; }

.bp3-icon-heatmap::before{
  content:""; }

.bp3-icon-help::before{
  content:"?"; }

.bp3-icon-helper-management::before{
  content:""; }

.bp3-icon-highlight::before{
  content:""; }

.bp3-icon-history::before{
  content:""; }

.bp3-icon-home::before{
  content:"⌂"; }

.bp3-icon-horizontal-bar-chart::before{
  content:""; }

.bp3-icon-horizontal-bar-chart-asc::before{
  content:""; }

.bp3-icon-horizontal-bar-chart-desc::before{
  content:""; }

.bp3-icon-horizontal-distribution::before{
  content:""; }

.bp3-icon-id-number::before{
  content:""; }

.bp3-icon-image-rotate-left::before{
  content:""; }

.bp3-icon-image-rotate-right::before{
  content:""; }

.bp3-icon-import::before{
  content:""; }

.bp3-icon-inbox::before{
  content:""; }

.bp3-icon-inbox-filtered::before{
  content:""; }

.bp3-icon-inbox-geo::before{
  content:""; }

.bp3-icon-inbox-search::before{
  content:""; }

.bp3-icon-inbox-update::before{
  content:""; }

.bp3-icon-info-sign::before{
  content:"ℹ"; }

.bp3-icon-inheritance::before{
  content:""; }

.bp3-icon-inner-join::before{
  content:""; }

.bp3-icon-insert::before{
  content:""; }

.bp3-icon-intersection::before{
  content:""; }

.bp3-icon-ip-address::before{
  content:""; }

.bp3-icon-issue::before{
  content:""; }

.bp3-icon-issue-closed::before{
  content:""; }

.bp3-icon-issue-new::before{
  content:""; }

.bp3-icon-italic::before{
  content:""; }

.bp3-icon-join-table::before{
  content:""; }

.bp3-icon-key::before{
  content:""; }

.bp3-icon-key-backspace::before{
  content:""; }

.bp3-icon-key-command::before{
  content:""; }

.bp3-icon-key-control::before{
  content:""; }

.bp3-icon-key-delete::before{
  content:""; }

.bp3-icon-key-enter::before{
  content:""; }

.bp3-icon-key-escape::before{
  content:""; }

.bp3-icon-key-option::before{
  content:""; }

.bp3-icon-key-shift::before{
  content:""; }

.bp3-icon-key-tab::before{
  content:""; }

.bp3-icon-known-vehicle::before{
  content:""; }

.bp3-icon-lab-test::before{
  content:""; }

.bp3-icon-label::before{
  content:""; }

.bp3-icon-layer::before{
  content:""; }

.bp3-icon-layers::before{
  content:""; }

.bp3-icon-layout::before{
  content:""; }

.bp3-icon-layout-auto::before{
  content:""; }

.bp3-icon-layout-balloon::before{
  content:""; }

.bp3-icon-layout-circle::before{
  content:""; }

.bp3-icon-layout-grid::before{
  content:""; }

.bp3-icon-layout-group-by::before{
  content:""; }

.bp3-icon-layout-hierarchy::before{
  content:""; }

.bp3-icon-layout-linear::before{
  content:""; }

.bp3-icon-layout-skew-grid::before{
  content:""; }

.bp3-icon-layout-sorted-clusters::before{
  content:""; }

.bp3-icon-learning::before{
  content:""; }

.bp3-icon-left-join::before{
  content:""; }

.bp3-icon-less-than::before{
  content:""; }

.bp3-icon-less-than-or-equal-to::before{
  content:""; }

.bp3-icon-lifesaver::before{
  content:""; }

.bp3-icon-lightbulb::before{
  content:""; }

.bp3-icon-link::before{
  content:""; }

.bp3-icon-list::before{
  content:"☰"; }

.bp3-icon-list-columns::before{
  content:""; }

.bp3-icon-list-detail-view::before{
  content:""; }

.bp3-icon-locate::before{
  content:""; }

.bp3-icon-lock::before{
  content:""; }

.bp3-icon-log-in::before{
  content:""; }

.bp3-icon-log-out::before{
  content:""; }

.bp3-icon-manual::before{
  content:""; }

.bp3-icon-manually-entered-data::before{
  content:""; }

.bp3-icon-map::before{
  content:""; }

.bp3-icon-map-create::before{
  content:""; }

.bp3-icon-map-marker::before{
  content:""; }

.bp3-icon-maximize::before{
  content:""; }

.bp3-icon-media::before{
  content:""; }

.bp3-icon-menu::before{
  content:""; }

.bp3-icon-menu-closed::before{
  content:""; }

.bp3-icon-menu-open::before{
  content:""; }

.bp3-icon-merge-columns::before{
  content:""; }

.bp3-icon-merge-links::before{
  content:""; }

.bp3-icon-minimize::before{
  content:""; }

.bp3-icon-minus::before{
  content:"−"; }

.bp3-icon-mobile-phone::before{
  content:""; }

.bp3-icon-mobile-video::before{
  content:""; }

.bp3-icon-moon::before{
  content:""; }

.bp3-icon-more::before{
  content:""; }

.bp3-icon-mountain::before{
  content:""; }

.bp3-icon-move::before{
  content:""; }

.bp3-icon-mugshot::before{
  content:""; }

.bp3-icon-multi-select::before{
  content:""; }

.bp3-icon-music::before{
  content:""; }

.bp3-icon-new-drawing::before{
  content:""; }

.bp3-icon-new-grid-item::before{
  content:""; }

.bp3-icon-new-layer::before{
  content:""; }

.bp3-icon-new-layers::before{
  content:""; }

.bp3-icon-new-link::before{
  content:""; }

.bp3-icon-new-object::before{
  content:""; }

.bp3-icon-new-person::before{
  content:""; }

.bp3-icon-new-prescription::before{
  content:""; }

.bp3-icon-new-text-box::before{
  content:""; }

.bp3-icon-ninja::before{
  content:""; }

.bp3-icon-not-equal-to::before{
  content:""; }

.bp3-icon-notifications::before{
  content:""; }

.bp3-icon-notifications-updated::before{
  content:""; }

.bp3-icon-numbered-list::before{
  content:""; }

.bp3-icon-numerical::before{
  content:""; }

.bp3-icon-office::before{
  content:""; }

.bp3-icon-offline::before{
  content:""; }

.bp3-icon-oil-field::before{
  content:""; }

.bp3-icon-one-column::before{
  content:""; }

.bp3-icon-outdated::before{
  content:""; }

.bp3-icon-page-layout::before{
  content:""; }

.bp3-icon-panel-stats::before{
  content:""; }

.bp3-icon-panel-table::before{
  content:""; }

.bp3-icon-paperclip::before{
  content:""; }

.bp3-icon-paragraph::before{
  content:""; }

.bp3-icon-path::before{
  content:""; }

.bp3-icon-path-search::before{
  content:""; }

.bp3-icon-pause::before{
  content:""; }

.bp3-icon-people::before{
  content:""; }

.bp3-icon-percentage::before{
  content:""; }

.bp3-icon-person::before{
  content:""; }

.bp3-icon-phone::before{
  content:"☎"; }

.bp3-icon-pie-chart::before{
  content:""; }

.bp3-icon-pin::before{
  content:""; }

.bp3-icon-pivot::before{
  content:""; }

.bp3-icon-pivot-table::before{
  content:""; }

.bp3-icon-play::before{
  content:""; }

.bp3-icon-plus::before{
  content:"+"; }

.bp3-icon-polygon-filter::before{
  content:""; }

.bp3-icon-power::before{
  content:""; }

.bp3-icon-predictive-analysis::before{
  content:""; }

.bp3-icon-prescription::before{
  content:""; }

.bp3-icon-presentation::before{
  content:""; }

.bp3-icon-print::before{
  content:"⎙"; }

.bp3-icon-projects::before{
  content:""; }

.bp3-icon-properties::before{
  content:""; }

.bp3-icon-property::before{
  content:""; }

.bp3-icon-publish-function::before{
  content:""; }

.bp3-icon-pulse::before{
  content:""; }

.bp3-icon-random::before{
  content:""; }

.bp3-icon-record::before{
  content:""; }

.bp3-icon-redo::before{
  content:""; }

.bp3-icon-refresh::before{
  content:""; }

.bp3-icon-regression-chart::before{
  content:""; }

.bp3-icon-remove::before{
  content:""; }

.bp3-icon-remove-column::before{
  content:""; }

.bp3-icon-remove-column-left::before{
  content:""; }

.bp3-icon-remove-column-right::before{
  content:""; }

.bp3-icon-remove-row-bottom::before{
  content:""; }

.bp3-icon-remove-row-top::before{
  content:""; }

.bp3-icon-repeat::before{
  content:""; }

.bp3-icon-reset::before{
  content:""; }

.bp3-icon-resolve::before{
  content:""; }

.bp3-icon-rig::before{
  content:""; }

.bp3-icon-right-join::before{
  content:""; }

.bp3-icon-ring::before{
  content:""; }

.bp3-icon-rotate-document::before{
  content:""; }

.bp3-icon-rotate-page::before{
  content:""; }

.bp3-icon-satellite::before{
  content:""; }

.bp3-icon-saved::before{
  content:""; }

.bp3-icon-scatter-plot::before{
  content:""; }

.bp3-icon-search::before{
  content:""; }

.bp3-icon-search-around::before{
  content:""; }

.bp3-icon-search-template::before{
  content:""; }

.bp3-icon-search-text::before{
  content:""; }

.bp3-icon-segmented-control::before{
  content:""; }

.bp3-icon-select::before{
  content:""; }

.bp3-icon-selection::before{
  content:"⦿"; }

.bp3-icon-send-to::before{
  content:""; }

.bp3-icon-send-to-graph::before{
  content:""; }

.bp3-icon-send-to-map::before{
  content:""; }

.bp3-icon-series-add::before{
  content:""; }

.bp3-icon-series-configuration::before{
  content:""; }

.bp3-icon-series-derived::before{
  content:""; }

.bp3-icon-series-filtered::before{
  content:""; }

.bp3-icon-series-search::before{
  content:""; }

.bp3-icon-settings::before{
  content:""; }

.bp3-icon-share::before{
  content:""; }

.bp3-icon-shield::before{
  content:""; }

.bp3-icon-shop::before{
  content:""; }

.bp3-icon-shopping-cart::before{
  content:""; }

.bp3-icon-signal-search::before{
  content:""; }

.bp3-icon-sim-card::before{
  content:""; }

.bp3-icon-slash::before{
  content:""; }

.bp3-icon-small-cross::before{
  content:""; }

.bp3-icon-small-minus::before{
  content:""; }

.bp3-icon-small-plus::before{
  content:""; }

.bp3-icon-small-tick::before{
  content:""; }

.bp3-icon-snowflake::before{
  content:""; }

.bp3-icon-social-media::before{
  content:""; }

.bp3-icon-sort::before{
  content:""; }

.bp3-icon-sort-alphabetical::before{
  content:""; }

.bp3-icon-sort-alphabetical-desc::before{
  content:""; }

.bp3-icon-sort-asc::before{
  content:""; }

.bp3-icon-sort-desc::before{
  content:""; }

.bp3-icon-sort-numerical::before{
  content:""; }

.bp3-icon-sort-numerical-desc::before{
  content:""; }

.bp3-icon-split-columns::before{
  content:""; }

.bp3-icon-square::before{
  content:""; }

.bp3-icon-stacked-chart::before{
  content:""; }

.bp3-icon-star::before{
  content:"★"; }

.bp3-icon-star-empty::before{
  content:"☆"; }

.bp3-icon-step-backward::before{
  content:""; }

.bp3-icon-step-chart::before{
  content:""; }

.bp3-icon-step-forward::before{
  content:""; }

.bp3-icon-stop::before{
  content:""; }

.bp3-icon-stopwatch::before{
  content:""; }

.bp3-icon-strikethrough::before{
  content:""; }

.bp3-icon-style::before{
  content:""; }

.bp3-icon-swap-horizontal::before{
  content:""; }

.bp3-icon-swap-vertical::before{
  content:""; }

.bp3-icon-symbol-circle::before{
  content:""; }

.bp3-icon-symbol-cross::before{
  content:""; }

.bp3-icon-symbol-diamond::before{
  content:""; }

.bp3-icon-symbol-square::before{
  content:""; }

.bp3-icon-symbol-triangle-down::before{
  content:""; }

.bp3-icon-symbol-triangle-up::before{
  content:""; }

.bp3-icon-tag::before{
  content:""; }

.bp3-icon-take-action::before{
  content:""; }

.bp3-icon-taxi::before{
  content:""; }

.bp3-icon-text-highlight::before{
  content:""; }

.bp3-icon-th::before{
  content:""; }

.bp3-icon-th-derived::before{
  content:""; }

.bp3-icon-th-disconnect::before{
  content:""; }

.bp3-icon-th-filtered::before{
  content:""; }

.bp3-icon-th-list::before{
  content:""; }

.bp3-icon-thumbs-down::before{
  content:""; }

.bp3-icon-thumbs-up::before{
  content:""; }

.bp3-icon-tick::before{
  content:"✓"; }

.bp3-icon-tick-circle::before{
  content:""; }

.bp3-icon-time::before{
  content:"⏲"; }

.bp3-icon-timeline-area-chart::before{
  content:""; }

.bp3-icon-timeline-bar-chart::before{
  content:""; }

.bp3-icon-timeline-events::before{
  content:""; }

.bp3-icon-timeline-line-chart::before{
  content:""; }

.bp3-icon-tint::before{
  content:""; }

.bp3-icon-torch::before{
  content:""; }

.bp3-icon-tractor::before{
  content:""; }

.bp3-icon-train::before{
  content:""; }

.bp3-icon-translate::before{
  content:""; }

.bp3-icon-trash::before{
  content:""; }

.bp3-icon-tree::before{
  content:""; }

.bp3-icon-trending-down::before{
  content:""; }

.bp3-icon-trending-up::before{
  content:""; }

.bp3-icon-truck::before{
  content:""; }

.bp3-icon-two-columns::before{
  content:""; }

.bp3-icon-unarchive::before{
  content:""; }

.bp3-icon-underline::before{
  content:"⎁"; }

.bp3-icon-undo::before{
  content:"⎌"; }

.bp3-icon-ungroup-objects::before{
  content:""; }

.bp3-icon-unknown-vehicle::before{
  content:""; }

.bp3-icon-unlock::before{
  content:""; }

.bp3-icon-unpin::before{
  content:""; }

.bp3-icon-unresolve::before{
  content:""; }

.bp3-icon-updated::before{
  content:""; }

.bp3-icon-upload::before{
  content:""; }

.bp3-icon-user::before{
  content:""; }

.bp3-icon-variable::before{
  content:""; }

.bp3-icon-vertical-bar-chart-asc::before{
  content:""; }

.bp3-icon-vertical-bar-chart-desc::before{
  content:""; }

.bp3-icon-vertical-distribution::before{
  content:""; }

.bp3-icon-video::before{
  content:""; }

.bp3-icon-volume-down::before{
  content:""; }

.bp3-icon-volume-off::before{
  content:""; }

.bp3-icon-volume-up::before{
  content:""; }

.bp3-icon-walk::before{
  content:""; }

.bp3-icon-warning-sign::before{
  content:""; }

.bp3-icon-waterfall-chart::before{
  content:""; }

.bp3-icon-widget::before{
  content:""; }

.bp3-icon-widget-button::before{
  content:""; }

.bp3-icon-widget-footer::before{
  content:""; }

.bp3-icon-widget-header::before{
  content:""; }

.bp3-icon-wrench::before{
  content:""; }

.bp3-icon-zoom-in::before{
  content:""; }

.bp3-icon-zoom-out::before{
  content:""; }

.bp3-icon-zoom-to-fit::before{
  content:""; }
.bp3-submenu > .bp3-popover-wrapper{
  display:block; }

.bp3-submenu .bp3-popover-target{
  display:block; }
  .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-menu-item{ }

.bp3-submenu.bp3-popover{
  -webkit-box-shadow:none;
          box-shadow:none;
  padding:0 5px; }
  .bp3-submenu.bp3-popover > .bp3-popover-content{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2); }
  .bp3-dark .bp3-submenu.bp3-popover, .bp3-submenu.bp3-popover.bp3-dark{
    -webkit-box-shadow:none;
            box-shadow:none; }
    .bp3-dark .bp3-submenu.bp3-popover > .bp3-popover-content, .bp3-submenu.bp3-popover.bp3-dark > .bp3-popover-content{
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4); }
.bp3-menu{
  background:#ffffff;
  border-radius:3px;
  color:#182026;
  list-style:none;
  margin:0;
  min-width:180px;
  padding:5px;
  text-align:left; }

.bp3-menu-divider{
  border-top:1px solid rgba(16, 22, 26, 0.15);
  display:block;
  margin:5px; }
  .bp3-dark .bp3-menu-divider{
    border-top-color:rgba(255, 255, 255, 0.15); }

.bp3-menu-item{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:horizontal;
  -webkit-box-direction:normal;
      -ms-flex-direction:row;
          flex-direction:row;
  -webkit-box-align:start;
      -ms-flex-align:start;
          align-items:flex-start;
  border-radius:2px;
  color:inherit;
  line-height:20px;
  padding:5px 7px;
  text-decoration:none;
  -webkit-user-select:none;
     -moz-user-select:none;
      -ms-user-select:none;
          user-select:none; }
  .bp3-menu-item > *{
    -webkit-box-flex:0;
        -ms-flex-positive:0;
            flex-grow:0;
    -ms-flex-negative:0;
        flex-shrink:0; }
  .bp3-menu-item > .bp3-fill{
    -webkit-box-flex:1;
        -ms-flex-positive:1;
            flex-grow:1;
    -ms-flex-negative:1;
        flex-shrink:1; }
  .bp3-menu-item::before,
  .bp3-menu-item > *{
    margin-right:7px; }
  .bp3-menu-item:empty::before,
  .bp3-menu-item > :last-child{
    margin-right:0; }
  .bp3-menu-item > .bp3-fill{
    word-break:break-word; }
  .bp3-menu-item:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-menu-item{
    background-color:rgba(167, 182, 194, 0.3);
    cursor:pointer;
    text-decoration:none; }
  .bp3-menu-item.bp3-disabled{
    background-color:inherit;
    color:rgba(92, 112, 128, 0.6);
    cursor:not-allowed; }
  .bp3-dark .bp3-menu-item{
    color:inherit; }
    .bp3-dark .bp3-menu-item:hover, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-menu-item, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-menu-item{
      background-color:rgba(138, 155, 168, 0.15);
      color:inherit; }
    .bp3-dark .bp3-menu-item.bp3-disabled{
      background-color:inherit;
      color:rgba(167, 182, 194, 0.6); }
  .bp3-menu-item.bp3-intent-primary{
    color:#106ba3; }
    .bp3-menu-item.bp3-intent-primary .bp3-icon{
      color:inherit; }
    .bp3-menu-item.bp3-intent-primary::before, .bp3-menu-item.bp3-intent-primary::after,
    .bp3-menu-item.bp3-intent-primary .bp3-menu-item-label{
      color:#106ba3; }
    .bp3-menu-item.bp3-intent-primary:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item, .bp3-menu-item.bp3-intent-primary.bp3-active{
      background-color:#137cbd; }
    .bp3-menu-item.bp3-intent-primary:active{
      background-color:#106ba3; }
    .bp3-menu-item.bp3-intent-primary:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item, .bp3-menu-item.bp3-intent-primary:hover::before, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item::before, .bp3-menu-item.bp3-intent-primary:hover::after, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item::after,
    .bp3-menu-item.bp3-intent-primary:hover .bp3-menu-item-label,
    .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item .bp3-menu-item-label, .bp3-menu-item.bp3-intent-primary:active, .bp3-menu-item.bp3-intent-primary:active::before, .bp3-menu-item.bp3-intent-primary:active::after,
    .bp3-menu-item.bp3-intent-primary:active .bp3-menu-item-label, .bp3-menu-item.bp3-intent-primary.bp3-active, .bp3-menu-item.bp3-intent-primary.bp3-active::before, .bp3-menu-item.bp3-intent-primary.bp3-active::after,
    .bp3-menu-item.bp3-intent-primary.bp3-active .bp3-menu-item-label{
      color:#ffffff; }
  .bp3-menu-item.bp3-intent-success{
    color:#0d8050; }
    .bp3-menu-item.bp3-intent-success .bp3-icon{
      color:inherit; }
    .bp3-menu-item.bp3-intent-success::before, .bp3-menu-item.bp3-intent-success::after,
    .bp3-menu-item.bp3-intent-success .bp3-menu-item-label{
      color:#0d8050; }
    .bp3-menu-item.bp3-intent-success:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item, .bp3-menu-item.bp3-intent-success.bp3-active{
      background-color:#0f9960; }
    .bp3-menu-item.bp3-intent-success:active{
      background-color:#0d8050; }
    .bp3-menu-item.bp3-intent-success:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item, .bp3-menu-item.bp3-intent-success:hover::before, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item::before, .bp3-menu-item.bp3-intent-success:hover::after, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item::after,
    .bp3-menu-item.bp3-intent-success:hover .bp3-menu-item-label,
    .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item .bp3-menu-item-label, .bp3-menu-item.bp3-intent-success:active, .bp3-menu-item.bp3-intent-success:active::before, .bp3-menu-item.bp3-intent-success:active::after,
    .bp3-menu-item.bp3-intent-success:active .bp3-menu-item-label, .bp3-menu-item.bp3-intent-success.bp3-active, .bp3-menu-item.bp3-intent-success.bp3-active::before, .bp3-menu-item.bp3-intent-success.bp3-active::after,
    .bp3-menu-item.bp3-intent-success.bp3-active .bp3-menu-item-label{
      color:#ffffff; }
  .bp3-menu-item.bp3-intent-warning{
    color:#bf7326; }
    .bp3-menu-item.bp3-intent-warning .bp3-icon{
      color:inherit; }
    .bp3-menu-item.bp3-intent-warning::before, .bp3-menu-item.bp3-intent-warning::after,
    .bp3-menu-item.bp3-intent-warning .bp3-menu-item-label{
      color:#bf7326; }
    .bp3-menu-item.bp3-intent-warning:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item, .bp3-menu-item.bp3-intent-warning.bp3-active{
      background-color:#d9822b; }
    .bp3-menu-item.bp3-intent-warning:active{
      background-color:#bf7326; }
    .bp3-menu-item.bp3-intent-warning:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item, .bp3-menu-item.bp3-intent-warning:hover::before, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item::before, .bp3-menu-item.bp3-intent-warning:hover::after, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item::after,
    .bp3-menu-item.bp3-intent-warning:hover .bp3-menu-item-label,
    .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item .bp3-menu-item-label, .bp3-menu-item.bp3-intent-warning:active, .bp3-menu-item.bp3-intent-warning:active::before, .bp3-menu-item.bp3-intent-warning:active::after,
    .bp3-menu-item.bp3-intent-warning:active .bp3-menu-item-label, .bp3-menu-item.bp3-intent-warning.bp3-active, .bp3-menu-item.bp3-intent-warning.bp3-active::before, .bp3-menu-item.bp3-intent-warning.bp3-active::after,
    .bp3-menu-item.bp3-intent-warning.bp3-active .bp3-menu-item-label{
      color:#ffffff; }
  .bp3-menu-item.bp3-intent-danger{
    color:#c23030; }
    .bp3-menu-item.bp3-intent-danger .bp3-icon{
      color:inherit; }
    .bp3-menu-item.bp3-intent-danger::before, .bp3-menu-item.bp3-intent-danger::after,
    .bp3-menu-item.bp3-intent-danger .bp3-menu-item-label{
      color:#c23030; }
    .bp3-menu-item.bp3-intent-danger:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item, .bp3-menu-item.bp3-intent-danger.bp3-active{
      background-color:#db3737; }
    .bp3-menu-item.bp3-intent-danger:active{
      background-color:#c23030; }
    .bp3-menu-item.bp3-intent-danger:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item, .bp3-menu-item.bp3-intent-danger:hover::before, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item::before, .bp3-menu-item.bp3-intent-danger:hover::after, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item::after,
    .bp3-menu-item.bp3-intent-danger:hover .bp3-menu-item-label,
    .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item .bp3-menu-item-label, .bp3-menu-item.bp3-intent-danger:active, .bp3-menu-item.bp3-intent-danger:active::before, .bp3-menu-item.bp3-intent-danger:active::after,
    .bp3-menu-item.bp3-intent-danger:active .bp3-menu-item-label, .bp3-menu-item.bp3-intent-danger.bp3-active, .bp3-menu-item.bp3-intent-danger.bp3-active::before, .bp3-menu-item.bp3-intent-danger.bp3-active::after,
    .bp3-menu-item.bp3-intent-danger.bp3-active .bp3-menu-item-label{
      color:#ffffff; }
  .bp3-menu-item::before{
    font-family:"Icons16", sans-serif;
    font-size:16px;
    font-style:normal;
    font-weight:400;
    line-height:1;
    -moz-osx-font-smoothing:grayscale;
    -webkit-font-smoothing:antialiased;
    margin-right:7px; }
  .bp3-menu-item::before,
  .bp3-menu-item > .bp3-icon{
    color:#5c7080;
    margin-top:2px; }
  .bp3-menu-item .bp3-menu-item-label{
    color:#5c7080; }
  .bp3-menu-item:hover, .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-menu-item{
    color:inherit; }
  .bp3-menu-item.bp3-active, .bp3-menu-item:active{
    background-color:rgba(115, 134, 148, 0.3); }
  .bp3-menu-item.bp3-disabled{
    background-color:inherit !important;
    color:rgba(92, 112, 128, 0.6) !important;
    cursor:not-allowed !important;
    outline:none !important; }
    .bp3-menu-item.bp3-disabled::before,
    .bp3-menu-item.bp3-disabled > .bp3-icon,
    .bp3-menu-item.bp3-disabled .bp3-menu-item-label{
      color:rgba(92, 112, 128, 0.6) !important; }
  .bp3-large .bp3-menu-item{
    font-size:16px;
    line-height:22px;
    padding:9px 7px; }
    .bp3-large .bp3-menu-item .bp3-icon{
      margin-top:3px; }
    .bp3-large .bp3-menu-item::before{
      font-family:"Icons20", sans-serif;
      font-size:20px;
      font-style:normal;
      font-weight:400;
      line-height:1;
      -moz-osx-font-smoothing:grayscale;
      -webkit-font-smoothing:antialiased;
      margin-right:10px;
      margin-top:1px; }

button.bp3-menu-item{
  background:none;
  border:none;
  text-align:left;
  width:100%; }
.bp3-menu-header{
  border-top:1px solid rgba(16, 22, 26, 0.15);
  display:block;
  margin:5px;
  cursor:default;
  padding-left:2px; }
  .bp3-dark .bp3-menu-header{
    border-top-color:rgba(255, 255, 255, 0.15); }
  .bp3-menu-header:first-of-type{
    border-top:none; }
  .bp3-menu-header > h6{
    color:#182026;
    font-weight:600;
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
    word-wrap:normal;
    line-height:17px;
    margin:0;
    padding:10px 7px 0 1px; }
    .bp3-dark .bp3-menu-header > h6{
      color:#f5f8fa; }
  .bp3-menu-header:first-of-type > h6{
    padding-top:0; }
  .bp3-large .bp3-menu-header > h6{
    font-size:18px;
    padding-bottom:5px;
    padding-top:15px; }
  .bp3-large .bp3-menu-header:first-of-type > h6{
    padding-top:0; }

.bp3-dark .bp3-menu{
  background:#30404d;
  color:#f5f8fa; }

.bp3-dark .bp3-menu-item{ }
  .bp3-dark .bp3-menu-item.bp3-intent-primary{
    color:#48aff0; }
    .bp3-dark .bp3-menu-item.bp3-intent-primary .bp3-icon{
      color:inherit; }
    .bp3-dark .bp3-menu-item.bp3-intent-primary::before, .bp3-dark .bp3-menu-item.bp3-intent-primary::after,
    .bp3-dark .bp3-menu-item.bp3-intent-primary .bp3-menu-item-label{
      color:#48aff0; }
    .bp3-dark .bp3-menu-item.bp3-intent-primary:hover, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item, .bp3-dark .bp3-menu-item.bp3-intent-primary.bp3-active{
      background-color:#137cbd; }
    .bp3-dark .bp3-menu-item.bp3-intent-primary:active{
      background-color:#106ba3; }
    .bp3-dark .bp3-menu-item.bp3-intent-primary:hover, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item, .bp3-dark .bp3-menu-item.bp3-intent-primary:hover::before, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item::before, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item::before, .bp3-dark .bp3-menu-item.bp3-intent-primary:hover::after, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item::after, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item::after,
    .bp3-dark .bp3-menu-item.bp3-intent-primary:hover .bp3-menu-item-label,
    .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item .bp3-menu-item-label,
    .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-primary.bp3-menu-item .bp3-menu-item-label, .bp3-dark .bp3-menu-item.bp3-intent-primary:active, .bp3-dark .bp3-menu-item.bp3-intent-primary:active::before, .bp3-dark .bp3-menu-item.bp3-intent-primary:active::after,
    .bp3-dark .bp3-menu-item.bp3-intent-primary:active .bp3-menu-item-label, .bp3-dark .bp3-menu-item.bp3-intent-primary.bp3-active, .bp3-dark .bp3-menu-item.bp3-intent-primary.bp3-active::before, .bp3-dark .bp3-menu-item.bp3-intent-primary.bp3-active::after,
    .bp3-dark .bp3-menu-item.bp3-intent-primary.bp3-active .bp3-menu-item-label{
      color:#ffffff; }
  .bp3-dark .bp3-menu-item.bp3-intent-success{
    color:#3dcc91; }
    .bp3-dark .bp3-menu-item.bp3-intent-success .bp3-icon{
      color:inherit; }
    .bp3-dark .bp3-menu-item.bp3-intent-success::before, .bp3-dark .bp3-menu-item.bp3-intent-success::after,
    .bp3-dark .bp3-menu-item.bp3-intent-success .bp3-menu-item-label{
      color:#3dcc91; }
    .bp3-dark .bp3-menu-item.bp3-intent-success:hover, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item, .bp3-dark .bp3-menu-item.bp3-intent-success.bp3-active{
      background-color:#0f9960; }
    .bp3-dark .bp3-menu-item.bp3-intent-success:active{
      background-color:#0d8050; }
    .bp3-dark .bp3-menu-item.bp3-intent-success:hover, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item, .bp3-dark .bp3-menu-item.bp3-intent-success:hover::before, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item::before, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item::before, .bp3-dark .bp3-menu-item.bp3-intent-success:hover::after, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item::after, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item::after,
    .bp3-dark .bp3-menu-item.bp3-intent-success:hover .bp3-menu-item-label,
    .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item .bp3-menu-item-label,
    .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-success.bp3-menu-item .bp3-menu-item-label, .bp3-dark .bp3-menu-item.bp3-intent-success:active, .bp3-dark .bp3-menu-item.bp3-intent-success:active::before, .bp3-dark .bp3-menu-item.bp3-intent-success:active::after,
    .bp3-dark .bp3-menu-item.bp3-intent-success:active .bp3-menu-item-label, .bp3-dark .bp3-menu-item.bp3-intent-success.bp3-active, .bp3-dark .bp3-menu-item.bp3-intent-success.bp3-active::before, .bp3-dark .bp3-menu-item.bp3-intent-success.bp3-active::after,
    .bp3-dark .bp3-menu-item.bp3-intent-success.bp3-active .bp3-menu-item-label{
      color:#ffffff; }
  .bp3-dark .bp3-menu-item.bp3-intent-warning{
    color:#ffb366; }
    .bp3-dark .bp3-menu-item.bp3-intent-warning .bp3-icon{
      color:inherit; }
    .bp3-dark .bp3-menu-item.bp3-intent-warning::before, .bp3-dark .bp3-menu-item.bp3-intent-warning::after,
    .bp3-dark .bp3-menu-item.bp3-intent-warning .bp3-menu-item-label{
      color:#ffb366; }
    .bp3-dark .bp3-menu-item.bp3-intent-warning:hover, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item, .bp3-dark .bp3-menu-item.bp3-intent-warning.bp3-active{
      background-color:#d9822b; }
    .bp3-dark .bp3-menu-item.bp3-intent-warning:active{
      background-color:#bf7326; }
    .bp3-dark .bp3-menu-item.bp3-intent-warning:hover, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item, .bp3-dark .bp3-menu-item.bp3-intent-warning:hover::before, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item::before, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item::before, .bp3-dark .bp3-menu-item.bp3-intent-warning:hover::after, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item::after, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item::after,
    .bp3-dark .bp3-menu-item.bp3-intent-warning:hover .bp3-menu-item-label,
    .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item .bp3-menu-item-label,
    .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-warning.bp3-menu-item .bp3-menu-item-label, .bp3-dark .bp3-menu-item.bp3-intent-warning:active, .bp3-dark .bp3-menu-item.bp3-intent-warning:active::before, .bp3-dark .bp3-menu-item.bp3-intent-warning:active::after,
    .bp3-dark .bp3-menu-item.bp3-intent-warning:active .bp3-menu-item-label, .bp3-dark .bp3-menu-item.bp3-intent-warning.bp3-active, .bp3-dark .bp3-menu-item.bp3-intent-warning.bp3-active::before, .bp3-dark .bp3-menu-item.bp3-intent-warning.bp3-active::after,
    .bp3-dark .bp3-menu-item.bp3-intent-warning.bp3-active .bp3-menu-item-label{
      color:#ffffff; }
  .bp3-dark .bp3-menu-item.bp3-intent-danger{
    color:#ff7373; }
    .bp3-dark .bp3-menu-item.bp3-intent-danger .bp3-icon{
      color:inherit; }
    .bp3-dark .bp3-menu-item.bp3-intent-danger::before, .bp3-dark .bp3-menu-item.bp3-intent-danger::after,
    .bp3-dark .bp3-menu-item.bp3-intent-danger .bp3-menu-item-label{
      color:#ff7373; }
    .bp3-dark .bp3-menu-item.bp3-intent-danger:hover, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item, .bp3-dark .bp3-menu-item.bp3-intent-danger.bp3-active{
      background-color:#db3737; }
    .bp3-dark .bp3-menu-item.bp3-intent-danger:active{
      background-color:#c23030; }
    .bp3-dark .bp3-menu-item.bp3-intent-danger:hover, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item, .bp3-dark .bp3-menu-item.bp3-intent-danger:hover::before, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item::before, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item::before, .bp3-dark .bp3-menu-item.bp3-intent-danger:hover::after, .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item::after, .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item::after,
    .bp3-dark .bp3-menu-item.bp3-intent-danger:hover .bp3-menu-item-label,
    .bp3-dark .bp3-submenu .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item .bp3-menu-item-label,
    .bp3-submenu .bp3-dark .bp3-popover-target.bp3-popover-open > .bp3-intent-danger.bp3-menu-item .bp3-menu-item-label, .bp3-dark .bp3-menu-item.bp3-intent-danger:active, .bp3-dark .bp3-menu-item.bp3-intent-danger:active::before, .bp3-dark .bp3-menu-item.bp3-intent-danger:active::after,
    .bp3-dark .bp3-menu-item.bp3-intent-danger:active .bp3-menu-item-label, .bp3-dark .bp3-menu-item.bp3-intent-danger.bp3-active, .bp3-dark .bp3-menu-item.bp3-intent-danger.bp3-active::before, .bp3-dark .bp3-menu-item.bp3-intent-danger.bp3-active::after,
    .bp3-dark .bp3-menu-item.bp3-intent-danger.bp3-active .bp3-menu-item-label{
      color:#ffffff; }
  .bp3-dark .bp3-menu-item::before,
  .bp3-dark .bp3-menu-item > .bp3-icon{
    color:#a7b6c2; }
  .bp3-dark .bp3-menu-item .bp3-menu-item-label{
    color:#a7b6c2; }
  .bp3-dark .bp3-menu-item.bp3-active, .bp3-dark .bp3-menu-item:active{
    background-color:rgba(138, 155, 168, 0.3); }
  .bp3-dark .bp3-menu-item.bp3-disabled{
    color:rgba(167, 182, 194, 0.6) !important; }
    .bp3-dark .bp3-menu-item.bp3-disabled::before,
    .bp3-dark .bp3-menu-item.bp3-disabled > .bp3-icon,
    .bp3-dark .bp3-menu-item.bp3-disabled .bp3-menu-item-label{
      color:rgba(167, 182, 194, 0.6) !important; }

.bp3-dark .bp3-menu-divider,
.bp3-dark .bp3-menu-header{
  border-color:rgba(255, 255, 255, 0.15); }

.bp3-dark .bp3-menu-header > h6{
  color:#f5f8fa; }

.bp3-label .bp3-menu{
  margin-top:5px; }
.bp3-navbar{
  background-color:#ffffff;
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.2);
  height:50px;
  padding:0 15px;
  position:relative;
  width:100%;
  z-index:10; }
  .bp3-navbar.bp3-dark,
  .bp3-dark .bp3-navbar{
    background-color:#394b59; }
  .bp3-navbar.bp3-dark{
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4); }
  .bp3-dark .bp3-navbar{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 0 0 rgba(16, 22, 26, 0), 0 1px 1px rgba(16, 22, 26, 0.4); }
  .bp3-navbar.bp3-fixed-top{
    left:0;
    position:fixed;
    right:0;
    top:0; }

.bp3-navbar-heading{
  font-size:16px;
  margin-right:15px; }

.bp3-navbar-group{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  height:50px; }
  .bp3-navbar-group.bp3-align-left{
    float:left; }
  .bp3-navbar-group.bp3-align-right{
    float:right; }

.bp3-navbar-divider{
  border-left:1px solid rgba(16, 22, 26, 0.15);
  height:20px;
  margin:0 10px; }
  .bp3-dark .bp3-navbar-divider{
    border-left-color:rgba(255, 255, 255, 0.15); }
.bp3-non-ideal-state{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:vertical;
  -webkit-box-direction:normal;
      -ms-flex-direction:column;
          flex-direction:column;
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  height:100%;
  -webkit-box-pack:center;
      -ms-flex-pack:center;
          justify-content:center;
  text-align:center;
  width:100%; }
  .bp3-non-ideal-state > *{
    -webkit-box-flex:0;
        -ms-flex-positive:0;
            flex-grow:0;
    -ms-flex-negative:0;
        flex-shrink:0; }
  .bp3-non-ideal-state > .bp3-fill{
    -webkit-box-flex:1;
        -ms-flex-positive:1;
            flex-grow:1;
    -ms-flex-negative:1;
        flex-shrink:1; }
  .bp3-non-ideal-state::before,
  .bp3-non-ideal-state > *{
    margin-bottom:20px; }
  .bp3-non-ideal-state:empty::before,
  .bp3-non-ideal-state > :last-child{
    margin-bottom:0; }
  .bp3-non-ideal-state > *{
    max-width:400px; }

.bp3-non-ideal-state-visual{
  color:rgba(92, 112, 128, 0.6);
  font-size:60px; }
  .bp3-dark .bp3-non-ideal-state-visual{
    color:rgba(167, 182, 194, 0.6); }

.bp3-overflow-list{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -ms-flex-wrap:nowrap;
      flex-wrap:nowrap;
  min-width:0; }

.bp3-overflow-list-spacer{
  -ms-flex-negative:1;
      flex-shrink:1;
  width:1px; }

body.bp3-overlay-open{
  overflow:hidden; }

.bp3-overlay{
  bottom:0;
  left:0;
  position:static;
  right:0;
  top:0;
  z-index:20; }
  .bp3-overlay:not(.bp3-overlay-open){
    pointer-events:none; }
  .bp3-overlay.bp3-overlay-container{
    overflow:hidden;
    position:fixed; }
    .bp3-overlay.bp3-overlay-container.bp3-overlay-inline{
      position:absolute; }
  .bp3-overlay.bp3-overlay-scroll-container{
    overflow:auto;
    position:fixed; }
    .bp3-overlay.bp3-overlay-scroll-container.bp3-overlay-inline{
      position:absolute; }
  .bp3-overlay.bp3-overlay-inline{
    display:inline;
    overflow:visible; }

.bp3-overlay-content{
  position:fixed;
  z-index:20; }
  .bp3-overlay-inline .bp3-overlay-content,
  .bp3-overlay-scroll-container .bp3-overlay-content{
    position:absolute; }

.bp3-overlay-backdrop{
  bottom:0;
  left:0;
  position:fixed;
  right:0;
  top:0;
  opacity:1;
  background-color:rgba(16, 22, 26, 0.7);
  overflow:auto;
  -webkit-user-select:none;
     -moz-user-select:none;
      -ms-user-select:none;
          user-select:none;
  z-index:20; }
  .bp3-overlay-backdrop.bp3-overlay-enter, .bp3-overlay-backdrop.bp3-overlay-appear{
    opacity:0; }
  .bp3-overlay-backdrop.bp3-overlay-enter-active, .bp3-overlay-backdrop.bp3-overlay-appear-active{
    opacity:1;
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:200ms;
            transition-duration:200ms;
    -webkit-transition-property:opacity;
    transition-property:opacity;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-overlay-backdrop.bp3-overlay-exit{
    opacity:1; }
  .bp3-overlay-backdrop.bp3-overlay-exit-active{
    opacity:0;
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:200ms;
            transition-duration:200ms;
    -webkit-transition-property:opacity;
    transition-property:opacity;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-overlay-backdrop:focus{
    outline:none; }
  .bp3-overlay-inline .bp3-overlay-backdrop{
    position:absolute; }
.bp3-panel-stack{
  overflow:hidden;
  position:relative; }

.bp3-panel-stack-header{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  -webkit-box-shadow:0 1px rgba(16, 22, 26, 0.15);
          box-shadow:0 1px rgba(16, 22, 26, 0.15);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -ms-flex-negative:0;
      flex-shrink:0;
  height:30px;
  z-index:1; }
  .bp3-dark .bp3-panel-stack-header{
    -webkit-box-shadow:0 1px rgba(255, 255, 255, 0.15);
            box-shadow:0 1px rgba(255, 255, 255, 0.15); }
  .bp3-panel-stack-header > span{
    -webkit-box-align:stretch;
        -ms-flex-align:stretch;
            align-items:stretch;
    display:-webkit-box;
    display:-ms-flexbox;
    display:flex;
    -webkit-box-flex:1;
        -ms-flex:1;
            flex:1; }
  .bp3-panel-stack-header .bp3-heading{
    margin:0 5px; }

.bp3-button.bp3-panel-stack-header-back{
  margin-left:5px;
  padding-left:0;
  white-space:nowrap; }
  .bp3-button.bp3-panel-stack-header-back .bp3-icon{
    margin:0 2px; }

.bp3-panel-stack-view{
  bottom:0;
  left:0;
  position:absolute;
  right:0;
  top:0;
  background-color:#ffffff;
  border-right:1px solid rgba(16, 22, 26, 0.15);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:vertical;
  -webkit-box-direction:normal;
      -ms-flex-direction:column;
          flex-direction:column;
  margin-right:-1px;
  overflow-y:auto;
  z-index:1; }
  .bp3-dark .bp3-panel-stack-view{
    background-color:#30404d; }
  .bp3-panel-stack-view:nth-last-child(n + 4){
    display:none; }

.bp3-panel-stack-push .bp3-panel-stack-enter, .bp3-panel-stack-push .bp3-panel-stack-appear{
  -webkit-transform:translateX(100%);
          transform:translateX(100%);
  opacity:0; }

.bp3-panel-stack-push .bp3-panel-stack-enter-active, .bp3-panel-stack-push .bp3-panel-stack-appear-active{
  -webkit-transform:translate(0%);
          transform:translate(0%);
  opacity:1;
  -webkit-transition-delay:0;
          transition-delay:0;
  -webkit-transition-duration:400ms;
          transition-duration:400ms;
  -webkit-transition-property:opacity, -webkit-transform;
  transition-property:opacity, -webkit-transform;
  transition-property:transform, opacity;
  transition-property:transform, opacity, -webkit-transform;
  -webkit-transition-timing-function:ease;
          transition-timing-function:ease; }

.bp3-panel-stack-push .bp3-panel-stack-exit{
  -webkit-transform:translate(0%);
          transform:translate(0%);
  opacity:1; }

.bp3-panel-stack-push .bp3-panel-stack-exit-active{
  -webkit-transform:translateX(-50%);
          transform:translateX(-50%);
  opacity:0;
  -webkit-transition-delay:0;
          transition-delay:0;
  -webkit-transition-duration:400ms;
          transition-duration:400ms;
  -webkit-transition-property:opacity, -webkit-transform;
  transition-property:opacity, -webkit-transform;
  transition-property:transform, opacity;
  transition-property:transform, opacity, -webkit-transform;
  -webkit-transition-timing-function:ease;
          transition-timing-function:ease; }

.bp3-panel-stack-pop .bp3-panel-stack-enter, .bp3-panel-stack-pop .bp3-panel-stack-appear{
  -webkit-transform:translateX(-50%);
          transform:translateX(-50%);
  opacity:0; }

.bp3-panel-stack-pop .bp3-panel-stack-enter-active, .bp3-panel-stack-pop .bp3-panel-stack-appear-active{
  -webkit-transform:translate(0%);
          transform:translate(0%);
  opacity:1;
  -webkit-transition-delay:0;
          transition-delay:0;
  -webkit-transition-duration:400ms;
          transition-duration:400ms;
  -webkit-transition-property:opacity, -webkit-transform;
  transition-property:opacity, -webkit-transform;
  transition-property:transform, opacity;
  transition-property:transform, opacity, -webkit-transform;
  -webkit-transition-timing-function:ease;
          transition-timing-function:ease; }

.bp3-panel-stack-pop .bp3-panel-stack-exit{
  -webkit-transform:translate(0%);
          transform:translate(0%);
  opacity:1; }

.bp3-panel-stack-pop .bp3-panel-stack-exit-active{
  -webkit-transform:translateX(100%);
          transform:translateX(100%);
  opacity:0;
  -webkit-transition-delay:0;
          transition-delay:0;
  -webkit-transition-duration:400ms;
          transition-duration:400ms;
  -webkit-transition-property:opacity, -webkit-transform;
  transition-property:opacity, -webkit-transform;
  transition-property:transform, opacity;
  transition-property:transform, opacity, -webkit-transform;
  -webkit-transition-timing-function:ease;
          transition-timing-function:ease; }
.bp3-panel-stack2{
  overflow:hidden;
  position:relative; }

.bp3-panel-stack2-header{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  -webkit-box-shadow:0 1px rgba(16, 22, 26, 0.15);
          box-shadow:0 1px rgba(16, 22, 26, 0.15);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -ms-flex-negative:0;
      flex-shrink:0;
  height:30px;
  z-index:1; }
  .bp3-dark .bp3-panel-stack2-header{
    -webkit-box-shadow:0 1px rgba(255, 255, 255, 0.15);
            box-shadow:0 1px rgba(255, 255, 255, 0.15); }
  .bp3-panel-stack2-header > span{
    -webkit-box-align:stretch;
        -ms-flex-align:stretch;
            align-items:stretch;
    display:-webkit-box;
    display:-ms-flexbox;
    display:flex;
    -webkit-box-flex:1;
        -ms-flex:1;
            flex:1; }
  .bp3-panel-stack2-header .bp3-heading{
    margin:0 5px; }

.bp3-button.bp3-panel-stack2-header-back{
  margin-left:5px;
  padding-left:0;
  white-space:nowrap; }
  .bp3-button.bp3-panel-stack2-header-back .bp3-icon{
    margin:0 2px; }

.bp3-panel-stack2-view{
  bottom:0;
  left:0;
  position:absolute;
  right:0;
  top:0;
  background-color:#ffffff;
  border-right:1px solid rgba(16, 22, 26, 0.15);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:vertical;
  -webkit-box-direction:normal;
      -ms-flex-direction:column;
          flex-direction:column;
  margin-right:-1px;
  overflow-y:auto;
  z-index:1; }
  .bp3-dark .bp3-panel-stack2-view{
    background-color:#30404d; }
  .bp3-panel-stack2-view:nth-last-child(n + 4){
    display:none; }

.bp3-panel-stack2-push .bp3-panel-stack2-enter, .bp3-panel-stack2-push .bp3-panel-stack2-appear{
  -webkit-transform:translateX(100%);
          transform:translateX(100%);
  opacity:0; }

.bp3-panel-stack2-push .bp3-panel-stack2-enter-active, .bp3-panel-stack2-push .bp3-panel-stack2-appear-active{
  -webkit-transform:translate(0%);
          transform:translate(0%);
  opacity:1;
  -webkit-transition-delay:0;
          transition-delay:0;
  -webkit-transition-duration:400ms;
          transition-duration:400ms;
  -webkit-transition-property:opacity, -webkit-transform;
  transition-property:opacity, -webkit-transform;
  transition-property:transform, opacity;
  transition-property:transform, opacity, -webkit-transform;
  -webkit-transition-timing-function:ease;
          transition-timing-function:ease; }

.bp3-panel-stack2-push .bp3-panel-stack2-exit{
  -webkit-transform:translate(0%);
          transform:translate(0%);
  opacity:1; }

.bp3-panel-stack2-push .bp3-panel-stack2-exit-active{
  -webkit-transform:translateX(-50%);
          transform:translateX(-50%);
  opacity:0;
  -webkit-transition-delay:0;
          transition-delay:0;
  -webkit-transition-duration:400ms;
          transition-duration:400ms;
  -webkit-transition-property:opacity, -webkit-transform;
  transition-property:opacity, -webkit-transform;
  transition-property:transform, opacity;
  transition-property:transform, opacity, -webkit-transform;
  -webkit-transition-timing-function:ease;
          transition-timing-function:ease; }

.bp3-panel-stack2-pop .bp3-panel-stack2-enter, .bp3-panel-stack2-pop .bp3-panel-stack2-appear{
  -webkit-transform:translateX(-50%);
          transform:translateX(-50%);
  opacity:0; }

.bp3-panel-stack2-pop .bp3-panel-stack2-enter-active, .bp3-panel-stack2-pop .bp3-panel-stack2-appear-active{
  -webkit-transform:translate(0%);
          transform:translate(0%);
  opacity:1;
  -webkit-transition-delay:0;
          transition-delay:0;
  -webkit-transition-duration:400ms;
          transition-duration:400ms;
  -webkit-transition-property:opacity, -webkit-transform;
  transition-property:opacity, -webkit-transform;
  transition-property:transform, opacity;
  transition-property:transform, opacity, -webkit-transform;
  -webkit-transition-timing-function:ease;
          transition-timing-function:ease; }

.bp3-panel-stack2-pop .bp3-panel-stack2-exit{
  -webkit-transform:translate(0%);
          transform:translate(0%);
  opacity:1; }

.bp3-panel-stack2-pop .bp3-panel-stack2-exit-active{
  -webkit-transform:translateX(100%);
          transform:translateX(100%);
  opacity:0;
  -webkit-transition-delay:0;
          transition-delay:0;
  -webkit-transition-duration:400ms;
          transition-duration:400ms;
  -webkit-transition-property:opacity, -webkit-transform;
  transition-property:opacity, -webkit-transform;
  transition-property:transform, opacity;
  transition-property:transform, opacity, -webkit-transform;
  -webkit-transition-timing-function:ease;
          transition-timing-function:ease; }
.bp3-popover{
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
  -webkit-transform:scale(1);
          transform:scale(1);
  border-radius:3px;
  display:inline-block;
  z-index:20; }
  .bp3-popover .bp3-popover-arrow{
    height:30px;
    position:absolute;
    width:30px; }
    .bp3-popover .bp3-popover-arrow::before{
      height:20px;
      margin:5px;
      width:20px; }
  .bp3-tether-element-attached-bottom.bp3-tether-target-attached-top > .bp3-popover{
    margin-bottom:17px;
    margin-top:-17px; }
    .bp3-tether-element-attached-bottom.bp3-tether-target-attached-top > .bp3-popover > .bp3-popover-arrow{
      bottom:-11px; }
      .bp3-tether-element-attached-bottom.bp3-tether-target-attached-top > .bp3-popover > .bp3-popover-arrow svg{
        -webkit-transform:rotate(-90deg);
                transform:rotate(-90deg); }
  .bp3-tether-element-attached-left.bp3-tether-target-attached-right > .bp3-popover{
    margin-left:17px; }
    .bp3-tether-element-attached-left.bp3-tether-target-attached-right > .bp3-popover > .bp3-popover-arrow{
      left:-11px; }
      .bp3-tether-element-attached-left.bp3-tether-target-attached-right > .bp3-popover > .bp3-popover-arrow svg{
        -webkit-transform:rotate(0);
                transform:rotate(0); }
  .bp3-tether-element-attached-top.bp3-tether-target-attached-bottom > .bp3-popover{
    margin-top:17px; }
    .bp3-tether-element-attached-top.bp3-tether-target-attached-bottom > .bp3-popover > .bp3-popover-arrow{
      top:-11px; }
      .bp3-tether-element-attached-top.bp3-tether-target-attached-bottom > .bp3-popover > .bp3-popover-arrow svg{
        -webkit-transform:rotate(90deg);
                transform:rotate(90deg); }
  .bp3-tether-element-attached-right.bp3-tether-target-attached-left > .bp3-popover{
    margin-left:-17px;
    margin-right:17px; }
    .bp3-tether-element-attached-right.bp3-tether-target-attached-left > .bp3-popover > .bp3-popover-arrow{
      right:-11px; }
      .bp3-tether-element-attached-right.bp3-tether-target-attached-left > .bp3-popover > .bp3-popover-arrow svg{
        -webkit-transform:rotate(180deg);
                transform:rotate(180deg); }
  .bp3-tether-element-attached-middle > .bp3-popover > .bp3-popover-arrow{
    top:50%;
    -webkit-transform:translateY(-50%);
            transform:translateY(-50%); }
  .bp3-tether-element-attached-center > .bp3-popover > .bp3-popover-arrow{
    right:50%;
    -webkit-transform:translateX(50%);
            transform:translateX(50%); }
  .bp3-tether-element-attached-top.bp3-tether-target-attached-top > .bp3-popover > .bp3-popover-arrow{
    top:-0.3934px; }
  .bp3-tether-element-attached-right.bp3-tether-target-attached-right > .bp3-popover > .bp3-popover-arrow{
    right:-0.3934px; }
  .bp3-tether-element-attached-left.bp3-tether-target-attached-left > .bp3-popover > .bp3-popover-arrow{
    left:-0.3934px; }
  .bp3-tether-element-attached-bottom.bp3-tether-target-attached-bottom > .bp3-popover > .bp3-popover-arrow{
    bottom:-0.3934px; }
  .bp3-tether-element-attached-top.bp3-tether-element-attached-left > .bp3-popover{
    -webkit-transform-origin:top left;
            transform-origin:top left; }
  .bp3-tether-element-attached-top.bp3-tether-element-attached-center > .bp3-popover{
    -webkit-transform-origin:top center;
            transform-origin:top center; }
  .bp3-tether-element-attached-top.bp3-tether-element-attached-right > .bp3-popover{
    -webkit-transform-origin:top right;
            transform-origin:top right; }
  .bp3-tether-element-attached-middle.bp3-tether-element-attached-left > .bp3-popover{
    -webkit-transform-origin:center left;
            transform-origin:center left; }
  .bp3-tether-element-attached-middle.bp3-tether-element-attached-center > .bp3-popover{
    -webkit-transform-origin:center center;
            transform-origin:center center; }
  .bp3-tether-element-attached-middle.bp3-tether-element-attached-right > .bp3-popover{
    -webkit-transform-origin:center right;
            transform-origin:center right; }
  .bp3-tether-element-attached-bottom.bp3-tether-element-attached-left > .bp3-popover{
    -webkit-transform-origin:bottom left;
            transform-origin:bottom left; }
  .bp3-tether-element-attached-bottom.bp3-tether-element-attached-center > .bp3-popover{
    -webkit-transform-origin:bottom center;
            transform-origin:bottom center; }
  .bp3-tether-element-attached-bottom.bp3-tether-element-attached-right > .bp3-popover{
    -webkit-transform-origin:bottom right;
            transform-origin:bottom right; }
  .bp3-popover .bp3-popover-content{
    background:#ffffff;
    color:inherit; }
  .bp3-popover .bp3-popover-arrow::before{
    -webkit-box-shadow:1px 1px 6px rgba(16, 22, 26, 0.2);
            box-shadow:1px 1px 6px rgba(16, 22, 26, 0.2); }
  .bp3-popover .bp3-popover-arrow-border{
    fill:#10161a;
    fill-opacity:0.1; }
  .bp3-popover .bp3-popover-arrow-fill{
    fill:#ffffff; }
  .bp3-popover-enter > .bp3-popover, .bp3-popover-appear > .bp3-popover{
    -webkit-transform:scale(0.3);
            transform:scale(0.3); }
  .bp3-popover-enter-active > .bp3-popover, .bp3-popover-appear-active > .bp3-popover{
    -webkit-transform:scale(1);
            transform:scale(1);
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:300ms;
            transition-duration:300ms;
    -webkit-transition-property:-webkit-transform;
    transition-property:-webkit-transform;
    transition-property:transform;
    transition-property:transform, -webkit-transform;
    -webkit-transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11);
            transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11); }
  .bp3-popover-exit > .bp3-popover{
    -webkit-transform:scale(1);
            transform:scale(1); }
  .bp3-popover-exit-active > .bp3-popover{
    -webkit-transform:scale(0.3);
            transform:scale(0.3);
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:300ms;
            transition-duration:300ms;
    -webkit-transition-property:-webkit-transform;
    transition-property:-webkit-transform;
    transition-property:transform;
    transition-property:transform, -webkit-transform;
    -webkit-transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11);
            transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11); }
  .bp3-popover .bp3-popover-content{
    border-radius:3px;
    position:relative; }
  .bp3-popover.bp3-popover-content-sizing .bp3-popover-content{
    max-width:350px;
    padding:20px; }
  .bp3-popover-target + .bp3-overlay .bp3-popover.bp3-popover-content-sizing{
    width:350px; }
  .bp3-popover.bp3-minimal{
    margin:0 !important; }
    .bp3-popover.bp3-minimal .bp3-popover-arrow{
      display:none; }
    .bp3-popover.bp3-minimal.bp3-popover{
      -webkit-transform:scale(1);
              transform:scale(1); }
      .bp3-popover-enter > .bp3-popover.bp3-minimal.bp3-popover, .bp3-popover-appear > .bp3-popover.bp3-minimal.bp3-popover{
        -webkit-transform:scale(1);
                transform:scale(1); }
      .bp3-popover-enter-active > .bp3-popover.bp3-minimal.bp3-popover, .bp3-popover-appear-active > .bp3-popover.bp3-minimal.bp3-popover{
        -webkit-transform:scale(1);
                transform:scale(1);
        -webkit-transition-delay:0;
                transition-delay:0;
        -webkit-transition-duration:100ms;
                transition-duration:100ms;
        -webkit-transition-property:-webkit-transform;
        transition-property:-webkit-transform;
        transition-property:transform;
        transition-property:transform, -webkit-transform;
        -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
                transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
      .bp3-popover-exit > .bp3-popover.bp3-minimal.bp3-popover{
        -webkit-transform:scale(1);
                transform:scale(1); }
      .bp3-popover-exit-active > .bp3-popover.bp3-minimal.bp3-popover{
        -webkit-transform:scale(1);
                transform:scale(1);
        -webkit-transition-delay:0;
                transition-delay:0;
        -webkit-transition-duration:100ms;
                transition-duration:100ms;
        -webkit-transition-property:-webkit-transform;
        transition-property:-webkit-transform;
        transition-property:transform;
        transition-property:transform, -webkit-transform;
        -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
                transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-popover.bp3-dark,
  .bp3-dark .bp3-popover{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4); }
    .bp3-popover.bp3-dark .bp3-popover-content,
    .bp3-dark .bp3-popover .bp3-popover-content{
      background:#30404d;
      color:inherit; }
    .bp3-popover.bp3-dark .bp3-popover-arrow::before,
    .bp3-dark .bp3-popover .bp3-popover-arrow::before{
      -webkit-box-shadow:1px 1px 6px rgba(16, 22, 26, 0.4);
              box-shadow:1px 1px 6px rgba(16, 22, 26, 0.4); }
    .bp3-popover.bp3-dark .bp3-popover-arrow-border,
    .bp3-dark .bp3-popover .bp3-popover-arrow-border{
      fill:#10161a;
      fill-opacity:0.2; }
    .bp3-popover.bp3-dark .bp3-popover-arrow-fill,
    .bp3-dark .bp3-popover .bp3-popover-arrow-fill{
      fill:#30404d; }

.bp3-popover-arrow::before{
  border-radius:2px;
  content:"";
  display:block;
  position:absolute;
  -webkit-transform:rotate(45deg);
          transform:rotate(45deg); }

.bp3-tether-pinned .bp3-popover-arrow{
  display:none; }

.bp3-popover-backdrop{
  background:rgba(255, 255, 255, 0); }

.bp3-transition-container{
  opacity:1;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  z-index:20; }
  .bp3-transition-container.bp3-popover-enter, .bp3-transition-container.bp3-popover-appear{
    opacity:0; }
  .bp3-transition-container.bp3-popover-enter-active, .bp3-transition-container.bp3-popover-appear-active{
    opacity:1;
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:100ms;
            transition-duration:100ms;
    -webkit-transition-property:opacity;
    transition-property:opacity;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-transition-container.bp3-popover-exit{
    opacity:1; }
  .bp3-transition-container.bp3-popover-exit-active{
    opacity:0;
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:100ms;
            transition-duration:100ms;
    -webkit-transition-property:opacity;
    transition-property:opacity;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-transition-container:focus{
    outline:none; }
  .bp3-transition-container.bp3-popover-leave .bp3-popover-content{
    pointer-events:none; }
  .bp3-transition-container[data-x-out-of-boundaries]{
    display:none; }

span.bp3-popover-target{
  display:inline-block; }

.bp3-popover-wrapper.bp3-fill{
  width:100%; }

.bp3-portal{
  left:0;
  position:absolute;
  right:0;
  top:0; }
@-webkit-keyframes linear-progress-bar-stripes{
  from{
    background-position:0 0; }
  to{
    background-position:30px 0; } }
@keyframes linear-progress-bar-stripes{
  from{
    background-position:0 0; }
  to{
    background-position:30px 0; } }

.bp3-progress-bar{
  background:rgba(92, 112, 128, 0.2);
  border-radius:40px;
  display:block;
  height:8px;
  overflow:hidden;
  position:relative;
  width:100%; }
  .bp3-progress-bar .bp3-progress-meter{
    background:linear-gradient(-45deg, rgba(255, 255, 255, 0.2) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.2) 50%, rgba(255, 255, 255, 0.2) 75%, transparent 75%);
    background-color:rgba(92, 112, 128, 0.8);
    background-size:30px 30px;
    border-radius:40px;
    height:100%;
    position:absolute;
    -webkit-transition:width 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
    transition:width 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
    width:100%; }
  .bp3-progress-bar:not(.bp3-no-animation):not(.bp3-no-stripes) .bp3-progress-meter{
    animation:linear-progress-bar-stripes 300ms linear infinite reverse; }
  .bp3-progress-bar.bp3-no-stripes .bp3-progress-meter{
    background-image:none; }

.bp3-dark .bp3-progress-bar{
  background:rgba(16, 22, 26, 0.5); }
  .bp3-dark .bp3-progress-bar .bp3-progress-meter{
    background-color:#8a9ba8; }

.bp3-progress-bar.bp3-intent-primary .bp3-progress-meter{
  background-color:#137cbd; }

.bp3-progress-bar.bp3-intent-success .bp3-progress-meter{
  background-color:#0f9960; }

.bp3-progress-bar.bp3-intent-warning .bp3-progress-meter{
  background-color:#d9822b; }

.bp3-progress-bar.bp3-intent-danger .bp3-progress-meter{
  background-color:#db3737; }
@-webkit-keyframes skeleton-glow{
  from{
    background:rgba(206, 217, 224, 0.2);
    border-color:rgba(206, 217, 224, 0.2); }
  to{
    background:rgba(92, 112, 128, 0.2);
    border-color:rgba(92, 112, 128, 0.2); } }
@keyframes skeleton-glow{
  from{
    background:rgba(206, 217, 224, 0.2);
    border-color:rgba(206, 217, 224, 0.2); }
  to{
    background:rgba(92, 112, 128, 0.2);
    border-color:rgba(92, 112, 128, 0.2); } }
.bp3-skeleton{
  -webkit-animation:1000ms linear infinite alternate skeleton-glow;
          animation:1000ms linear infinite alternate skeleton-glow;
  background:rgba(206, 217, 224, 0.2);
  background-clip:padding-box !important;
  border-color:rgba(206, 217, 224, 0.2) !important;
  border-radius:2px;
  -webkit-box-shadow:none !important;
          box-shadow:none !important;
  color:transparent !important;
  cursor:default;
  pointer-events:none;
  -webkit-user-select:none;
     -moz-user-select:none;
      -ms-user-select:none;
          user-select:none; }
  .bp3-skeleton::before, .bp3-skeleton::after,
  .bp3-skeleton *{
    visibility:hidden !important; }
.bp3-slider{
  height:40px;
  min-width:150px;
  width:100%;
  cursor:default;
  outline:none;
  position:relative;
  -webkit-user-select:none;
     -moz-user-select:none;
      -ms-user-select:none;
          user-select:none; }
  .bp3-slider:hover{
    cursor:pointer; }
  .bp3-slider:active{
    cursor:-webkit-grabbing;
    cursor:grabbing; }
  .bp3-slider.bp3-disabled{
    cursor:not-allowed;
    opacity:0.5; }
  .bp3-slider.bp3-slider-unlabeled{
    height:16px; }

.bp3-slider-track,
.bp3-slider-progress{
  height:6px;
  left:0;
  right:0;
  top:5px;
  position:absolute; }

.bp3-slider-track{
  border-radius:3px;
  overflow:hidden; }

.bp3-slider-progress{
  background:rgba(92, 112, 128, 0.2); }
  .bp3-dark .bp3-slider-progress{
    background:rgba(16, 22, 26, 0.5); }
  .bp3-slider-progress.bp3-intent-primary{
    background-color:#137cbd; }
  .bp3-slider-progress.bp3-intent-success{
    background-color:#0f9960; }
  .bp3-slider-progress.bp3-intent-warning{
    background-color:#d9822b; }
  .bp3-slider-progress.bp3-intent-danger{
    background-color:#db3737; }

.bp3-slider-handle{
  background-color:#f5f8fa;
  background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.8)), to(rgba(255, 255, 255, 0)));
  background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.8), rgba(255, 255, 255, 0));
  -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
          box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
  color:#182026;
  border-radius:3px;
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 1px 1px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 1px 1px rgba(16, 22, 26, 0.2);
  cursor:pointer;
  height:16px;
  left:0;
  position:absolute;
  top:0;
  width:16px; }
  .bp3-slider-handle:hover{
    background-clip:padding-box;
    background-color:#ebf1f5;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1); }
  .bp3-slider-handle:active, .bp3-slider-handle.bp3-active{
    background-color:#d8e1e8;
    background-image:none;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
  .bp3-slider-handle:disabled, .bp3-slider-handle.bp3-disabled{
    background-color:rgba(206, 217, 224, 0.5);
    background-image:none;
    -webkit-box-shadow:none;
            box-shadow:none;
    color:rgba(92, 112, 128, 0.6);
    cursor:not-allowed;
    outline:none; }
    .bp3-slider-handle:disabled.bp3-active, .bp3-slider-handle:disabled.bp3-active:hover, .bp3-slider-handle.bp3-disabled.bp3-active, .bp3-slider-handle.bp3-disabled.bp3-active:hover{
      background:rgba(206, 217, 224, 0.7); }
  .bp3-slider-handle:focus{
    z-index:1; }
  .bp3-slider-handle:hover{
    background-clip:padding-box;
    background-color:#ebf1f5;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 -1px 0 rgba(16, 22, 26, 0.1);
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 1px 1px rgba(16, 22, 26, 0.2);
    cursor:-webkit-grab;
    cursor:grab;
    z-index:2; }
  .bp3-slider-handle.bp3-active{
    background-color:#d8e1e8;
    background-image:none;
    -webkit-box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2);
            box-shadow:inset 0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 2px rgba(16, 22, 26, 0.2);
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 1px rgba(16, 22, 26, 0.1);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), inset 0 1px 1px rgba(16, 22, 26, 0.1);
    cursor:-webkit-grabbing;
    cursor:grabbing; }
  .bp3-disabled .bp3-slider-handle{
    background:#bfccd6;
    -webkit-box-shadow:none;
            box-shadow:none;
    pointer-events:none; }
  .bp3-dark .bp3-slider-handle{
    background-color:#394b59;
    background-image:-webkit-gradient(linear, left top, left bottom, from(rgba(255, 255, 255, 0.05)), to(rgba(255, 255, 255, 0)));
    background-image:linear-gradient(to bottom, rgba(255, 255, 255, 0.05), rgba(255, 255, 255, 0));
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
    color:#f5f8fa; }
    .bp3-dark .bp3-slider-handle:hover, .bp3-dark .bp3-slider-handle:active, .bp3-dark .bp3-slider-handle.bp3-active{
      color:#f5f8fa; }
    .bp3-dark .bp3-slider-handle:hover{
      background-color:#30404d;
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-slider-handle:active, .bp3-dark .bp3-slider-handle.bp3-active{
      background-color:#202b33;
      background-image:none;
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.6), inset 0 1px 2px rgba(16, 22, 26, 0.2); }
    .bp3-dark .bp3-slider-handle:disabled, .bp3-dark .bp3-slider-handle.bp3-disabled{
      background-color:rgba(57, 75, 89, 0.5);
      background-image:none;
      -webkit-box-shadow:none;
              box-shadow:none;
      color:rgba(167, 182, 194, 0.6); }
      .bp3-dark .bp3-slider-handle:disabled.bp3-active, .bp3-dark .bp3-slider-handle.bp3-disabled.bp3-active{
        background:rgba(57, 75, 89, 0.7); }
    .bp3-dark .bp3-slider-handle .bp3-button-spinner .bp3-spinner-head{
      background:rgba(16, 22, 26, 0.5);
      stroke:#8a9ba8; }
    .bp3-dark .bp3-slider-handle, .bp3-dark .bp3-slider-handle:hover{
      background-color:#394b59; }
    .bp3-dark .bp3-slider-handle.bp3-active{
      background-color:#293742; }
  .bp3-dark .bp3-disabled .bp3-slider-handle{
    background:#5c7080;
    border-color:#5c7080;
    -webkit-box-shadow:none;
            box-shadow:none; }
  .bp3-slider-handle .bp3-slider-label{
    background:#394b59;
    border-radius:3px;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
    color:#f5f8fa;
    margin-left:8px; }
    .bp3-dark .bp3-slider-handle .bp3-slider-label{
      background:#e1e8ed;
      -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4);
      color:#394b59; }
    .bp3-disabled .bp3-slider-handle .bp3-slider-label{
      -webkit-box-shadow:none;
              box-shadow:none; }
  .bp3-slider-handle.bp3-start, .bp3-slider-handle.bp3-end{
    width:8px; }
  .bp3-slider-handle.bp3-start{
    border-bottom-right-radius:0;
    border-top-right-radius:0; }
  .bp3-slider-handle.bp3-end{
    border-bottom-left-radius:0;
    border-top-left-radius:0;
    margin-left:8px; }
    .bp3-slider-handle.bp3-end .bp3-slider-label{
      margin-left:0; }

.bp3-slider-label{
  -webkit-transform:translate(-50%, 20px);
          transform:translate(-50%, 20px);
  display:inline-block;
  font-size:12px;
  line-height:1;
  padding:2px 5px;
  position:absolute;
  vertical-align:top; }

.bp3-slider.bp3-vertical{
  height:150px;
  min-width:40px;
  width:40px; }
  .bp3-slider.bp3-vertical .bp3-slider-track,
  .bp3-slider.bp3-vertical .bp3-slider-progress{
    bottom:0;
    height:auto;
    left:5px;
    top:0;
    width:6px; }
  .bp3-slider.bp3-vertical .bp3-slider-progress{
    top:auto; }
  .bp3-slider.bp3-vertical .bp3-slider-label{
    -webkit-transform:translate(20px, 50%);
            transform:translate(20px, 50%); }
  .bp3-slider.bp3-vertical .bp3-slider-handle{
    top:auto; }
    .bp3-slider.bp3-vertical .bp3-slider-handle .bp3-slider-label{
      margin-left:0;
      margin-top:-8px; }
    .bp3-slider.bp3-vertical .bp3-slider-handle.bp3-end, .bp3-slider.bp3-vertical .bp3-slider-handle.bp3-start{
      height:8px;
      margin-left:0;
      width:16px; }
    .bp3-slider.bp3-vertical .bp3-slider-handle.bp3-start{
      border-bottom-right-radius:3px;
      border-top-left-radius:0; }
      .bp3-slider.bp3-vertical .bp3-slider-handle.bp3-start .bp3-slider-label{
        -webkit-transform:translate(20px);
                transform:translate(20px); }
    .bp3-slider.bp3-vertical .bp3-slider-handle.bp3-end{
      border-bottom-left-radius:0;
      border-bottom-right-radius:0;
      border-top-left-radius:3px;
      margin-bottom:8px; }

@-webkit-keyframes pt-spinner-animation{
  from{
    -webkit-transform:rotate(0deg);
            transform:rotate(0deg); }
  to{
    -webkit-transform:rotate(360deg);
            transform:rotate(360deg); } }

@keyframes pt-spinner-animation{
  from{
    -webkit-transform:rotate(0deg);
            transform:rotate(0deg); }
  to{
    -webkit-transform:rotate(360deg);
            transform:rotate(360deg); } }

.bp3-spinner{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-pack:center;
      -ms-flex-pack:center;
          justify-content:center;
  overflow:visible;
  vertical-align:middle; }
  .bp3-spinner svg{
    display:block; }
  .bp3-spinner path{
    fill-opacity:0; }
  .bp3-spinner .bp3-spinner-head{
    stroke:rgba(92, 112, 128, 0.8);
    stroke-linecap:round;
    -webkit-transform-origin:center;
            transform-origin:center;
    -webkit-transition:stroke-dashoffset 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
    transition:stroke-dashoffset 200ms cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-spinner .bp3-spinner-track{
    stroke:rgba(92, 112, 128, 0.2); }

.bp3-spinner-animation{
  -webkit-animation:pt-spinner-animation 500ms linear infinite;
          animation:pt-spinner-animation 500ms linear infinite; }
  .bp3-no-spin > .bp3-spinner-animation{
    -webkit-animation:none;
            animation:none; }

.bp3-dark .bp3-spinner .bp3-spinner-head{
  stroke:#8a9ba8; }

.bp3-dark .bp3-spinner .bp3-spinner-track{
  stroke:rgba(16, 22, 26, 0.5); }

.bp3-spinner.bp3-intent-primary .bp3-spinner-head{
  stroke:#137cbd; }

.bp3-spinner.bp3-intent-success .bp3-spinner-head{
  stroke:#0f9960; }

.bp3-spinner.bp3-intent-warning .bp3-spinner-head{
  stroke:#d9822b; }

.bp3-spinner.bp3-intent-danger .bp3-spinner-head{
  stroke:#db3737; }
.bp3-tabs.bp3-vertical{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex; }
  .bp3-tabs.bp3-vertical > .bp3-tab-list{
    -webkit-box-align:start;
        -ms-flex-align:start;
            align-items:flex-start;
    -webkit-box-orient:vertical;
    -webkit-box-direction:normal;
        -ms-flex-direction:column;
            flex-direction:column; }
    .bp3-tabs.bp3-vertical > .bp3-tab-list .bp3-tab{
      border-radius:3px;
      padding:0 10px;
      width:100%; }
      .bp3-tabs.bp3-vertical > .bp3-tab-list .bp3-tab[aria-selected="true"]{
        background-color:rgba(19, 124, 189, 0.2);
        -webkit-box-shadow:none;
                box-shadow:none; }
    .bp3-tabs.bp3-vertical > .bp3-tab-list .bp3-tab-indicator-wrapper .bp3-tab-indicator{
      background-color:rgba(19, 124, 189, 0.2);
      border-radius:3px;
      bottom:0;
      height:auto;
      left:0;
      right:0;
      top:0; }
  .bp3-tabs.bp3-vertical > .bp3-tab-panel{
    margin-top:0;
    padding-left:20px; }

.bp3-tab-list{
  -webkit-box-align:end;
      -ms-flex-align:end;
          align-items:flex-end;
  border:none;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-flex:0;
      -ms-flex:0 0 auto;
          flex:0 0 auto;
  list-style:none;
  margin:0;
  padding:0;
  position:relative; }
  .bp3-tab-list > *:not(:last-child){
    margin-right:20px; }

.bp3-tab{
  overflow:hidden;
  text-overflow:ellipsis;
  white-space:nowrap;
  word-wrap:normal;
  color:#182026;
  cursor:pointer;
  -webkit-box-flex:0;
      -ms-flex:0 0 auto;
          flex:0 0 auto;
  font-size:14px;
  line-height:30px;
  max-width:100%;
  position:relative;
  vertical-align:top; }
  .bp3-tab a{
    color:inherit;
    display:block;
    text-decoration:none; }
  .bp3-tab-indicator-wrapper ~ .bp3-tab{
    background-color:transparent !important;
    -webkit-box-shadow:none !important;
            box-shadow:none !important; }
  .bp3-tab[aria-disabled="true"]{
    color:rgba(92, 112, 128, 0.6);
    cursor:not-allowed; }
  .bp3-tab[aria-selected="true"]{
    border-radius:0;
    -webkit-box-shadow:inset 0 -3px 0 #106ba3;
            box-shadow:inset 0 -3px 0 #106ba3; }
  .bp3-tab[aria-selected="true"], .bp3-tab:not([aria-disabled="true"]):hover{
    color:#106ba3; }
  .bp3-tab:focus{
    -moz-outline-radius:0; }
  .bp3-large > .bp3-tab{
    font-size:16px;
    line-height:40px; }

.bp3-tab-panel{
  margin-top:20px; }
  .bp3-tab-panel[aria-hidden="true"]{
    display:none; }

.bp3-tab-indicator-wrapper{
  left:0;
  pointer-events:none;
  position:absolute;
  top:0;
  -webkit-transform:translateX(0), translateY(0);
          transform:translateX(0), translateY(0);
  -webkit-transition:height, width, -webkit-transform;
  transition:height, width, -webkit-transform;
  transition:height, transform, width;
  transition:height, transform, width, -webkit-transform;
  -webkit-transition-duration:200ms;
          transition-duration:200ms;
  -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
          transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-tab-indicator-wrapper .bp3-tab-indicator{
    background-color:#106ba3;
    bottom:0;
    height:3px;
    left:0;
    position:absolute;
    right:0; }
  .bp3-tab-indicator-wrapper.bp3-no-animation{
    -webkit-transition:none;
    transition:none; }

.bp3-dark .bp3-tab{
  color:#f5f8fa; }
  .bp3-dark .bp3-tab[aria-disabled="true"]{
    color:rgba(167, 182, 194, 0.6); }
  .bp3-dark .bp3-tab[aria-selected="true"]{
    -webkit-box-shadow:inset 0 -3px 0 #48aff0;
            box-shadow:inset 0 -3px 0 #48aff0; }
  .bp3-dark .bp3-tab[aria-selected="true"], .bp3-dark .bp3-tab:not([aria-disabled="true"]):hover{
    color:#48aff0; }

.bp3-dark .bp3-tab-indicator{
  background-color:#48aff0; }

.bp3-flex-expander{
  -webkit-box-flex:1;
      -ms-flex:1 1;
          flex:1 1; }
.bp3-tag{
  display:-webkit-inline-box;
  display:-ms-inline-flexbox;
  display:inline-flex;
  -webkit-box-orient:horizontal;
  -webkit-box-direction:normal;
      -ms-flex-direction:row;
          flex-direction:row;
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  background-color:#5c7080;
  border:none;
  border-radius:3px;
  -webkit-box-shadow:none;
          box-shadow:none;
  color:#f5f8fa;
  font-size:12px;
  line-height:16px;
  max-width:100%;
  min-height:20px;
  min-width:20px;
  padding:2px 6px;
  position:relative; }
  .bp3-tag.bp3-interactive{
    cursor:pointer; }
    .bp3-tag.bp3-interactive:hover{
      background-color:rgba(92, 112, 128, 0.85); }
    .bp3-tag.bp3-interactive.bp3-active, .bp3-tag.bp3-interactive:active{
      background-color:rgba(92, 112, 128, 0.7); }
  .bp3-tag > *{
    -webkit-box-flex:0;
        -ms-flex-positive:0;
            flex-grow:0;
    -ms-flex-negative:0;
        flex-shrink:0; }
  .bp3-tag > .bp3-fill{
    -webkit-box-flex:1;
        -ms-flex-positive:1;
            flex-grow:1;
    -ms-flex-negative:1;
        flex-shrink:1; }
  .bp3-tag::before,
  .bp3-tag > *{
    margin-right:4px; }
  .bp3-tag:empty::before,
  .bp3-tag > :last-child{
    margin-right:0; }
  .bp3-tag:focus{
    outline:rgba(19, 124, 189, 0.6) auto 2px;
    outline-offset:0;
    -moz-outline-radius:6px; }
  .bp3-tag.bp3-round{
    border-radius:30px;
    padding-left:8px;
    padding-right:8px; }
  .bp3-dark .bp3-tag{
    background-color:#bfccd6;
    color:#182026; }
    .bp3-dark .bp3-tag.bp3-interactive{
      cursor:pointer; }
      .bp3-dark .bp3-tag.bp3-interactive:hover{
        background-color:rgba(191, 204, 214, 0.85); }
      .bp3-dark .bp3-tag.bp3-interactive.bp3-active, .bp3-dark .bp3-tag.bp3-interactive:active{
        background-color:rgba(191, 204, 214, 0.7); }
    .bp3-dark .bp3-tag > .bp3-icon, .bp3-dark .bp3-tag .bp3-icon-standard, .bp3-dark .bp3-tag .bp3-icon-large{
      fill:currentColor; }
  .bp3-tag > .bp3-icon, .bp3-tag .bp3-icon-standard, .bp3-tag .bp3-icon-large{
    fill:#ffffff; }
  .bp3-tag.bp3-large,
  .bp3-large .bp3-tag{
    font-size:14px;
    line-height:20px;
    min-height:30px;
    min-width:30px;
    padding:5px 10px; }
    .bp3-tag.bp3-large::before,
    .bp3-tag.bp3-large > *,
    .bp3-large .bp3-tag::before,
    .bp3-large .bp3-tag > *{
      margin-right:7px; }
    .bp3-tag.bp3-large:empty::before,
    .bp3-tag.bp3-large > :last-child,
    .bp3-large .bp3-tag:empty::before,
    .bp3-large .bp3-tag > :last-child{
      margin-right:0; }
    .bp3-tag.bp3-large.bp3-round,
    .bp3-large .bp3-tag.bp3-round{
      padding-left:12px;
      padding-right:12px; }
  .bp3-tag.bp3-intent-primary{
    background:#137cbd;
    color:#ffffff; }
    .bp3-tag.bp3-intent-primary.bp3-interactive{
      cursor:pointer; }
      .bp3-tag.bp3-intent-primary.bp3-interactive:hover{
        background-color:rgba(19, 124, 189, 0.85); }
      .bp3-tag.bp3-intent-primary.bp3-interactive.bp3-active, .bp3-tag.bp3-intent-primary.bp3-interactive:active{
        background-color:rgba(19, 124, 189, 0.7); }
  .bp3-tag.bp3-intent-success{
    background:#0f9960;
    color:#ffffff; }
    .bp3-tag.bp3-intent-success.bp3-interactive{
      cursor:pointer; }
      .bp3-tag.bp3-intent-success.bp3-interactive:hover{
        background-color:rgba(15, 153, 96, 0.85); }
      .bp3-tag.bp3-intent-success.bp3-interactive.bp3-active, .bp3-tag.bp3-intent-success.bp3-interactive:active{
        background-color:rgba(15, 153, 96, 0.7); }
  .bp3-tag.bp3-intent-warning{
    background:#d9822b;
    color:#ffffff; }
    .bp3-tag.bp3-intent-warning.bp3-interactive{
      cursor:pointer; }
      .bp3-tag.bp3-intent-warning.bp3-interactive:hover{
        background-color:rgba(217, 130, 43, 0.85); }
      .bp3-tag.bp3-intent-warning.bp3-interactive.bp3-active, .bp3-tag.bp3-intent-warning.bp3-interactive:active{
        background-color:rgba(217, 130, 43, 0.7); }
  .bp3-tag.bp3-intent-danger{
    background:#db3737;
    color:#ffffff; }
    .bp3-tag.bp3-intent-danger.bp3-interactive{
      cursor:pointer; }
      .bp3-tag.bp3-intent-danger.bp3-interactive:hover{
        background-color:rgba(219, 55, 55, 0.85); }
      .bp3-tag.bp3-intent-danger.bp3-interactive.bp3-active, .bp3-tag.bp3-intent-danger.bp3-interactive:active{
        background-color:rgba(219, 55, 55, 0.7); }
  .bp3-tag.bp3-fill{
    display:-webkit-box;
    display:-ms-flexbox;
    display:flex;
    width:100%; }
  .bp3-tag.bp3-minimal > .bp3-icon, .bp3-tag.bp3-minimal .bp3-icon-standard, .bp3-tag.bp3-minimal .bp3-icon-large{
    fill:#5c7080; }
  .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]){
    background-color:rgba(138, 155, 168, 0.2);
    color:#182026; }
    .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]).bp3-interactive{
      cursor:pointer; }
      .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]).bp3-interactive:hover{
        background-color:rgba(92, 112, 128, 0.3); }
      .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]).bp3-interactive.bp3-active, .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]).bp3-interactive:active{
        background-color:rgba(92, 112, 128, 0.4); }
    .bp3-dark .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]){
      color:#f5f8fa; }
      .bp3-dark .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]).bp3-interactive{
        cursor:pointer; }
        .bp3-dark .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]).bp3-interactive:hover{
          background-color:rgba(191, 204, 214, 0.3); }
        .bp3-dark .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]).bp3-interactive.bp3-active, .bp3-dark .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]).bp3-interactive:active{
          background-color:rgba(191, 204, 214, 0.4); }
      .bp3-dark .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]) > .bp3-icon, .bp3-dark .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]) .bp3-icon-standard, .bp3-dark .bp3-tag.bp3-minimal:not([class*="bp3-intent-"]) .bp3-icon-large{
        fill:#a7b6c2; }
  .bp3-tag.bp3-minimal.bp3-intent-primary{
    background-color:rgba(19, 124, 189, 0.15);
    color:#106ba3; }
    .bp3-tag.bp3-minimal.bp3-intent-primary.bp3-interactive{
      cursor:pointer; }
      .bp3-tag.bp3-minimal.bp3-intent-primary.bp3-interactive:hover{
        background-color:rgba(19, 124, 189, 0.25); }
      .bp3-tag.bp3-minimal.bp3-intent-primary.bp3-interactive.bp3-active, .bp3-tag.bp3-minimal.bp3-intent-primary.bp3-interactive:active{
        background-color:rgba(19, 124, 189, 0.35); }
    .bp3-tag.bp3-minimal.bp3-intent-primary > .bp3-icon, .bp3-tag.bp3-minimal.bp3-intent-primary .bp3-icon-standard, .bp3-tag.bp3-minimal.bp3-intent-primary .bp3-icon-large{
      fill:#137cbd; }
    .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-primary{
      background-color:rgba(19, 124, 189, 0.25);
      color:#48aff0; }
      .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-primary.bp3-interactive{
        cursor:pointer; }
        .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-primary.bp3-interactive:hover{
          background-color:rgba(19, 124, 189, 0.35); }
        .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-primary.bp3-interactive.bp3-active, .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-primary.bp3-interactive:active{
          background-color:rgba(19, 124, 189, 0.45); }
  .bp3-tag.bp3-minimal.bp3-intent-success{
    background-color:rgba(15, 153, 96, 0.15);
    color:#0d8050; }
    .bp3-tag.bp3-minimal.bp3-intent-success.bp3-interactive{
      cursor:pointer; }
      .bp3-tag.bp3-minimal.bp3-intent-success.bp3-interactive:hover{
        background-color:rgba(15, 153, 96, 0.25); }
      .bp3-tag.bp3-minimal.bp3-intent-success.bp3-interactive.bp3-active, .bp3-tag.bp3-minimal.bp3-intent-success.bp3-interactive:active{
        background-color:rgba(15, 153, 96, 0.35); }
    .bp3-tag.bp3-minimal.bp3-intent-success > .bp3-icon, .bp3-tag.bp3-minimal.bp3-intent-success .bp3-icon-standard, .bp3-tag.bp3-minimal.bp3-intent-success .bp3-icon-large{
      fill:#0f9960; }
    .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-success{
      background-color:rgba(15, 153, 96, 0.25);
      color:#3dcc91; }
      .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-success.bp3-interactive{
        cursor:pointer; }
        .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-success.bp3-interactive:hover{
          background-color:rgba(15, 153, 96, 0.35); }
        .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-success.bp3-interactive.bp3-active, .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-success.bp3-interactive:active{
          background-color:rgba(15, 153, 96, 0.45); }
  .bp3-tag.bp3-minimal.bp3-intent-warning{
    background-color:rgba(217, 130, 43, 0.15);
    color:#bf7326; }
    .bp3-tag.bp3-minimal.bp3-intent-warning.bp3-interactive{
      cursor:pointer; }
      .bp3-tag.bp3-minimal.bp3-intent-warning.bp3-interactive:hover{
        background-color:rgba(217, 130, 43, 0.25); }
      .bp3-tag.bp3-minimal.bp3-intent-warning.bp3-interactive.bp3-active, .bp3-tag.bp3-minimal.bp3-intent-warning.bp3-interactive:active{
        background-color:rgba(217, 130, 43, 0.35); }
    .bp3-tag.bp3-minimal.bp3-intent-warning > .bp3-icon, .bp3-tag.bp3-minimal.bp3-intent-warning .bp3-icon-standard, .bp3-tag.bp3-minimal.bp3-intent-warning .bp3-icon-large{
      fill:#d9822b; }
    .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-warning{
      background-color:rgba(217, 130, 43, 0.25);
      color:#ffb366; }
      .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-warning.bp3-interactive{
        cursor:pointer; }
        .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-warning.bp3-interactive:hover{
          background-color:rgba(217, 130, 43, 0.35); }
        .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-warning.bp3-interactive.bp3-active, .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-warning.bp3-interactive:active{
          background-color:rgba(217, 130, 43, 0.45); }
  .bp3-tag.bp3-minimal.bp3-intent-danger{
    background-color:rgba(219, 55, 55, 0.15);
    color:#c23030; }
    .bp3-tag.bp3-minimal.bp3-intent-danger.bp3-interactive{
      cursor:pointer; }
      .bp3-tag.bp3-minimal.bp3-intent-danger.bp3-interactive:hover{
        background-color:rgba(219, 55, 55, 0.25); }
      .bp3-tag.bp3-minimal.bp3-intent-danger.bp3-interactive.bp3-active, .bp3-tag.bp3-minimal.bp3-intent-danger.bp3-interactive:active{
        background-color:rgba(219, 55, 55, 0.35); }
    .bp3-tag.bp3-minimal.bp3-intent-danger > .bp3-icon, .bp3-tag.bp3-minimal.bp3-intent-danger .bp3-icon-standard, .bp3-tag.bp3-minimal.bp3-intent-danger .bp3-icon-large{
      fill:#db3737; }
    .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-danger{
      background-color:rgba(219, 55, 55, 0.25);
      color:#ff7373; }
      .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-danger.bp3-interactive{
        cursor:pointer; }
        .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-danger.bp3-interactive:hover{
          background-color:rgba(219, 55, 55, 0.35); }
        .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-danger.bp3-interactive.bp3-active, .bp3-dark .bp3-tag.bp3-minimal.bp3-intent-danger.bp3-interactive:active{
          background-color:rgba(219, 55, 55, 0.45); }

.bp3-tag-remove{
  background:none;
  border:none;
  color:inherit;
  cursor:pointer;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  margin-bottom:-2px;
  margin-right:-6px !important;
  margin-top:-2px;
  opacity:0.5;
  padding:2px;
  padding-left:0; }
  .bp3-tag-remove:hover{
    background:none;
    opacity:0.8;
    text-decoration:none; }
  .bp3-tag-remove:active{
    opacity:1; }
  .bp3-tag-remove:empty::before{
    font-family:"Icons16", sans-serif;
    font-size:16px;
    font-style:normal;
    font-weight:400;
    line-height:1;
    -moz-osx-font-smoothing:grayscale;
    -webkit-font-smoothing:antialiased;
    content:""; }
  .bp3-large .bp3-tag-remove{
    margin-right:-10px !important;
    padding:0 5px 0 0; }
    .bp3-large .bp3-tag-remove:empty::before{
      font-family:"Icons20", sans-serif;
      font-size:20px;
      font-style:normal;
      font-weight:400;
      line-height:1; }
.bp3-tag-input{
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-orient:horizontal;
  -webkit-box-direction:normal;
      -ms-flex-direction:row;
          flex-direction:row;
  -webkit-box-align:start;
      -ms-flex-align:start;
          align-items:flex-start;
  cursor:text;
  height:auto;
  line-height:inherit;
  min-height:30px;
  padding-left:5px;
  padding-right:0; }
  .bp3-tag-input > *{
    -webkit-box-flex:0;
        -ms-flex-positive:0;
            flex-grow:0;
    -ms-flex-negative:0;
        flex-shrink:0; }
  .bp3-tag-input > .bp3-tag-input-values{
    -webkit-box-flex:1;
        -ms-flex-positive:1;
            flex-grow:1;
    -ms-flex-negative:1;
        flex-shrink:1; }
  .bp3-tag-input .bp3-tag-input-icon{
    color:#5c7080;
    margin-left:2px;
    margin-right:7px;
    margin-top:7px; }
  .bp3-tag-input .bp3-tag-input-values{
    display:-webkit-box;
    display:-ms-flexbox;
    display:flex;
    -webkit-box-orient:horizontal;
    -webkit-box-direction:normal;
        -ms-flex-direction:row;
            flex-direction:row;
    -webkit-box-align:center;
        -ms-flex-align:center;
            align-items:center;
    -ms-flex-item-align:stretch;
        align-self:stretch;
    -ms-flex-wrap:wrap;
        flex-wrap:wrap;
    margin-right:7px;
    margin-top:5px;
    min-width:0; }
    .bp3-tag-input .bp3-tag-input-values > *{
      -webkit-box-flex:0;
          -ms-flex-positive:0;
              flex-grow:0;
      -ms-flex-negative:0;
          flex-shrink:0; }
    .bp3-tag-input .bp3-tag-input-values > .bp3-fill{
      -webkit-box-flex:1;
          -ms-flex-positive:1;
              flex-grow:1;
      -ms-flex-negative:1;
          flex-shrink:1; }
    .bp3-tag-input .bp3-tag-input-values::before,
    .bp3-tag-input .bp3-tag-input-values > *{
      margin-right:5px; }
    .bp3-tag-input .bp3-tag-input-values:empty::before,
    .bp3-tag-input .bp3-tag-input-values > :last-child{
      margin-right:0; }
    .bp3-tag-input .bp3-tag-input-values:first-child .bp3-input-ghost:first-child{
      padding-left:5px; }
    .bp3-tag-input .bp3-tag-input-values > *{
      margin-bottom:5px; }
  .bp3-tag-input .bp3-tag{
    overflow-wrap:break-word; }
    .bp3-tag-input .bp3-tag.bp3-active{
      outline:rgba(19, 124, 189, 0.6) auto 2px;
      outline-offset:0;
      -moz-outline-radius:6px; }
  .bp3-tag-input .bp3-input-ghost{
    -webkit-box-flex:1;
        -ms-flex:1 1 auto;
            flex:1 1 auto;
    line-height:20px;
    width:80px; }
    .bp3-tag-input .bp3-input-ghost:disabled, .bp3-tag-input .bp3-input-ghost.bp3-disabled{
      cursor:not-allowed; }
  .bp3-tag-input .bp3-button,
  .bp3-tag-input .bp3-spinner{
    margin:3px;
    margin-left:0; }
  .bp3-tag-input .bp3-button{
    min-height:24px;
    min-width:24px;
    padding:0 7px; }
  .bp3-tag-input.bp3-large{
    height:auto;
    min-height:40px; }
    .bp3-tag-input.bp3-large::before,
    .bp3-tag-input.bp3-large > *{
      margin-right:10px; }
    .bp3-tag-input.bp3-large:empty::before,
    .bp3-tag-input.bp3-large > :last-child{
      margin-right:0; }
    .bp3-tag-input.bp3-large .bp3-tag-input-icon{
      margin-left:5px;
      margin-top:10px; }
    .bp3-tag-input.bp3-large .bp3-input-ghost{
      line-height:30px; }
    .bp3-tag-input.bp3-large .bp3-button{
      min-height:30px;
      min-width:30px;
      padding:5px 10px;
      margin:5px;
      margin-left:0; }
    .bp3-tag-input.bp3-large .bp3-spinner{
      margin:8px;
      margin-left:0; }
  .bp3-tag-input.bp3-active{
    background-color:#ffffff;
    -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
            box-shadow:0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-tag-input.bp3-active.bp3-intent-primary{
      -webkit-box-shadow:0 0 0 1px #106ba3, 0 0 0 3px rgba(16, 107, 163, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #106ba3, 0 0 0 3px rgba(16, 107, 163, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-tag-input.bp3-active.bp3-intent-success{
      -webkit-box-shadow:0 0 0 1px #0d8050, 0 0 0 3px rgba(13, 128, 80, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #0d8050, 0 0 0 3px rgba(13, 128, 80, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-tag-input.bp3-active.bp3-intent-warning{
      -webkit-box-shadow:0 0 0 1px #bf7326, 0 0 0 3px rgba(191, 115, 38, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #bf7326, 0 0 0 3px rgba(191, 115, 38, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
    .bp3-tag-input.bp3-active.bp3-intent-danger{
      -webkit-box-shadow:0 0 0 1px #c23030, 0 0 0 3px rgba(194, 48, 48, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2);
              box-shadow:0 0 0 1px #c23030, 0 0 0 3px rgba(194, 48, 48, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.2); }
  .bp3-dark .bp3-tag-input .bp3-tag-input-icon, .bp3-tag-input.bp3-dark .bp3-tag-input-icon{
    color:#a7b6c2; }
  .bp3-dark .bp3-tag-input .bp3-input-ghost, .bp3-tag-input.bp3-dark .bp3-input-ghost{
    color:#f5f8fa; }
    .bp3-dark .bp3-tag-input .bp3-input-ghost::-webkit-input-placeholder, .bp3-tag-input.bp3-dark .bp3-input-ghost::-webkit-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-tag-input .bp3-input-ghost::-moz-placeholder, .bp3-tag-input.bp3-dark .bp3-input-ghost::-moz-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-tag-input .bp3-input-ghost:-ms-input-placeholder, .bp3-tag-input.bp3-dark .bp3-input-ghost:-ms-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-tag-input .bp3-input-ghost::-ms-input-placeholder, .bp3-tag-input.bp3-dark .bp3-input-ghost::-ms-input-placeholder{
      color:rgba(167, 182, 194, 0.6); }
    .bp3-dark .bp3-tag-input .bp3-input-ghost::placeholder, .bp3-tag-input.bp3-dark .bp3-input-ghost::placeholder{
      color:rgba(167, 182, 194, 0.6); }
  .bp3-dark .bp3-tag-input.bp3-active, .bp3-tag-input.bp3-dark.bp3-active{
    background-color:rgba(16, 22, 26, 0.3);
    -webkit-box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px #137cbd, 0 0 0 1px #137cbd, 0 0 0 3px rgba(19, 124, 189, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-tag-input.bp3-active.bp3-intent-primary, .bp3-tag-input.bp3-dark.bp3-active.bp3-intent-primary{
      -webkit-box-shadow:0 0 0 1px #106ba3, 0 0 0 3px rgba(16, 107, 163, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px #106ba3, 0 0 0 3px rgba(16, 107, 163, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-tag-input.bp3-active.bp3-intent-success, .bp3-tag-input.bp3-dark.bp3-active.bp3-intent-success{
      -webkit-box-shadow:0 0 0 1px #0d8050, 0 0 0 3px rgba(13, 128, 80, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px #0d8050, 0 0 0 3px rgba(13, 128, 80, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-tag-input.bp3-active.bp3-intent-warning, .bp3-tag-input.bp3-dark.bp3-active.bp3-intent-warning{
      -webkit-box-shadow:0 0 0 1px #bf7326, 0 0 0 3px rgba(191, 115, 38, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px #bf7326, 0 0 0 3px rgba(191, 115, 38, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }
    .bp3-dark .bp3-tag-input.bp3-active.bp3-intent-danger, .bp3-tag-input.bp3-dark.bp3-active.bp3-intent-danger{
      -webkit-box-shadow:0 0 0 1px #c23030, 0 0 0 3px rgba(194, 48, 48, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4);
              box-shadow:0 0 0 1px #c23030, 0 0 0 3px rgba(194, 48, 48, 0.3), inset 0 0 0 1px rgba(16, 22, 26, 0.3), inset 0 1px 1px rgba(16, 22, 26, 0.4); }

.bp3-input-ghost{
  background:none;
  border:none;
  -webkit-box-shadow:none;
          box-shadow:none;
  padding:0; }
  .bp3-input-ghost::-webkit-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input-ghost::-moz-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input-ghost:-ms-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input-ghost::-ms-input-placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input-ghost::placeholder{
    color:rgba(92, 112, 128, 0.6);
    opacity:1; }
  .bp3-input-ghost:focus{
    outline:none !important; }
.bp3-toast{
  -webkit-box-align:start;
      -ms-flex-align:start;
          align-items:flex-start;
  background-color:#ffffff;
  border-radius:3px;
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  margin:20px 0 0;
  max-width:500px;
  min-width:300px;
  pointer-events:all;
  position:relative !important; }
  .bp3-toast.bp3-toast-enter, .bp3-toast.bp3-toast-appear{
    -webkit-transform:translateY(-40px);
            transform:translateY(-40px); }
  .bp3-toast.bp3-toast-enter-active, .bp3-toast.bp3-toast-appear-active{
    -webkit-transform:translateY(0);
            transform:translateY(0);
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:300ms;
            transition-duration:300ms;
    -webkit-transition-property:-webkit-transform;
    transition-property:-webkit-transform;
    transition-property:transform;
    transition-property:transform, -webkit-transform;
    -webkit-transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11);
            transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11); }
  .bp3-toast.bp3-toast-enter ~ .bp3-toast, .bp3-toast.bp3-toast-appear ~ .bp3-toast{
    -webkit-transform:translateY(-40px);
            transform:translateY(-40px); }
  .bp3-toast.bp3-toast-enter-active ~ .bp3-toast, .bp3-toast.bp3-toast-appear-active ~ .bp3-toast{
    -webkit-transform:translateY(0);
            transform:translateY(0);
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:300ms;
            transition-duration:300ms;
    -webkit-transition-property:-webkit-transform;
    transition-property:-webkit-transform;
    transition-property:transform;
    transition-property:transform, -webkit-transform;
    -webkit-transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11);
            transition-timing-function:cubic-bezier(0.54, 1.12, 0.38, 1.11); }
  .bp3-toast.bp3-toast-exit{
    opacity:1;
    -webkit-filter:blur(0);
            filter:blur(0); }
  .bp3-toast.bp3-toast-exit-active{
    opacity:0;
    -webkit-filter:blur(10px);
            filter:blur(10px);
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:300ms;
            transition-duration:300ms;
    -webkit-transition-property:opacity, -webkit-filter;
    transition-property:opacity, -webkit-filter;
    transition-property:opacity, filter;
    transition-property:opacity, filter, -webkit-filter;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-toast.bp3-toast-exit ~ .bp3-toast{
    -webkit-transform:translateY(0);
            transform:translateY(0); }
  .bp3-toast.bp3-toast-exit-active ~ .bp3-toast{
    -webkit-transform:translateY(-40px);
            transform:translateY(-40px);
    -webkit-transition-delay:50ms;
            transition-delay:50ms;
    -webkit-transition-duration:100ms;
            transition-duration:100ms;
    -webkit-transition-property:-webkit-transform;
    transition-property:-webkit-transform;
    transition-property:transform;
    transition-property:transform, -webkit-transform;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-toast .bp3-button-group{
    -webkit-box-flex:0;
        -ms-flex:0 0 auto;
            flex:0 0 auto;
    padding:5px;
    padding-left:0; }
  .bp3-toast > .bp3-icon{
    color:#5c7080;
    margin:12px;
    margin-right:0; }
  .bp3-toast.bp3-dark,
  .bp3-dark .bp3-toast{
    background-color:#394b59;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4); }
    .bp3-toast.bp3-dark > .bp3-icon,
    .bp3-dark .bp3-toast > .bp3-icon{
      color:#a7b6c2; }
  .bp3-toast[class*="bp3-intent-"] a{
    color:rgba(255, 255, 255, 0.7); }
    .bp3-toast[class*="bp3-intent-"] a:hover{
      color:#ffffff; }
  .bp3-toast[class*="bp3-intent-"] > .bp3-icon{
    color:#ffffff; }
  .bp3-toast[class*="bp3-intent-"] .bp3-button, .bp3-toast[class*="bp3-intent-"] .bp3-button::before,
  .bp3-toast[class*="bp3-intent-"] .bp3-button .bp3-icon, .bp3-toast[class*="bp3-intent-"] .bp3-button:active{
    color:rgba(255, 255, 255, 0.7) !important; }
  .bp3-toast[class*="bp3-intent-"] .bp3-button:focus{
    outline-color:rgba(255, 255, 255, 0.5); }
  .bp3-toast[class*="bp3-intent-"] .bp3-button:hover{
    background-color:rgba(255, 255, 255, 0.15) !important;
    color:#ffffff !important; }
  .bp3-toast[class*="bp3-intent-"] .bp3-button:active{
    background-color:rgba(255, 255, 255, 0.3) !important;
    color:#ffffff !important; }
  .bp3-toast[class*="bp3-intent-"] .bp3-button::after{
    background:rgba(255, 255, 255, 0.3) !important; }
  .bp3-toast.bp3-intent-primary{
    background-color:#137cbd;
    color:#ffffff; }
  .bp3-toast.bp3-intent-success{
    background-color:#0f9960;
    color:#ffffff; }
  .bp3-toast.bp3-intent-warning{
    background-color:#d9822b;
    color:#ffffff; }
  .bp3-toast.bp3-intent-danger{
    background-color:#db3737;
    color:#ffffff; }

.bp3-toast-message{
  -webkit-box-flex:1;
      -ms-flex:1 1 auto;
          flex:1 1 auto;
  padding:11px;
  word-break:break-word; }

.bp3-toast-container{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  display:-webkit-box !important;
  display:-ms-flexbox !important;
  display:flex !important;
  -webkit-box-orient:vertical;
  -webkit-box-direction:normal;
      -ms-flex-direction:column;
          flex-direction:column;
  left:0;
  overflow:hidden;
  padding:0 20px 20px;
  pointer-events:none;
  right:0;
  z-index:40; }
  .bp3-toast-container.bp3-toast-container-in-portal{
    position:fixed; }
  .bp3-toast-container.bp3-toast-container-inline{
    position:absolute; }
  .bp3-toast-container.bp3-toast-container-top{
    top:0; }
  .bp3-toast-container.bp3-toast-container-bottom{
    bottom:0;
    -webkit-box-orient:vertical;
    -webkit-box-direction:reverse;
        -ms-flex-direction:column-reverse;
            flex-direction:column-reverse;
    top:auto; }
  .bp3-toast-container.bp3-toast-container-left{
    -webkit-box-align:start;
        -ms-flex-align:start;
            align-items:flex-start; }
  .bp3-toast-container.bp3-toast-container-right{
    -webkit-box-align:end;
        -ms-flex-align:end;
            align-items:flex-end; }

.bp3-toast-container-bottom .bp3-toast.bp3-toast-enter:not(.bp3-toast-enter-active),
.bp3-toast-container-bottom .bp3-toast.bp3-toast-enter:not(.bp3-toast-enter-active) ~ .bp3-toast, .bp3-toast-container-bottom .bp3-toast.bp3-toast-appear:not(.bp3-toast-appear-active),
.bp3-toast-container-bottom .bp3-toast.bp3-toast-appear:not(.bp3-toast-appear-active) ~ .bp3-toast,
.bp3-toast-container-bottom .bp3-toast.bp3-toast-exit-active ~ .bp3-toast,
.bp3-toast-container-bottom .bp3-toast.bp3-toast-leave-active ~ .bp3-toast{
  -webkit-transform:translateY(60px);
          transform:translateY(60px); }
.bp3-tooltip{
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 2px 4px rgba(16, 22, 26, 0.2), 0 8px 24px rgba(16, 22, 26, 0.2);
  -webkit-transform:scale(1);
          transform:scale(1); }
  .bp3-tooltip .bp3-popover-arrow{
    height:22px;
    position:absolute;
    width:22px; }
    .bp3-tooltip .bp3-popover-arrow::before{
      height:14px;
      margin:4px;
      width:14px; }
  .bp3-tether-element-attached-bottom.bp3-tether-target-attached-top > .bp3-tooltip{
    margin-bottom:11px;
    margin-top:-11px; }
    .bp3-tether-element-attached-bottom.bp3-tether-target-attached-top > .bp3-tooltip > .bp3-popover-arrow{
      bottom:-8px; }
      .bp3-tether-element-attached-bottom.bp3-tether-target-attached-top > .bp3-tooltip > .bp3-popover-arrow svg{
        -webkit-transform:rotate(-90deg);
                transform:rotate(-90deg); }
  .bp3-tether-element-attached-left.bp3-tether-target-attached-right > .bp3-tooltip{
    margin-left:11px; }
    .bp3-tether-element-attached-left.bp3-tether-target-attached-right > .bp3-tooltip > .bp3-popover-arrow{
      left:-8px; }
      .bp3-tether-element-attached-left.bp3-tether-target-attached-right > .bp3-tooltip > .bp3-popover-arrow svg{
        -webkit-transform:rotate(0);
                transform:rotate(0); }
  .bp3-tether-element-attached-top.bp3-tether-target-attached-bottom > .bp3-tooltip{
    margin-top:11px; }
    .bp3-tether-element-attached-top.bp3-tether-target-attached-bottom > .bp3-tooltip > .bp3-popover-arrow{
      top:-8px; }
      .bp3-tether-element-attached-top.bp3-tether-target-attached-bottom > .bp3-tooltip > .bp3-popover-arrow svg{
        -webkit-transform:rotate(90deg);
                transform:rotate(90deg); }
  .bp3-tether-element-attached-right.bp3-tether-target-attached-left > .bp3-tooltip{
    margin-left:-11px;
    margin-right:11px; }
    .bp3-tether-element-attached-right.bp3-tether-target-attached-left > .bp3-tooltip > .bp3-popover-arrow{
      right:-8px; }
      .bp3-tether-element-attached-right.bp3-tether-target-attached-left > .bp3-tooltip > .bp3-popover-arrow svg{
        -webkit-transform:rotate(180deg);
                transform:rotate(180deg); }
  .bp3-tether-element-attached-middle > .bp3-tooltip > .bp3-popover-arrow{
    top:50%;
    -webkit-transform:translateY(-50%);
            transform:translateY(-50%); }
  .bp3-tether-element-attached-center > .bp3-tooltip > .bp3-popover-arrow{
    right:50%;
    -webkit-transform:translateX(50%);
            transform:translateX(50%); }
  .bp3-tether-element-attached-top.bp3-tether-target-attached-top > .bp3-tooltip > .bp3-popover-arrow{
    top:-0.22183px; }
  .bp3-tether-element-attached-right.bp3-tether-target-attached-right > .bp3-tooltip > .bp3-popover-arrow{
    right:-0.22183px; }
  .bp3-tether-element-attached-left.bp3-tether-target-attached-left > .bp3-tooltip > .bp3-popover-arrow{
    left:-0.22183px; }
  .bp3-tether-element-attached-bottom.bp3-tether-target-attached-bottom > .bp3-tooltip > .bp3-popover-arrow{
    bottom:-0.22183px; }
  .bp3-tether-element-attached-top.bp3-tether-element-attached-left > .bp3-tooltip{
    -webkit-transform-origin:top left;
            transform-origin:top left; }
  .bp3-tether-element-attached-top.bp3-tether-element-attached-center > .bp3-tooltip{
    -webkit-transform-origin:top center;
            transform-origin:top center; }
  .bp3-tether-element-attached-top.bp3-tether-element-attached-right > .bp3-tooltip{
    -webkit-transform-origin:top right;
            transform-origin:top right; }
  .bp3-tether-element-attached-middle.bp3-tether-element-attached-left > .bp3-tooltip{
    -webkit-transform-origin:center left;
            transform-origin:center left; }
  .bp3-tether-element-attached-middle.bp3-tether-element-attached-center > .bp3-tooltip{
    -webkit-transform-origin:center center;
            transform-origin:center center; }
  .bp3-tether-element-attached-middle.bp3-tether-element-attached-right > .bp3-tooltip{
    -webkit-transform-origin:center right;
            transform-origin:center right; }
  .bp3-tether-element-attached-bottom.bp3-tether-element-attached-left > .bp3-tooltip{
    -webkit-transform-origin:bottom left;
            transform-origin:bottom left; }
  .bp3-tether-element-attached-bottom.bp3-tether-element-attached-center > .bp3-tooltip{
    -webkit-transform-origin:bottom center;
            transform-origin:bottom center; }
  .bp3-tether-element-attached-bottom.bp3-tether-element-attached-right > .bp3-tooltip{
    -webkit-transform-origin:bottom right;
            transform-origin:bottom right; }
  .bp3-tooltip .bp3-popover-content{
    background:#394b59;
    color:#f5f8fa; }
  .bp3-tooltip .bp3-popover-arrow::before{
    -webkit-box-shadow:1px 1px 6px rgba(16, 22, 26, 0.2);
            box-shadow:1px 1px 6px rgba(16, 22, 26, 0.2); }
  .bp3-tooltip .bp3-popover-arrow-border{
    fill:#10161a;
    fill-opacity:0.1; }
  .bp3-tooltip .bp3-popover-arrow-fill{
    fill:#394b59; }
  .bp3-popover-enter > .bp3-tooltip, .bp3-popover-appear > .bp3-tooltip{
    -webkit-transform:scale(0.8);
            transform:scale(0.8); }
  .bp3-popover-enter-active > .bp3-tooltip, .bp3-popover-appear-active > .bp3-tooltip{
    -webkit-transform:scale(1);
            transform:scale(1);
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:100ms;
            transition-duration:100ms;
    -webkit-transition-property:-webkit-transform;
    transition-property:-webkit-transform;
    transition-property:transform;
    transition-property:transform, -webkit-transform;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-popover-exit > .bp3-tooltip{
    -webkit-transform:scale(1);
            transform:scale(1); }
  .bp3-popover-exit-active > .bp3-tooltip{
    -webkit-transform:scale(0.8);
            transform:scale(0.8);
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:100ms;
            transition-duration:100ms;
    -webkit-transition-property:-webkit-transform;
    transition-property:-webkit-transform;
    transition-property:transform;
    transition-property:transform, -webkit-transform;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-tooltip .bp3-popover-content{
    padding:10px 12px; }
  .bp3-tooltip.bp3-dark,
  .bp3-dark .bp3-tooltip{
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 2px 4px rgba(16, 22, 26, 0.4), 0 8px 24px rgba(16, 22, 26, 0.4); }
    .bp3-tooltip.bp3-dark .bp3-popover-content,
    .bp3-dark .bp3-tooltip .bp3-popover-content{
      background:#e1e8ed;
      color:#394b59; }
    .bp3-tooltip.bp3-dark .bp3-popover-arrow::before,
    .bp3-dark .bp3-tooltip .bp3-popover-arrow::before{
      -webkit-box-shadow:1px 1px 6px rgba(16, 22, 26, 0.4);
              box-shadow:1px 1px 6px rgba(16, 22, 26, 0.4); }
    .bp3-tooltip.bp3-dark .bp3-popover-arrow-border,
    .bp3-dark .bp3-tooltip .bp3-popover-arrow-border{
      fill:#10161a;
      fill-opacity:0.2; }
    .bp3-tooltip.bp3-dark .bp3-popover-arrow-fill,
    .bp3-dark .bp3-tooltip .bp3-popover-arrow-fill{
      fill:#e1e8ed; }
  .bp3-tooltip.bp3-intent-primary .bp3-popover-content{
    background:#137cbd;
    color:#ffffff; }
  .bp3-tooltip.bp3-intent-primary .bp3-popover-arrow-fill{
    fill:#137cbd; }
  .bp3-tooltip.bp3-intent-success .bp3-popover-content{
    background:#0f9960;
    color:#ffffff; }
  .bp3-tooltip.bp3-intent-success .bp3-popover-arrow-fill{
    fill:#0f9960; }
  .bp3-tooltip.bp3-intent-warning .bp3-popover-content{
    background:#d9822b;
    color:#ffffff; }
  .bp3-tooltip.bp3-intent-warning .bp3-popover-arrow-fill{
    fill:#d9822b; }
  .bp3-tooltip.bp3-intent-danger .bp3-popover-content{
    background:#db3737;
    color:#ffffff; }
  .bp3-tooltip.bp3-intent-danger .bp3-popover-arrow-fill{
    fill:#db3737; }

.bp3-tooltip-indicator{
  border-bottom:dotted 1px;
  cursor:help; }
.bp3-tree .bp3-icon, .bp3-tree .bp3-icon-standard, .bp3-tree .bp3-icon-large{
  color:#5c7080; }
  .bp3-tree .bp3-icon.bp3-intent-primary, .bp3-tree .bp3-icon-standard.bp3-intent-primary, .bp3-tree .bp3-icon-large.bp3-intent-primary{
    color:#137cbd; }
  .bp3-tree .bp3-icon.bp3-intent-success, .bp3-tree .bp3-icon-standard.bp3-intent-success, .bp3-tree .bp3-icon-large.bp3-intent-success{
    color:#0f9960; }
  .bp3-tree .bp3-icon.bp3-intent-warning, .bp3-tree .bp3-icon-standard.bp3-intent-warning, .bp3-tree .bp3-icon-large.bp3-intent-warning{
    color:#d9822b; }
  .bp3-tree .bp3-icon.bp3-intent-danger, .bp3-tree .bp3-icon-standard.bp3-intent-danger, .bp3-tree .bp3-icon-large.bp3-intent-danger{
    color:#db3737; }

.bp3-tree-node-list{
  list-style:none;
  margin:0;
  padding-left:0; }

.bp3-tree-root{
  background-color:transparent;
  cursor:default;
  padding-left:0;
  position:relative; }

.bp3-tree-node-content-0{
  padding-left:0px; }

.bp3-tree-node-content-1{
  padding-left:23px; }

.bp3-tree-node-content-2{
  padding-left:46px; }

.bp3-tree-node-content-3{
  padding-left:69px; }

.bp3-tree-node-content-4{
  padding-left:92px; }

.bp3-tree-node-content-5{
  padding-left:115px; }

.bp3-tree-node-content-6{
  padding-left:138px; }

.bp3-tree-node-content-7{
  padding-left:161px; }

.bp3-tree-node-content-8{
  padding-left:184px; }

.bp3-tree-node-content-9{
  padding-left:207px; }

.bp3-tree-node-content-10{
  padding-left:230px; }

.bp3-tree-node-content-11{
  padding-left:253px; }

.bp3-tree-node-content-12{
  padding-left:276px; }

.bp3-tree-node-content-13{
  padding-left:299px; }

.bp3-tree-node-content-14{
  padding-left:322px; }

.bp3-tree-node-content-15{
  padding-left:345px; }

.bp3-tree-node-content-16{
  padding-left:368px; }

.bp3-tree-node-content-17{
  padding-left:391px; }

.bp3-tree-node-content-18{
  padding-left:414px; }

.bp3-tree-node-content-19{
  padding-left:437px; }

.bp3-tree-node-content-20{
  padding-left:460px; }

.bp3-tree-node-content{
  -webkit-box-align:center;
      -ms-flex-align:center;
          align-items:center;
  display:-webkit-box;
  display:-ms-flexbox;
  display:flex;
  height:30px;
  padding-right:5px;
  width:100%; }
  .bp3-tree-node-content:hover{
    background-color:rgba(191, 204, 214, 0.4); }

.bp3-tree-node-caret,
.bp3-tree-node-caret-none{
  min-width:30px; }

.bp3-tree-node-caret{
  color:#5c7080;
  cursor:pointer;
  padding:7px;
  -webkit-transform:rotate(0deg);
          transform:rotate(0deg);
  -webkit-transition:-webkit-transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:-webkit-transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9);
  transition:transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9), -webkit-transform 200ms cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-tree-node-caret:hover{
    color:#182026; }
  .bp3-dark .bp3-tree-node-caret{
    color:#a7b6c2; }
    .bp3-dark .bp3-tree-node-caret:hover{
      color:#f5f8fa; }
  .bp3-tree-node-caret.bp3-tree-node-caret-open{
    -webkit-transform:rotate(90deg);
            transform:rotate(90deg); }
  .bp3-tree-node-caret.bp3-icon-standard::before{
    content:""; }

.bp3-tree-node-icon{
  margin-right:7px;
  position:relative; }

.bp3-tree-node-label{
  overflow:hidden;
  text-overflow:ellipsis;
  white-space:nowrap;
  word-wrap:normal;
  -webkit-box-flex:1;
      -ms-flex:1 1 auto;
          flex:1 1 auto;
  position:relative;
  -webkit-user-select:none;
     -moz-user-select:none;
      -ms-user-select:none;
          user-select:none; }
  .bp3-tree-node-label span{
    display:inline; }

.bp3-tree-node-secondary-label{
  padding:0 5px;
  -webkit-user-select:none;
     -moz-user-select:none;
      -ms-user-select:none;
          user-select:none; }
  .bp3-tree-node-secondary-label .bp3-popover-wrapper,
  .bp3-tree-node-secondary-label .bp3-popover-target{
    -webkit-box-align:center;
        -ms-flex-align:center;
            align-items:center;
    display:-webkit-box;
    display:-ms-flexbox;
    display:flex; }

.bp3-tree-node.bp3-disabled .bp3-tree-node-content{
  background-color:inherit;
  color:rgba(92, 112, 128, 0.6);
  cursor:not-allowed; }

.bp3-tree-node.bp3-disabled .bp3-tree-node-caret,
.bp3-tree-node.bp3-disabled .bp3-tree-node-icon{
  color:rgba(92, 112, 128, 0.6);
  cursor:not-allowed; }

.bp3-tree-node.bp3-tree-node-selected > .bp3-tree-node-content{
  background-color:#137cbd; }
  .bp3-tree-node.bp3-tree-node-selected > .bp3-tree-node-content,
  .bp3-tree-node.bp3-tree-node-selected > .bp3-tree-node-content .bp3-icon, .bp3-tree-node.bp3-tree-node-selected > .bp3-tree-node-content .bp3-icon-standard, .bp3-tree-node.bp3-tree-node-selected > .bp3-tree-node-content .bp3-icon-large{
    color:#ffffff; }
  .bp3-tree-node.bp3-tree-node-selected > .bp3-tree-node-content .bp3-tree-node-caret::before{
    color:rgba(255, 255, 255, 0.7); }
  .bp3-tree-node.bp3-tree-node-selected > .bp3-tree-node-content .bp3-tree-node-caret:hover::before{
    color:#ffffff; }

.bp3-dark .bp3-tree-node-content:hover{
  background-color:rgba(92, 112, 128, 0.3); }

.bp3-dark .bp3-tree .bp3-icon, .bp3-dark .bp3-tree .bp3-icon-standard, .bp3-dark .bp3-tree .bp3-icon-large{
  color:#a7b6c2; }
  .bp3-dark .bp3-tree .bp3-icon.bp3-intent-primary, .bp3-dark .bp3-tree .bp3-icon-standard.bp3-intent-primary, .bp3-dark .bp3-tree .bp3-icon-large.bp3-intent-primary{
    color:#137cbd; }
  .bp3-dark .bp3-tree .bp3-icon.bp3-intent-success, .bp3-dark .bp3-tree .bp3-icon-standard.bp3-intent-success, .bp3-dark .bp3-tree .bp3-icon-large.bp3-intent-success{
    color:#0f9960; }
  .bp3-dark .bp3-tree .bp3-icon.bp3-intent-warning, .bp3-dark .bp3-tree .bp3-icon-standard.bp3-intent-warning, .bp3-dark .bp3-tree .bp3-icon-large.bp3-intent-warning{
    color:#d9822b; }
  .bp3-dark .bp3-tree .bp3-icon.bp3-intent-danger, .bp3-dark .bp3-tree .bp3-icon-standard.bp3-intent-danger, .bp3-dark .bp3-tree .bp3-icon-large.bp3-intent-danger{
    color:#db3737; }

.bp3-dark .bp3-tree-node.bp3-tree-node-selected > .bp3-tree-node-content{
  background-color:#137cbd; }
.bp3-omnibar{
  -webkit-filter:blur(0);
          filter:blur(0);
  opacity:1;
  background-color:#ffffff;
  border-radius:3px;
  -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 4px 8px rgba(16, 22, 26, 0.2), 0 18px 46px 6px rgba(16, 22, 26, 0.2);
          box-shadow:0 0 0 1px rgba(16, 22, 26, 0.1), 0 4px 8px rgba(16, 22, 26, 0.2), 0 18px 46px 6px rgba(16, 22, 26, 0.2);
  left:calc(50% - 250px);
  top:20vh;
  width:500px;
  z-index:21; }
  .bp3-omnibar.bp3-overlay-enter, .bp3-omnibar.bp3-overlay-appear{
    -webkit-filter:blur(20px);
            filter:blur(20px);
    opacity:0.2; }
  .bp3-omnibar.bp3-overlay-enter-active, .bp3-omnibar.bp3-overlay-appear-active{
    -webkit-filter:blur(0);
            filter:blur(0);
    opacity:1;
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:200ms;
            transition-duration:200ms;
    -webkit-transition-property:opacity, -webkit-filter;
    transition-property:opacity, -webkit-filter;
    transition-property:filter, opacity;
    transition-property:filter, opacity, -webkit-filter;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-omnibar.bp3-overlay-exit{
    -webkit-filter:blur(0);
            filter:blur(0);
    opacity:1; }
  .bp3-omnibar.bp3-overlay-exit-active{
    -webkit-filter:blur(20px);
            filter:blur(20px);
    opacity:0.2;
    -webkit-transition-delay:0;
            transition-delay:0;
    -webkit-transition-duration:200ms;
            transition-duration:200ms;
    -webkit-transition-property:opacity, -webkit-filter;
    transition-property:opacity, -webkit-filter;
    transition-property:filter, opacity;
    transition-property:filter, opacity, -webkit-filter;
    -webkit-transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9);
            transition-timing-function:cubic-bezier(0.4, 1, 0.75, 0.9); }
  .bp3-omnibar .bp3-input{
    background-color:transparent;
    border-radius:0; }
    .bp3-omnibar .bp3-input, .bp3-omnibar .bp3-input:focus{
      -webkit-box-shadow:none;
              box-shadow:none; }
  .bp3-omnibar .bp3-menu{
    background-color:transparent;
    border-radius:0;
    -webkit-box-shadow:inset 0 1px 0 rgba(16, 22, 26, 0.15);
            box-shadow:inset 0 1px 0 rgba(16, 22, 26, 0.15);
    max-height:calc(60vh - 40px);
    overflow:auto; }
    .bp3-omnibar .bp3-menu:empty{
      display:none; }
  .bp3-dark .bp3-omnibar, .bp3-omnibar.bp3-dark{
    background-color:#30404d;
    -webkit-box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 4px 8px rgba(16, 22, 26, 0.4), 0 18px 46px 6px rgba(16, 22, 26, 0.4);
            box-shadow:0 0 0 1px rgba(16, 22, 26, 0.2), 0 4px 8px rgba(16, 22, 26, 0.4), 0 18px 46px 6px rgba(16, 22, 26, 0.4); }

.bp3-omnibar-overlay .bp3-overlay-backdrop{
  background-color:rgba(16, 22, 26, 0.2); }

.bp3-select-popover .bp3-popover-content{
  padding:5px; }

.bp3-select-popover .bp3-input-group{
  margin-bottom:0; }

.bp3-select-popover .bp3-menu{
  max-height:300px;
  max-width:400px;
  overflow:auto;
  padding:0; }
  .bp3-select-popover .bp3-menu:not(:first-child){
    padding-top:5px; }

.bp3-multi-select{
  min-width:150px; }

.bp3-multi-select-popover .bp3-menu{
  max-height:300px;
  max-width:400px;
  overflow:auto; }

.bp3-select-popover .bp3-popover-content{
  padding:5px; }

.bp3-select-popover .bp3-input-group{
  margin-bottom:0; }

.bp3-select-popover .bp3-menu{
  max-height:300px;
  max-width:400px;
  overflow:auto;
  padding:0; }
  .bp3-select-popover .bp3-menu:not(:first-child){
    padding-top:5px; }
/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/* This file was auto-generated by ensureUiComponents() in @jupyterlab/buildutils */

/**
 * (DEPRECATED) Support for consuming icons as CSS background images
 */

/* Icons urls */

:root {
  --jp-icon-add-above: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPGcgY2xpcC1wYXRoPSJ1cmwoI2NsaXAwXzEzN18xOTQ5MikiPgo8cGF0aCBjbGFzcz0ianAtaWNvbjMiIGQ9Ik00Ljc1IDQuOTMwNjZINi42MjVWNi44MDU2NkM2LjYyNSA3LjAxMTkxIDYuNzkzNzUgNy4xODA2NiA3IDcuMTgwNjZDNy4yMDYyNSA3LjE4MDY2IDcuMzc1IDcuMDExOTEgNy4zNzUgNi44MDU2NlY0LjkzMDY2SDkuMjVDOS40NTYyNSA0LjkzMDY2IDkuNjI1IDQuNzYxOTEgOS42MjUgNC41NTU2NkM5LjYyNSA0LjM0OTQxIDkuNDU2MjUgNC4xODA2NiA5LjI1IDQuMTgwNjZINy4zNzVWMi4zMDU2NkM3LjM3NSAyLjA5OTQxIDcuMjA2MjUgMS45MzA2NiA3IDEuOTMwNjZDNi43OTM3NSAxLjkzMDY2IDYuNjI1IDIuMDk5NDEgNi42MjUgMi4zMDU2NlY0LjE4MDY2SDQuNzVDNC41NDM3NSA0LjE4MDY2IDQuMzc1IDQuMzQ5NDEgNC4zNzUgNC41NTU2NkM0LjM3NSA0Ljc2MTkxIDQuNTQzNzUgNC45MzA2NiA0Ljc1IDQuOTMwNjZaIiBmaWxsPSIjNjE2MTYxIiBzdHJva2U9IiM2MTYxNjEiIHN0cm9rZS13aWR0aD0iMC43Ii8+CjwvZz4KPHBhdGggY2xhc3M9ImpwLWljb24zIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGNsaXAtcnVsZT0iZXZlbm9kZCIgZD0iTTExLjUgOS41VjExLjVMMi41IDExLjVWOS41TDExLjUgOS41Wk0xMiA4QzEyLjU1MjMgOCAxMyA4LjQ0NzcyIDEzIDlWMTJDMTMgMTIuNTUyMyAxMi41NTIzIDEzIDEyIDEzTDIgMTNDMS40NDc3MiAxMyAxIDEyLjU1MjMgMSAxMlY5QzEgOC40NDc3MiAxLjQ0NzcxIDggMiA4TDEyIDhaIiBmaWxsPSIjNjE2MTYxIi8+CjxkZWZzPgo8Y2xpcFBhdGggaWQ9ImNsaXAwXzEzN18xOTQ5MiI+CjxyZWN0IGNsYXNzPSJqcC1pY29uMyIgd2lkdGg9IjYiIGhlaWdodD0iNiIgZmlsbD0id2hpdGUiIHRyYW5zZm9ybT0ibWF0cml4KC0xIDAgMCAxIDEwIDEuNTU1NjYpIi8+CjwvY2xpcFBhdGg+CjwvZGVmcz4KPC9zdmc+Cg==);
  --jp-icon-add-below: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPGcgY2xpcC1wYXRoPSJ1cmwoI2NsaXAwXzEzN18xOTQ5OCkiPgo8cGF0aCBjbGFzcz0ianAtaWNvbjMiIGQ9Ik05LjI1IDEwLjA2OTNMNy4zNzUgMTAuMDY5M0w3LjM3NSA4LjE5NDM0QzcuMzc1IDcuOTg4MDkgNy4yMDYyNSA3LjgxOTM0IDcgNy44MTkzNEM2Ljc5Mzc1IDcuODE5MzQgNi42MjUgNy45ODgwOSA2LjYyNSA4LjE5NDM0TDYuNjI1IDEwLjA2OTNMNC43NSAxMC4wNjkzQzQuNTQzNzUgMTAuMDY5MyA0LjM3NSAxMC4yMzgxIDQuMzc1IDEwLjQ0NDNDNC4zNzUgMTAuNjUwNiA0LjU0Mzc1IDEwLjgxOTMgNC43NSAxMC44MTkzTDYuNjI1IDEwLjgxOTNMNi42MjUgMTIuNjk0M0M2LjYyNSAxMi45MDA2IDYuNzkzNzUgMTMuMDY5MyA3IDEzLjA2OTNDNy4yMDYyNSAxMy4wNjkzIDcuMzc1IDEyLjkwMDYgNy4zNzUgMTIuNjk0M0w3LjM3NSAxMC44MTkzTDkuMjUgMTAuODE5M0M5LjQ1NjI1IDEwLjgxOTMgOS42MjUgMTAuNjUwNiA5LjYyNSAxMC40NDQzQzkuNjI1IDEwLjIzODEgOS40NTYyNSAxMC4wNjkzIDkuMjUgMTAuMDY5M1oiIGZpbGw9IiM2MTYxNjEiIHN0cm9rZT0iIzYxNjE2MSIgc3Ryb2tlLXdpZHRoPSIwLjciLz4KPC9nPgo8cGF0aCBjbGFzcz0ianAtaWNvbjMiIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBkPSJNMi41IDUuNUwyLjUgMy41TDExLjUgMy41TDExLjUgNS41TDIuNSA1LjVaTTIgN0MxLjQ0NzcyIDcgMSA2LjU1MjI4IDEgNkwxIDNDMSAyLjQ0NzcyIDEuNDQ3NzIgMiAyIDJMMTIgMkMxMi41NTIzIDIgMTMgMi40NDc3MiAxMyAzTDEzIDZDMTMgNi41NTIyOSAxMi41NTIzIDcgMTIgN0wyIDdaIiBmaWxsPSIjNjE2MTYxIi8+CjxkZWZzPgo8Y2xpcFBhdGggaWQ9ImNsaXAwXzEzN18xOTQ5OCI+CjxyZWN0IGNsYXNzPSJqcC1pY29uMyIgd2lkdGg9IjYiIGhlaWdodD0iNiIgZmlsbD0id2hpdGUiIHRyYW5zZm9ybT0ibWF0cml4KDEgMS43NDg0NmUtMDcgMS43NDg0NmUtMDcgLTEgNCAxMy40NDQzKSIvPgo8L2NsaXBQYXRoPgo8L2RlZnM+Cjwvc3ZnPgo=);
  --jp-icon-add: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTE5IDEzaC02djZoLTJ2LTZINXYtMmg2VjVoMnY2aDZ2MnoiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-bell: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDE2IDE2IiB2ZXJzaW9uPSIxLjEiPgogICA8cGF0aCBjbGFzcz0ianAtaWNvbjIganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjMzMzMzMzIgogICAgICBkPSJtOCAwLjI5Yy0xLjQgMC0yLjcgMC43My0zLjYgMS44LTEuMiAxLjUtMS40IDMuNC0xLjUgNS4yLTAuMTggMi4yLTAuNDQgNC0yLjMgNS4zbDAuMjggMS4zaDVjMC4wMjYgMC42NiAwLjMyIDEuMSAwLjcxIDEuNSAwLjg0IDAuNjEgMiAwLjYxIDIuOCAwIDAuNTItMC40IDAuNi0xIDAuNzEtMS41aDVsMC4yOC0xLjNjLTEuOS0wLjk3LTIuMi0zLjMtMi4zLTUuMy0wLjEzLTEuOC0wLjI2LTMuNy0xLjUtNS4yLTAuODUtMS0yLjItMS44LTMuNi0xLjh6bTAgMS40YzAuODggMCAxLjkgMC41NSAyLjUgMS4zIDAuODggMS4xIDEuMSAyLjcgMS4yIDQuNCAwLjEzIDEuNyAwLjIzIDMuNiAxLjMgNS4yaC0xMGMxLjEtMS42IDEuMi0zLjQgMS4zLTUuMiAwLjEzLTEuNyAwLjMtMy4zIDEuMi00LjQgMC41OS0wLjcyIDEuNi0xLjMgMi41LTEuM3ptLTAuNzQgMTJoMS41Yy0wLjAwMTUgMC4yOCAwLjAxNSAwLjc5LTAuNzQgMC43OS0wLjczIDAuMDAxNi0wLjcyLTAuNTMtMC43NC0wLjc5eiIgLz4KPC9zdmc+Cg==);
  --jp-icon-bug-dot: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGNsYXNzPSJqcC1pY29uMyBqcC1pY29uLXNlbGVjdGFibGUiIGZpbGw9IiM2MTYxNjEiPgogICAgICAgIDxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBkPSJNMTcuMTkgOEgyMFYxMEgxNy45MUMxNy45NiAxMC4zMyAxOCAxMC42NiAxOCAxMVYxMkgyMFYxNEgxOC41SDE4VjE0LjAyNzVDMTUuNzUgMTQuMjc2MiAxNCAxNi4xODM3IDE0IDE4LjVDMTQgMTkuMjA4IDE0LjE2MzUgMTkuODc3OSAxNC40NTQ5IDIwLjQ3MzlDMTMuNzA2MyAyMC44MTE3IDEyLjg3NTcgMjEgMTIgMjFDOS43OCAyMSA3Ljg1IDE5Ljc5IDYuODEgMThINFYxNkg2LjA5QzYuMDQgMTUuNjcgNiAxNS4zNCA2IDE1VjE0SDRWMTJINlYxMUM2IDEwLjY2IDYuMDQgMTAuMzMgNi4wOSAxMEg0VjhINi44MUM3LjI2IDcuMjIgNy44OCA2LjU1IDguNjIgNi4wNEw3IDQuNDFMOC40MSAzTDEwLjU5IDUuMTdDMTEuMDQgNS4wNiAxMS41MSA1IDEyIDVDMTIuNDkgNSAxMi45NiA1LjA2IDEzLjQyIDUuMTdMMTUuNTkgM0wxNyA0LjQxTDE1LjM3IDYuMDRDMTYuMTIgNi41NSAxNi43NCA3LjIyIDE3LjE5IDhaTTEwIDE2SDE0VjE0SDEwVjE2Wk0xMCAxMkgxNFYxMEgxMFYxMloiIGZpbGw9IiM2MTYxNjEiLz4KICAgICAgICA8cGF0aCBkPSJNMjIgMTguNUMyMiAyMC40MzMgMjAuNDMzIDIyIDE4LjUgMjJDMTYuNTY3IDIyIDE1IDIwLjQzMyAxNSAxOC41QzE1IDE2LjU2NyAxNi41NjcgMTUgMTguNSAxNUMyMC40MzMgMTUgMjIgMTYuNTY3IDIyIDE4LjVaIiBmaWxsPSIjNjE2MTYxIi8+CiAgICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-bug: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIj4KICAgIDxwYXRoIGQ9Ik0yMCA4aC0yLjgxYy0uNDUtLjc4LTEuMDctMS40NS0xLjgyLTEuOTZMMTcgNC40MSAxNS41OSAzbC0yLjE3IDIuMTdDMTIuOTYgNS4wNiAxMi40OSA1IDEyIDVjLS40OSAwLS45Ni4wNi0xLjQxLjE3TDguNDEgMyA3IDQuNDFsMS42MiAxLjYzQzcuODggNi41NSA3LjI2IDcuMjIgNi44MSA4SDR2MmgyLjA5Yy0uMDUuMzMtLjA5LjY2LS4wOSAxdjFINHYyaDJ2MWMwIC4zNC4wNC42Ny4wOSAxSDR2MmgyLjgxYzEuMDQgMS43OSAyLjk3IDMgNS4xOSAzczQuMTUtMS4yMSA1LjE5LTNIMjB2LTJoLTIuMDljLjA1LS4zMy4wOS0uNjYuMDktMXYtMWgydi0yaC0ydi0xYzAtLjM0LS4wNC0uNjctLjA5LTFIMjBWOHptLTYgOGgtNHYtMmg0djJ6bTAtNGgtNHYtMmg0djJ6Ii8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-build: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTE0LjkgMTcuNDVDMTYuMjUgMTcuNDUgMTcuMzUgMTYuMzUgMTcuMzUgMTVDMTcuMzUgMTMuNjUgMTYuMjUgMTIuNTUgMTQuOSAxMi41NUMxMy41NCAxMi41NSAxMi40NSAxMy42NSAxMi40NSAxNUMxMi40NSAxNi4zNSAxMy41NCAxNy40NSAxNC45IDE3LjQ1Wk0yMC4xIDE1LjY4TDIxLjU4IDE2Ljg0QzIxLjcxIDE2Ljk1IDIxLjc1IDE3LjEzIDIxLjY2IDE3LjI5TDIwLjI2IDE5LjcxQzIwLjE3IDE5Ljg2IDIwIDE5LjkyIDE5LjgzIDE5Ljg2TDE4LjA5IDE5LjE2QzE3LjczIDE5LjQ0IDE3LjMzIDE5LjY3IDE2LjkxIDE5Ljg1TDE2LjY0IDIxLjdDMTYuNjIgMjEuODcgMTYuNDcgMjIgMTYuMyAyMkgxMy41QzEzLjMyIDIyIDEzLjE4IDIxLjg3IDEzLjE1IDIxLjdMMTIuODkgMTkuODVDMTIuNDYgMTkuNjcgMTIuMDcgMTkuNDQgMTEuNzEgMTkuMTZMOS45NjAwMiAxOS44NkM5LjgxMDAyIDE5LjkyIDkuNjIwMDIgMTkuODYgOS41NDAwMiAxOS43MUw4LjE0MDAyIDE3LjI5QzguMDUwMDIgMTcuMTMgOC4wOTAwMiAxNi45NSA4LjIyMDAyIDE2Ljg0TDkuNzAwMDIgMTUuNjhMOS42NTAwMSAxNUw5LjcwMDAyIDE0LjMxTDguMjIwMDIgMTMuMTZDOC4wOTAwMiAxMy4wNSA4LjA1MDAyIDEyLjg2IDguMTQwMDIgMTIuNzFMOS41NDAwMiAxMC4yOUM5LjYyMDAyIDEwLjEzIDkuODEwMDIgMTAuMDcgOS45NjAwMiAxMC4xM0wxMS43MSAxMC44NEMxMi4wNyAxMC41NiAxMi40NiAxMC4zMiAxMi44OSAxMC4xNUwxMy4xNSA4LjI4OTk4QzEzLjE4IDguMTI5OTggMTMuMzIgNy45OTk5OCAxMy41IDcuOTk5OThIMTYuM0MxNi40NyA3Ljk5OTk4IDE2LjYyIDguMTI5OTggMTYuNjQgOC4yODk5OEwxNi45MSAxMC4xNUMxNy4zMyAxMC4zMiAxNy43MyAxMC41NiAxOC4wOSAxMC44NEwxOS44MyAxMC4xM0MyMCAxMC4wNyAyMC4xNyAxMC4xMyAyMC4yNiAxMC4yOUwyMS42NiAxMi43MUMyMS43NSAxMi44NiAyMS43MSAxMy4wNSAyMS41OCAxMy4xNkwyMC4xIDE0LjMxTDIwLjE1IDE1TDIwLjEgMTUuNjhaIi8+CiAgICA8cGF0aCBkPSJNNy4zMjk2NiA3LjQ0NDU0QzguMDgzMSA3LjAwOTU0IDguMzM5MzIgNi4wNTMzMiA3LjkwNDMyIDUuMjk5ODhDNy40NjkzMiA0LjU0NjQzIDYuNTA4MSA0LjI4MTU2IDUuNzU0NjYgNC43MTY1NkM1LjM5MTc2IDQuOTI2MDggNS4xMjY5NSA1LjI3MTE4IDUuMDE4NDkgNS42NzU5NEM0LjkxMDA0IDYuMDgwNzEgNC45NjY4MiA2LjUxMTk4IDUuMTc2MzQgNi44NzQ4OEM1LjYxMTM0IDcuNjI4MzIgNi41NzYyMiA3Ljg3OTU0IDcuMzI5NjYgNy40NDQ1NFpNOS42NTcxOCA0Ljc5NTkzTDEwLjg2NzIgNC45NTE3OUMxMC45NjI4IDQuOTc3NDEgMTEuMDQwMiA1LjA3MTMzIDExLjAzODIgNS4xODc5M0wxMS4wMzg4IDYuOTg4OTNDMTEuMDQ1NSA3LjEwMDU0IDEwLjk2MTYgNy4xOTUxOCAxMC44NTUgNy4yMTA1NEw5LjY2MDAxIDcuMzgwODNMOS4yMzkxNSA4LjEzMTg4TDkuNjY5NjEgOS4yNTc0NUM5LjcwNzI5IDkuMzYyNzEgOS42NjkzNCA5LjQ3Njk5IDkuNTc0MDggOS41MzE5OUw4LjAxNTIzIDEwLjQzMkM3LjkxMTMxIDEwLjQ5MiA3Ljc5MzM3IDEwLjQ2NzcgNy43MjEwNSAxMC4zODI0TDYuOTg3NDggOS40MzE4OEw2LjEwOTMxIDkuNDMwODNMNS4zNDcwNCAxMC4zOTA1QzUuMjg5MDkgMTAuNDcwMiA1LjE3MzgzIDEwLjQ5MDUgNS4wNzE4NyAxMC40MzM5TDMuNTEyNDUgOS41MzI5M0MzLjQxMDQ5IDkuNDc2MzMgMy4zNzY0NyA5LjM1NzQxIDMuNDEwNzUgOS4yNTY3OUwzLjg2MzQ3IDguMTQwOTNMMy42MTc0OSA3Ljc3NDg4TDMuNDIzNDcgNy4zNzg4M0wyLjIzMDc1IDcuMjEyOTdDMi4xMjY0NyA3LjE5MjM1IDIuMDQwNDkgNy4xMDM0MiAyLjA0MjQ1IDYuOTg2ODJMMi4wNDE4NyA1LjE4NTgyQzIuMDQzODMgNS4wNjkyMiAyLjExOTA5IDQuOTc5NTggMi4yMTcwNCA0Ljk2OTIyTDMuNDIwNjUgNC43OTM5M0wzLjg2NzQ5IDQuMDI3ODhMMy40MTEwNSAyLjkxNzMxQzMuMzczMzcgMi44MTIwNCAzLjQxMTMxIDIuNjk3NzYgMy41MTUyMyAyLjYzNzc2TDUuMDc0MDggMS43Mzc3NkM1LjE2OTM0IDEuNjgyNzYgNS4yODcyOSAxLjcwNzA0IDUuMzU5NjEgMS43OTIzMUw2LjExOTE1IDIuNzI3ODhMNi45ODAwMSAyLjczODkzTDcuNzI0OTYgMS43ODkyMkM3Ljc5MTU2IDEuNzA0NTggNy45MTU0OCAxLjY3OTIyIDguMDA4NzkgMS43NDA4Mkw5LjU2ODIxIDIuNjQxODJDOS42NzAxNyAyLjY5ODQyIDkuNzEyODUgMi44MTIzNCA5LjY4NzIzIDIuOTA3OTdMOS4yMTcxOCA0LjAzMzgzTDkuNDYzMTYgNC4zOTk4OEw5LjY1NzE4IDQuNzk1OTNaIi8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-caret-down-empty-thin: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIwIDIwIj4KCTxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSIgc2hhcGUtcmVuZGVyaW5nPSJnZW9tZXRyaWNQcmVjaXNpb24iPgoJCTxwb2x5Z29uIGNsYXNzPSJzdDEiIHBvaW50cz0iOS45LDEzLjYgMy42LDcuNCA0LjQsNi42IDkuOSwxMi4yIDE1LjQsNi43IDE2LjEsNy40ICIvPgoJPC9nPgo8L3N2Zz4K);
  --jp-icon-caret-down-empty: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDE4IDE4Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiIHNoYXBlLXJlbmRlcmluZz0iZ2VvbWV0cmljUHJlY2lzaW9uIj4KICAgIDxwYXRoIGQ9Ik01LjIsNS45TDksOS43bDMuOC0zLjhsMS4yLDEuMmwtNC45LDVsLTQuOS01TDUuMiw1Ljl6Ii8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-caret-down: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDE4IDE4Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiIHNoYXBlLXJlbmRlcmluZz0iZ2VvbWV0cmljUHJlY2lzaW9uIj4KICAgIDxwYXRoIGQ9Ik01LjIsNy41TDksMTEuMmwzLjgtMy44SDUuMnoiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-caret-left: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDE4IDE4Ij4KCTxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSIgc2hhcGUtcmVuZGVyaW5nPSJnZW9tZXRyaWNQcmVjaXNpb24iPgoJCTxwYXRoIGQ9Ik0xMC44LDEyLjhMNy4xLDlsMy44LTMuOGwwLDcuNkgxMC44eiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-caret-right: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDE4IDE4Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiIHNoYXBlLXJlbmRlcmluZz0iZ2VvbWV0cmljUHJlY2lzaW9uIj4KICAgIDxwYXRoIGQ9Ik03LjIsNS4yTDEwLjksOWwtMy44LDMuOFY1LjJINy4yeiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-caret-up-empty-thin: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIwIDIwIj4KCTxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSIgc2hhcGUtcmVuZGVyaW5nPSJnZW9tZXRyaWNQcmVjaXNpb24iPgoJCTxwb2x5Z29uIGNsYXNzPSJzdDEiIHBvaW50cz0iMTUuNCwxMy4zIDkuOSw3LjcgNC40LDEzLjIgMy42LDEyLjUgOS45LDYuMyAxNi4xLDEyLjYgIi8+Cgk8L2c+Cjwvc3ZnPgo=);
  --jp-icon-caret-up: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDE4IDE4Ij4KCTxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSIgc2hhcGUtcmVuZGVyaW5nPSJnZW9tZXRyaWNQcmVjaXNpb24iPgoJCTxwYXRoIGQ9Ik01LjIsMTAuNUw5LDYuOGwzLjgsMy44SDUuMnoiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-case-sensitive: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIwIDIwIj4KICA8ZyBjbGFzcz0ianAtaWNvbjIiIGZpbGw9IiM0MTQxNDEiPgogICAgPHJlY3QgeD0iMiIgeT0iMiIgd2lkdGg9IjE2IiBoZWlnaHQ9IjE2Ii8+CiAgPC9nPgogIDxnIGNsYXNzPSJqcC1pY29uLWFjY2VudDIiIGZpbGw9IiNGRkYiPgogICAgPHBhdGggZD0iTTcuNiw4aDAuOWwzLjUsOGgtMS4xTDEwLDE0SDZsLTAuOSwySDRMNy42LDh6IE04LDkuMUw2LjQsMTNoMy4yTDgsOS4xeiIvPgogICAgPHBhdGggZD0iTTE2LjYsOS44Yy0wLjIsMC4xLTAuNCwwLjEtMC43LDAuMWMtMC4yLDAtMC40LTAuMS0wLjYtMC4yYy0wLjEtMC4xLTAuMi0wLjQtMC4yLTAuNyBjLTAuMywwLjMtMC42LDAuNS0wLjksMC43Yy0wLjMsMC4xLTAuNywwLjItMS4xLDAuMmMtMC4zLDAtMC41LDAtMC43LTAuMWMtMC4yLTAuMS0wLjQtMC4yLTAuNi0wLjNjLTAuMi0wLjEtMC4zLTAuMy0wLjQtMC41IGMtMC4xLTAuMi0wLjEtMC40LTAuMS0wLjdjMC0wLjMsMC4xLTAuNiwwLjItMC44YzAuMS0wLjIsMC4zLTAuNCwwLjQtMC41QzEyLDcsMTIuMiw2LjksMTIuNSw2LjhjMC4yLTAuMSwwLjUtMC4xLDAuNy0wLjIgYzAuMy0wLjEsMC41LTAuMSwwLjctMC4xYzAuMiwwLDAuNC0wLjEsMC42LTAuMWMwLjIsMCwwLjMtMC4xLDAuNC0wLjJjMC4xLTAuMSwwLjItMC4yLDAuMi0wLjRjMC0xLTEuMS0xLTEuMy0xIGMtMC40LDAtMS40LDAtMS40LDEuMmgtMC45YzAtMC40LDAuMS0wLjcsMC4yLTFjMC4xLTAuMiwwLjMtMC40LDAuNS0wLjZjMC4yLTAuMiwwLjUtMC4zLDAuOC0wLjNDMTMuMyw0LDEzLjYsNCwxMy45LDQgYzAuMywwLDAuNSwwLDAuOCwwLjFjMC4zLDAsMC41LDAuMSwwLjcsMC4yYzAuMiwwLjEsMC40LDAuMywwLjUsMC41QzE2LDUsMTYsNS4yLDE2LDUuNnYyLjljMCwwLjIsMCwwLjQsMCwwLjUgYzAsMC4xLDAuMSwwLjIsMC4zLDAuMmMwLjEsMCwwLjIsMCwwLjMsMFY5Ljh6IE0xNS4yLDYuOWMtMS4yLDAuNi0zLjEsMC4yLTMuMSwxLjRjMCwxLjQsMy4xLDEsMy4xLTAuNVY2Ljl6Ii8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-check: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIj4KICAgIDxwYXRoIGQ9Ik05IDE2LjE3TDQuODMgMTJsLTEuNDIgMS40MUw5IDE5IDIxIDdsLTEuNDEtMS40MXoiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-circle-empty: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTEyIDJDNi40NyAyIDIgNi40NyAyIDEyczQuNDcgMTAgMTAgMTAgMTAtNC40NyAxMC0xMFMxNy41MyAyIDEyIDJ6bTAgMThjLTQuNDEgMC04LTMuNTktOC04czMuNTktOCA4LTggOCAzLjU5IDggOC0zLjU5IDgtOCA4eiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-circle: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMTggMTgiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPGNpcmNsZSBjeD0iOSIgY3k9IjkiIHI9IjgiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-clear: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8bWFzayBpZD0iZG9udXRIb2xlIj4KICAgIDxyZWN0IHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgZmlsbD0id2hpdGUiIC8+CiAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSI4IiBmaWxsPSJibGFjayIvPgogIDwvbWFzaz4KCiAgPGcgY2xhc3M9ImpwLWljb24zIiBmaWxsPSIjNjE2MTYxIj4KICAgIDxyZWN0IGhlaWdodD0iMTgiIHdpZHRoPSIyIiB4PSIxMSIgeT0iMyIgdHJhbnNmb3JtPSJyb3RhdGUoMzE1LCAxMiwgMTIpIi8+CiAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMCIgbWFzaz0idXJsKCNkb251dEhvbGUpIi8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-close: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbi1ub25lIGpwLWljb24tc2VsZWN0YWJsZS1pbnZlcnNlIGpwLWljb24zLWhvdmVyIiBmaWxsPSJub25lIj4KICAgIDxjaXJjbGUgY3g9IjEyIiBjeT0iMTIiIHI9IjExIi8+CiAgPC9nPgoKICA8ZyBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIGpwLWljb24tYWNjZW50Mi1ob3ZlciIgZmlsbD0iIzYxNjE2MSI+CiAgICA8cGF0aCBkPSJNMTkgNi40MUwxNy41OSA1IDEyIDEwLjU5IDYuNDEgNSA1IDYuNDEgMTAuNTkgMTIgNSAxNy41OSA2LjQxIDE5IDEyIDEzLjQxIDE3LjU5IDE5IDE5IDE3LjU5IDEzLjQxIDEyeiIvPgogIDwvZz4KCiAgPGcgY2xhc3M9ImpwLWljb24tbm9uZSBqcC1pY29uLWJ1c3kiIGZpbGw9Im5vbmUiPgogICAgPGNpcmNsZSBjeD0iMTIiIGN5PSIxMiIgcj0iNyIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-code: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjIiIGhlaWdodD0iMjIiIHZpZXdCb3g9IjAgMCAyOCAyOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KCTxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CgkJPHBhdGggZD0iTTExLjQgMTguNkw2LjggMTRMMTEuNCA5LjRMMTAgOEw0IDE0TDEwIDIwTDExLjQgMTguNlpNMTYuNiAxOC42TDIxLjIgMTRMMTYuNiA5LjRMMTggOEwyNCAxNEwxOCAyMEwxNi42IDE4LjZWMTguNloiLz4KCTwvZz4KPC9zdmc+Cg==);
  --jp-icon-console: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIwMCAyMDAiPgogIDxnIGNsYXNzPSJqcC1jb25zb2xlLWljb24tYmFja2dyb3VuZC1jb2xvciBqcC1pY29uLXNlbGVjdGFibGUiIGZpbGw9IiMwMjg4RDEiPgogICAgPHBhdGggZD0iTTIwIDE5LjhoMTYwdjE1OS45SDIweiIvPgogIDwvZz4KICA8ZyBjbGFzcz0ianAtY29uc29sZS1pY29uLWNvbG9yIGpwLWljb24tc2VsZWN0YWJsZS1pbnZlcnNlIiBmaWxsPSIjZmZmIj4KICAgIDxwYXRoIGQ9Ik0xMDUgMTI3LjNoNDB2MTIuOGgtNDB6TTUxLjEgNzdMNzQgOTkuOWwtMjMuMyAyMy4zIDEwLjUgMTAuNSAyMy4zLTIzLjNMOTUgOTkuOSA4NC41IDg5LjQgNjEuNiA2Ni41eiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-copy: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMTggMTgiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTExLjksMUgzLjJDMi40LDEsMS43LDEuNywxLjcsMi41djEwLjJoMS41VjIuNWg4LjdWMXogTTE0LjEsMy45aC04Yy0wLjgsMC0xLjUsMC43LTEuNSwxLjV2MTAuMmMwLDAuOCwwLjcsMS41LDEuNSwxLjVoOCBjMC44LDAsMS41LTAuNywxLjUtMS41VjUuNEMxNS41LDQuNiwxNC45LDMuOSwxNC4xLDMuOXogTTE0LjEsMTUuNWgtOFY1LjRoOFYxNS41eiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-copyright: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDI0IDI0IiBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCI+CiAgPGcgY2xhc3M9ImpwLWljb24zIiBmaWxsPSIjNjE2MTYxIj4KICAgIDxwYXRoIGQ9Ik0xMS44OCw5LjE0YzEuMjgsMC4wNiwxLjYxLDEuMTUsMS42MywxLjY2aDEuNzljLTAuMDgtMS45OC0xLjQ5LTMuMTktMy40NS0zLjE5QzkuNjQsNy42MSw4LDksOCwxMi4xNCBjMCwxLjk0LDAuOTMsNC4yNCwzLjg0LDQuMjRjMi4yMiwwLDMuNDEtMS42NSwzLjQ0LTIuOTVoLTEuNzljLTAuMDMsMC41OS0wLjQ1LDEuMzgtMS42MywxLjQ0QzEwLjU1LDE0LjgzLDEwLDEzLjgxLDEwLDEyLjE0IEMxMCw5LjI1LDExLjI4LDkuMTYsMTEuODgsOS4xNHogTTEyLDJDNi40OCwyLDIsNi40OCwyLDEyczQuNDgsMTAsMTAsMTBzMTAtNC40OCwxMC0xMFMxNy41MiwyLDEyLDJ6IE0xMiwyMGMtNC40MSwwLTgtMy41OS04LTggczMuNTktOCw4LThzOCwzLjU5LDgsOFMxNi40MSwyMCwxMiwyMHoiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-cut: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTkuNjQgNy42NGMuMjMtLjUuMzYtMS4wNS4zNi0xLjY0IDAtMi4yMS0xLjc5LTQtNC00UzIgMy43OSAyIDZzMS43OSA0IDQgNGMuNTkgMCAxLjE0LS4xMyAxLjY0LS4zNkwxMCAxMmwtMi4zNiAyLjM2QzcuMTQgMTQuMTMgNi41OSAxNCA2IDE0Yy0yLjIxIDAtNCAxLjc5LTQgNHMxLjc5IDQgNCA0IDQtMS43OSA0LTRjMC0uNTktLjEzLTEuMTQtLjM2LTEuNjRMMTIgMTRsNyA3aDN2LTFMOS42NCA3LjY0ek02IDhjLTEuMSAwLTItLjg5LTItMnMuOS0yIDItMiAyIC44OSAyIDItLjkgMi0yIDJ6bTAgMTJjLTEuMSAwLTItLjg5LTItMnMuOS0yIDItMiAyIC44OSAyIDItLjkgMi0yIDJ6bTYtNy41Yy0uMjggMC0uNS0uMjItLjUtLjVzLjIyLS41LjUtLjUuNS4yMi41LjUtLjIyLjUtLjUuNXpNMTkgM2wtNiA2IDIgMiA3LTdWM3oiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-delete: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCIgd2lkdGg9IjE2cHgiIGhlaWdodD0iMTZweCI+CiAgICA8cGF0aCBkPSJNMCAwaDI0djI0SDB6IiBmaWxsPSJub25lIiAvPgogICAgPHBhdGggY2xhc3M9ImpwLWljb24zIiBmaWxsPSIjNjI2MjYyIiBkPSJNNiAxOWMwIDEuMS45IDIgMiAyaDhjMS4xIDAgMi0uOSAyLTJWN0g2djEyek0xOSA0aC0zLjVsLTEtMWgtNWwtMSAxSDV2MmgxNFY0eiIgLz4KPC9zdmc+Cg==);
  --jp-icon-download: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTE5IDloLTRWM0g5djZINWw3IDcgNy03ek01IDE4djJoMTR2LTJINXoiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-duplicate: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggY2xhc3M9ImpwLWljb24zIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGNsaXAtcnVsZT0iZXZlbm9kZCIgZD0iTTIuNzk5OTggMC44NzVIOC44OTU4MkM5LjIwMDYxIDAuODc1IDkuNDQ5OTggMS4xMzkxNCA5LjQ0OTk4IDEuNDYxOThDOS40NDk5OCAxLjc4NDgyIDkuMjAwNjEgMi4wNDg5NiA4Ljg5NTgyIDIuMDQ4OTZIMy4zNTQxNUMzLjA0OTM2IDIuMDQ4OTYgMi43OTk5OCAyLjMxMzEgMi43OTk5OCAyLjYzNTk0VjkuNjc5NjlDMi43OTk5OCAxMC4wMDI1IDIuNTUwNjEgMTAuMjY2NyAyLjI0NTgyIDEwLjI2NjdDMS45NDEwMyAxMC4yNjY3IDEuNjkxNjUgMTAuMDAyNSAxLjY5MTY1IDkuNjc5NjlWMi4wNDg5NkMxLjY5MTY1IDEuNDAzMjggMi4xOTA0IDAuODc1IDIuNzk5OTggMC44NzVaTTUuMzY2NjUgMTEuOVY0LjU1SDExLjA4MzNWMTEuOUg1LjM2NjY1Wk00LjE0MTY1IDQuMTQxNjdDNC4xNDE2NSAzLjY5MDYzIDQuNTA3MjggMy4zMjUgNC45NTgzMiAzLjMyNUgxMS40OTE3QzExLjk0MjcgMy4zMjUgMTIuMzA4MyAzLjY5MDYzIDEyLjMwODMgNC4xNDE2N1YxMi4zMDgzQzEyLjMwODMgMTIuNzU5NCAxMS45NDI3IDEzLjEyNSAxMS40OTE3IDEzLjEyNUg0Ljk1ODMyQzQuNTA3MjggMTMuMTI1IDQuMTQxNjUgMTIuNzU5NCA0LjE0MTY1IDEyLjMwODNWNC4xNDE2N1oiIGZpbGw9IiM2MTYxNjEiLz4KPHBhdGggY2xhc3M9ImpwLWljb24zIiBkPSJNOS40MzU3NCA4LjI2NTA3SDguMzY0MzFWOS4zMzY1QzguMzY0MzEgOS40NTQzNSA4LjI2Nzg4IDkuNTUwNzggOC4xNTAwMiA5LjU1MDc4QzguMDMyMTcgOS41NTA3OCA3LjkzNTc0IDkuNDU0MzUgNy45MzU3NCA5LjMzNjVWOC4yNjUwN0g2Ljg2NDMxQzYuNzQ2NDUgOC4yNjUwNyA2LjY1MDAyIDguMTY4NjQgNi42NTAwMiA4LjA1MDc4QzYuNjUwMDIgNy45MzI5MiA2Ljc0NjQ1IDcuODM2NSA2Ljg2NDMxIDcuODM2NUg3LjkzNTc0VjYuNzY1MDdDNy45MzU3NCA2LjY0NzIxIDguMDMyMTcgNi41NTA3OCA4LjE1MDAyIDYuNTUwNzhDOC4yNjc4OCA2LjU1MDc4IDguMzY0MzEgNi42NDcyMSA4LjM2NDMxIDYuNzY1MDdWNy44MzY1SDkuNDM1NzRDOS41NTM2IDcuODM2NSA5LjY1MDAyIDcuOTMyOTIgOS42NTAwMiA4LjA1MDc4QzkuNjUwMDIgOC4xNjg2NCA5LjU1MzYgOC4yNjUwNyA5LjQzNTc0IDguMjY1MDdaIiBmaWxsPSIjNjE2MTYxIiBzdHJva2U9IiM2MTYxNjEiIHN0cm9rZS13aWR0aD0iMC41Ii8+Cjwvc3ZnPgo=);
  --jp-icon-edit: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTMgMTcuMjVWMjFoMy43NUwxNy44MSA5Ljk0bC0zLjc1LTMuNzVMMyAxNy4yNXpNMjAuNzEgNy4wNGMuMzktLjM5LjM5LTEuMDIgMC0xLjQxbC0yLjM0LTIuMzRjLS4zOS0uMzktMS4wMi0uMzktMS40MSAwbC0xLjgzIDEuODMgMy43NSAzLjc1IDEuODMtMS44M3oiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-ellipses: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPGNpcmNsZSBjeD0iNSIgY3k9IjEyIiByPSIyIi8+CiAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIyIi8+CiAgICA8Y2lyY2xlIGN4PSIxOSIgY3k9IjEyIiByPSIyIi8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-extension: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTIwLjUgMTFIMTlWN2MwLTEuMS0uOS0yLTItMmgtNFYzLjVDMTMgMi4xMiAxMS44OCAxIDEwLjUgMVM4IDIuMTIgOCAzLjVWNUg0Yy0xLjEgMC0xLjk5LjktMS45OSAydjMuOEgzLjVjMS40OSAwIDIuNyAxLjIxIDIuNyAyLjdzLTEuMjEgMi43LTIuNyAyLjdIMlYyMGMwIDEuMS45IDIgMiAyaDMuOHYtMS41YzAtMS40OSAxLjIxLTIuNyAyLjctMi43IDEuNDkgMCAyLjcgMS4yMSAyLjcgMi43VjIySDE3YzEuMSAwIDItLjkgMi0ydi00aDEuNWMxLjM4IDAgMi41LTEuMTIgMi41LTIuNVMyMS44OCAxMSAyMC41IDExeiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-fast-forward: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CiAgICAgICAgPHBhdGggZD0iTTQgMThsOC41LTZMNCA2djEyem05LTEydjEybDguNS02TDEzIDZ6Ii8+CiAgICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-file-upload: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTkgMTZoNnYtNmg0bC03LTctNyA3aDR6bS00IDJoMTR2Mkg1eiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-file: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8cGF0aCBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIiBkPSJNMTkuMyA4LjJsLTUuNS01LjVjLS4zLS4zLS43LS41LTEuMi0uNUgzLjljLS44LjEtMS42LjktMS42IDEuOHYxNC4xYzAgLjkuNyAxLjYgMS42IDEuNmgxNC4yYy45IDAgMS42LS43IDEuNi0xLjZWOS40Yy4xLS41LS4xLS45LS40LTEuMnptLTUuOC0zLjNsMy40IDMuNmgtMy40VjQuOXptMy45IDEyLjdINC43Yy0uMSAwLS4yIDAtLjItLjJWNC43YzAtLjIuMS0uMy4yLS4zaDcuMnY0LjRzMCAuOC4zIDEuMWMuMy4zIDEuMS4zIDEuMS4zaDQuM3Y3LjJzLS4xLjItLjIuMnoiLz4KPC9zdmc+Cg==);
  --jp-icon-filter-list: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTEwIDE4aDR2LTJoLTR2MnpNMyA2djJoMThWNkgzem0zIDdoMTJ2LTJINnYyeiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-folder-favorite: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iMjRweCIgdmlld0JveD0iMCAwIDI0IDI0IiB3aWR0aD0iMjRweCIgZmlsbD0iIzAwMDAwMCI+CiAgPHBhdGggZD0iTTAgMGgyNHYyNEgwVjB6IiBmaWxsPSJub25lIi8+PHBhdGggY2xhc3M9ImpwLWljb24zIGpwLWljb24tc2VsZWN0YWJsZSIgZmlsbD0iIzYxNjE2MSIgZD0iTTIwIDZoLThsLTItMkg0Yy0xLjEgMC0yIC45LTIgMnYxMmMwIDEuMS45IDIgMiAyaDE2YzEuMSAwIDItLjkgMi0yVjhjMC0xLjEtLjktMi0yLTJ6bS0yLjA2IDExTDE1IDE1LjI4IDEyLjA2IDE3bC43OC0zLjMzLTIuNTktMi4yNCAzLjQxLS4yOUwxNSA4bDEuMzQgMy4xNCAzLjQxLjI5LTIuNTkgMi4yNC43OCAzLjMzeiIvPgo8L3N2Zz4K);
  --jp-icon-folder: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8cGF0aCBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIiBkPSJNMTAgNEg0Yy0xLjEgMC0xLjk5LjktMS45OSAyTDIgMThjMCAxLjEuOSAyIDIgMmgxNmMxLjEgMCAyLS45IDItMlY4YzAtMS4xLS45LTItMi0yaC04bC0yLTJ6Ii8+Cjwvc3ZnPgo=);
  --jp-icon-home: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iMjRweCIgdmlld0JveD0iMCAwIDI0IDI0IiB3aWR0aD0iMjRweCIgZmlsbD0iIzAwMDAwMCI+CiAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIgZmlsbD0ibm9uZSIvPjxwYXRoIGNsYXNzPSJqcC1pY29uMyBqcC1pY29uLXNlbGVjdGFibGUiIGZpbGw9IiM2MTYxNjEiIGQ9Ik0xMCAyMHYtNmg0djZoNXYtOGgzTDEyIDMgMiAxMmgzdjh6Ii8+Cjwvc3ZnPgo=);
  --jp-icon-html5: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDUxMiA1MTIiPgogIDxwYXRoIGNsYXNzPSJqcC1pY29uMCBqcC1pY29uLXNlbGVjdGFibGUiIGZpbGw9IiMwMDAiIGQ9Ik0xMDguNCAwaDIzdjIyLjhoMjEuMlYwaDIzdjY5aC0yM1Y0NmgtMjF2MjNoLTIzLjJNMjA2IDIzaC0yMC4zVjBoNjMuN3YyM0gyMjl2NDZoLTIzbTUzLjUtNjloMjQuMWwxNC44IDI0LjNMMzEzLjIgMGgyNC4xdjY5aC0yM1YzNC44bC0xNi4xIDI0LjgtMTYuMS0yNC44VjY5aC0yMi42bTg5LjItNjloMjN2NDYuMmgzMi42VjY5aC01NS42Ii8+CiAgPHBhdGggY2xhc3M9ImpwLWljb24tc2VsZWN0YWJsZSIgZmlsbD0iI2U0NGQyNiIgZD0iTTEwNy42IDQ3MWwtMzMtMzcwLjRoMzYyLjhsLTMzIDM3MC4yTDI1NS43IDUxMiIvPgogIDxwYXRoIGNsYXNzPSJqcC1pY29uLXNlbGVjdGFibGUiIGZpbGw9IiNmMTY1MjkiIGQ9Ik0yNTYgNDgwLjVWMTMxaDE0OC4zTDM3NiA0NDciLz4KICA8cGF0aCBjbGFzcz0ianAtaWNvbi1zZWxlY3RhYmxlLWludmVyc2UiIGZpbGw9IiNlYmViZWIiIGQ9Ik0xNDIgMTc2LjNoMTE0djQ1LjRoLTY0LjJsNC4yIDQ2LjVoNjB2NDUuM0gxNTQuNG0yIDIyLjhIMjAybDMuMiAzNi4zIDUwLjggMTMuNnY0Ny40bC05My4yLTI2Ii8+CiAgPHBhdGggY2xhc3M9ImpwLWljb24tc2VsZWN0YWJsZS1pbnZlcnNlIiBmaWxsPSIjZmZmIiBkPSJNMzY5LjYgMTc2LjNIMjU1Ljh2NDUuNGgxMDkuNm0tNC4xIDQ2LjVIMjU1Ljh2NDUuNGg1NmwtNS4zIDU5LTUwLjcgMTMuNnY0Ny4ybDkzLTI1LjgiLz4KPC9zdmc+Cg==);
  --jp-icon-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8cGF0aCBjbGFzcz0ianAtaWNvbi1icmFuZDQganAtaWNvbi1zZWxlY3RhYmxlLWludmVyc2UiIGZpbGw9IiNGRkYiIGQ9Ik0yLjIgMi4yaDE3LjV2MTcuNUgyLjJ6Ii8+CiAgPHBhdGggY2xhc3M9ImpwLWljb24tYnJhbmQwIGpwLWljb24tc2VsZWN0YWJsZSIgZmlsbD0iIzNGNTFCNSIgZD0iTTIuMiAyLjJ2MTcuNWgxNy41bC4xLTE3LjVIMi4yem0xMi4xIDIuMmMxLjIgMCAyLjIgMSAyLjIgMi4ycy0xIDIuMi0yLjIgMi4yLTIuMi0xLTIuMi0yLjIgMS0yLjIgMi4yLTIuMnpNNC40IDE3LjZsMy4zLTguOCAzLjMgNi42IDIuMi0zLjIgNC40IDUuNEg0LjR6Ii8+Cjwvc3ZnPgo=);
  --jp-icon-inspector: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8cGF0aCBjbGFzcz0ianAtaW5zcGVjdG9yLWljb24tY29sb3IganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIiBkPSJNMjAgNEg0Yy0xLjEgMC0xLjk5LjktMS45OSAyTDIgMThjMCAxLjEuOSAyIDIgMmgxNmMxLjEgMCAyLS45IDItMlY2YzAtMS4xLS45LTItMi0yem0tNSAxNEg0di00aDExdjR6bTAtNUg0VjloMTF2NHptNSA1aC00VjloNHY5eiIvPgo8L3N2Zz4K);
  --jp-icon-json: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8ZyBjbGFzcz0ianAtanNvbi1pY29uLWNvbG9yIGpwLWljb24tc2VsZWN0YWJsZSIgZmlsbD0iI0Y5QTgyNSI+CiAgICA8cGF0aCBkPSJNMjAuMiAxMS44Yy0xLjYgMC0xLjcuNS0xLjcgMSAwIC40LjEuOS4xIDEuMy4xLjUuMS45LjEgMS4zIDAgMS43LTEuNCAyLjMtMy41IDIuM2gtLjl2LTEuOWguNWMxLjEgMCAxLjQgMCAxLjQtLjggMC0uMyAwLS42LS4xLTEgMC0uNC0uMS0uOC0uMS0xLjIgMC0xLjMgMC0xLjggMS4zLTItMS4zLS4yLTEuMy0uNy0xLjMtMiAwLS40LjEtLjguMS0xLjIuMS0uNC4xLS43LjEtMSAwLS44LS40LS43LTEuNC0uOGgtLjVWNC4xaC45YzIuMiAwIDMuNS43IDMuNSAyLjMgMCAuNC0uMS45LS4xIDEuMy0uMS41LS4xLjktLjEgMS4zIDAgLjUuMiAxIDEuNyAxdjEuOHpNMS44IDEwLjFjMS42IDAgMS43LS41IDEuNy0xIDAtLjQtLjEtLjktLjEtMS4zLS4xLS41LS4xLS45LS4xLTEuMyAwLTEuNiAxLjQtMi4zIDMuNS0yLjNoLjl2MS45aC0uNWMtMSAwLTEuNCAwLTEuNC44IDAgLjMgMCAuNi4xIDEgMCAuMi4xLjYuMSAxIDAgMS4zIDAgMS44LTEuMyAyQzYgMTEuMiA2IDExLjcgNiAxM2MwIC40LS4xLjgtLjEgMS4yLS4xLjMtLjEuNy0uMSAxIDAgLjguMy44IDEuNC44aC41djEuOWgtLjljLTIuMSAwLTMuNS0uNi0zLjUtMi4zIDAtLjQuMS0uOS4xLTEuMy4xLS41LjEtLjkuMS0xLjMgMC0uNS0uMi0xLTEuNy0xdi0xLjl6Ii8+CiAgICA8Y2lyY2xlIGN4PSIxMSIgY3k9IjEzLjgiIHI9IjIuMSIvPgogICAgPGNpcmNsZSBjeD0iMTEiIGN5PSI4LjIiIHI9IjIuMSIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-julia: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDMyNSAzMDAiPgogIDxnIGNsYXNzPSJqcC1icmFuZDAganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjY2IzYzMzIj4KICAgIDxwYXRoIGQ9Ik0gMTUwLjg5ODQzOCAyMjUgQyAxNTAuODk4NDM4IDI2Ni40MjE4NzUgMTE3LjMyMDMxMiAzMDAgNzUuODk4NDM4IDMwMCBDIDM0LjQ3NjU2MiAzMDAgMC44OTg0MzggMjY2LjQyMTg3NSAwLjg5ODQzOCAyMjUgQyAwLjg5ODQzOCAxODMuNTc4MTI1IDM0LjQ3NjU2MiAxNTAgNzUuODk4NDM4IDE1MCBDIDExNy4zMjAzMTIgMTUwIDE1MC44OTg0MzggMTgzLjU3ODEyNSAxNTAuODk4NDM4IDIyNSIvPgogIDwvZz4KICA8ZyBjbGFzcz0ianAtYnJhbmQwIGpwLWljb24tc2VsZWN0YWJsZSIgZmlsbD0iIzM4OTgyNiI+CiAgICA8cGF0aCBkPSJNIDIzNy41IDc1IEMgMjM3LjUgMTE2LjQyMTg3NSAyMDMuOTIxODc1IDE1MCAxNjIuNSAxNTAgQyAxMjEuMDc4MTI1IDE1MCA4Ny41IDExNi40MjE4NzUgODcuNSA3NSBDIDg3LjUgMzMuNTc4MTI1IDEyMS4wNzgxMjUgMCAxNjIuNSAwIEMgMjAzLjkyMTg3NSAwIDIzNy41IDMzLjU3ODEyNSAyMzcuNSA3NSIvPgogIDwvZz4KICA8ZyBjbGFzcz0ianAtYnJhbmQwIGpwLWljb24tc2VsZWN0YWJsZSIgZmlsbD0iIzk1NThiMiI+CiAgICA8cGF0aCBkPSJNIDMyNC4xMDE1NjIgMjI1IEMgMzI0LjEwMTU2MiAyNjYuNDIxODc1IDI5MC41MjM0MzggMzAwIDI0OS4xMDE1NjIgMzAwIEMgMjA3LjY3OTY4OCAzMDAgMTc0LjEwMTU2MiAyNjYuNDIxODc1IDE3NC4xMDE1NjIgMjI1IEMgMTc0LjEwMTU2MiAxODMuNTc4MTI1IDIwNy42Nzk2ODggMTUwIDI0OS4xMDE1NjIgMTUwIEMgMjkwLjUyMzQzOCAxNTAgMzI0LjEwMTU2MiAxODMuNTc4MTI1IDMyNC4xMDE1NjIgMjI1Ii8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-jupyter-favicon: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTUyIiBoZWlnaHQ9IjE2NSIgdmlld0JveD0iMCAwIDE1MiAxNjUiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgPGcgY2xhc3M9ImpwLWp1cHl0ZXItaWNvbi1jb2xvciIgZmlsbD0iI0YzNzcyNiI+CiAgICA8cGF0aCB0cmFuc2Zvcm09InRyYW5zbGF0ZSgwLjA3ODk0NywgMTEwLjU4MjkyNykiIGQ9Ik03NS45NDIyODQyLDI5LjU4MDQ1NjEgQzQzLjMwMjM5NDcsMjkuNTgwNDU2MSAxNC43OTY3ODMyLDE3LjY1MzQ2MzQgMCwwIEM1LjUxMDgzMjExLDE1Ljg0MDY4MjkgMTUuNzgxNTM4OSwyOS41NjY3NzMyIDI5LjM5MDQ5NDcsMzkuMjc4NDE3MSBDNDIuOTk5Nyw0OC45ODk4NTM3IDU5LjI3MzcsNTQuMjA2NzgwNSA3NS45NjA1Nzg5LDU0LjIwNjc4MDUgQzkyLjY0NzQ1NzksNTQuMjA2NzgwNSAxMDguOTIxNDU4LDQ4Ljk4OTg1MzcgMTIyLjUzMDY2MywzOS4yNzg0MTcxIEMxMzYuMTM5NDUzLDI5LjU2Njc3MzIgMTQ2LjQxMDI4NCwxNS44NDA2ODI5IDE1MS45MjExNTgsMCBDMTM3LjA4Nzg2OCwxNy42NTM0NjM0IDEwOC41ODI1ODksMjkuNTgwNDU2MSA3NS45NDIyODQyLDI5LjU4MDQ1NjEgTDc1Ljk0MjI4NDIsMjkuNTgwNDU2MSBaIiAvPgogICAgPHBhdGggdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMC4wMzczNjgsIDAuNzA0ODc4KSIgZD0iTTc1Ljk3ODQ1NzksMjQuNjI2NDA3MyBDMTA4LjYxODc2MywyNC42MjY0MDczIDEzNy4xMjQ0NTgsMzYuNTUzNDQxNSAxNTEuOTIxMTU4LDU0LjIwNjc4MDUgQzE0Ni40MTAyODQsMzguMzY2MjIyIDEzNi4xMzk0NTMsMjQuNjQwMTMxNyAxMjIuNTMwNjYzLDE0LjkyODQ4NzggQzEwOC45MjE0NTgsNS4yMTY4NDM5IDkyLjY0NzQ1NzksMCA3NS45NjA1Nzg5LDAgQzU5LjI3MzcsMCA0Mi45OTk3LDUuMjE2ODQzOSAyOS4zOTA0OTQ3LDE0LjkyODQ4NzggQzE1Ljc4MTUzODksMjQuNjQwMTMxNyA1LjUxMDgzMjExLDM4LjM2NjIyMiAwLDU0LjIwNjc4MDUgQzE0LjgzMzA4MTYsMzYuNTg5OTI5MyA0My4zMzg1Njg0LDI0LjYyNjQwNzMgNzUuOTc4NDU3OSwyNC42MjY0MDczIEw3NS45Nzg0NTc5LDI0LjYyNjQwNzMgWiIgLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-jupyter: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzkiIGhlaWdodD0iNTEiIHZpZXdCb3g9IjAgMCAzOSA1MSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMTYzOCAtMjI4MSkiPgogICAgIDxnIGNsYXNzPSJqcC1qdXB5dGVyLWljb24tY29sb3IiIGZpbGw9IiNGMzc3MjYiPgogICAgICA8cGF0aCB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxNjM5Ljc0IDIzMTEuOTgpIiBkPSJNIDE4LjI2NDYgNy4xMzQxMUMgMTAuNDE0NSA3LjEzNDExIDMuNTU4NzIgNC4yNTc2IDAgMEMgMS4zMjUzOSAzLjgyMDQgMy43OTU1NiA3LjEzMDgxIDcuMDY4NiA5LjQ3MzAzQyAxMC4zNDE3IDExLjgxNTIgMTQuMjU1NyAxMy4wNzM0IDE4LjI2OSAxMy4wNzM0QyAyMi4yODIzIDEzLjA3MzQgMjYuMTk2MyAxMS44MTUyIDI5LjQ2OTQgOS40NzMwM0MgMzIuNzQyNCA3LjEzMDgxIDM1LjIxMjYgMy44MjA0IDM2LjUzOCAwQyAzMi45NzA1IDQuMjU3NiAyNi4xMTQ4IDcuMTM0MTEgMTguMjY0NiA3LjEzNDExWiIvPgogICAgICA8cGF0aCB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxNjM5LjczIDIyODUuNDgpIiBkPSJNIDE4LjI3MzMgNS45MzkzMUMgMjYuMTIzNSA1LjkzOTMxIDMyLjk3OTMgOC44MTU4MyAzNi41MzggMTMuMDczNEMgMzUuMjEyNiA5LjI1MzAzIDMyLjc0MjQgNS45NDI2MiAyOS40Njk0IDMuNjAwNEMgMjYuMTk2MyAxLjI1ODE4IDIyLjI4MjMgMCAxOC4yNjkgMEMgMTQuMjU1NyAwIDEwLjM0MTcgMS4yNTgxOCA3LjA2ODYgMy42MDA0QyAzLjc5NTU2IDUuOTQyNjIgMS4zMjUzOSA5LjI1MzAzIDAgMTMuMDczNEMgMy41Njc0NSA4LjgyNDYzIDEwLjQyMzIgNS45MzkzMSAxOC4yNzMzIDUuOTM5MzFaIi8+CiAgICA8L2c+CiAgICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgICA8cGF0aCB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxNjY5LjMgMjI4MS4zMSkiIGQ9Ik0gNS44OTM1MyAyLjg0NEMgNS45MTg4OSAzLjQzMTY1IDUuNzcwODUgNC4wMTM2NyA1LjQ2ODE1IDQuNTE2NDVDIDUuMTY1NDUgNS4wMTkyMiA0LjcyMTY4IDUuNDIwMTUgNC4xOTI5OSA1LjY2ODUxQyAzLjY2NDMgNS45MTY4OCAzLjA3NDQ0IDYuMDAxNTEgMi40OTgwNSA1LjkxMTcxQyAxLjkyMTY2IDUuODIxOSAxLjM4NDYzIDUuNTYxNyAwLjk1NDg5OCA1LjE2NDAxQyAwLjUyNTE3IDQuNzY2MzMgMC4yMjIwNTYgNC4yNDkwMyAwLjA4MzkwMzcgMy42Nzc1N0MgLTAuMDU0MjQ4MyAzLjEwNjExIC0wLjAyMTIzIDIuNTA2MTcgMC4xNzg3ODEgMS45NTM2NEMgMC4zNzg3OTMgMS40MDExIDAuNzM2ODA5IDAuOTIwODE3IDEuMjA3NTQgMC41NzM1MzhDIDEuNjc4MjYgMC4yMjYyNTkgMi4yNDA1NSAwLjAyNzU5MTkgMi44MjMyNiAwLjAwMjY3MjI5QyAzLjYwMzg5IC0wLjAzMDcxMTUgNC4zNjU3MyAwLjI0OTc4OSA0Ljk0MTQyIDAuNzgyNTUxQyA1LjUxNzExIDEuMzE1MzEgNS44NTk1NiAyLjA1Njc2IDUuODkzNTMgMi44NDRaIi8+CiAgICAgIDxwYXRoIHRyYW5zZm9ybT0idHJhbnNsYXRlKDE2MzkuOCAyMzIzLjgxKSIgZD0iTSA3LjQyNzg5IDMuNTgzMzhDIDcuNDYwMDggNC4zMjQzIDcuMjczNTUgNS4wNTgxOSA2Ljg5MTkzIDUuNjkyMTNDIDYuNTEwMzEgNi4zMjYwNyA1Ljk1MDc1IDYuODMxNTYgNS4yODQxMSA3LjE0NDZDIDQuNjE3NDcgNy40NTc2MyAzLjg3MzcxIDcuNTY0MTQgMy4xNDcwMiA3LjQ1MDYzQyAyLjQyMDMyIDcuMzM3MTIgMS43NDMzNiA3LjAwODcgMS4yMDE4NCA2LjUwNjk1QyAwLjY2MDMyOCA2LjAwNTIgMC4yNzg2MSA1LjM1MjY4IDAuMTA1MDE3IDQuNjMyMDJDIC0wLjA2ODU3NTcgMy45MTEzNSAtMC4wMjYyMzYxIDMuMTU0OTQgMC4yMjY2NzUgMi40NTg1NkMgMC40Nzk1ODcgMS43NjIxNyAwLjkzMTY5NyAxLjE1NzEzIDEuNTI1NzYgMC43MjAwMzNDIDIuMTE5ODMgMC4yODI5MzUgMi44MjkxNCAwLjAzMzQzOTUgMy41NjM4OSAwLjAwMzEzMzQ0QyA0LjU0NjY3IC0wLjAzNzQwMzMgNS41MDUyOSAwLjMxNjcwNiA2LjIyOTYxIDAuOTg3ODM1QyA2Ljk1MzkzIDEuNjU4OTYgNy4zODQ4NCAyLjU5MjM1IDcuNDI3ODkgMy41ODMzOEwgNy40Mjc4OSAzLjU4MzM4WiIvPgogICAgICA8cGF0aCB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxNjM4LjM2IDIyODYuMDYpIiBkPSJNIDIuMjc0NzEgNC4zOTYyOUMgMS44NDM2MyA0LjQxNTA4IDEuNDE2NzEgNC4zMDQ0NSAxLjA0Nzk5IDQuMDc4NDNDIDAuNjc5MjY4IDMuODUyNCAwLjM4NTMyOCAzLjUyMTE0IDAuMjAzMzcxIDMuMTI2NTZDIDAuMDIxNDEzNiAyLjczMTk4IC0wLjA0MDM3OTggMi4yOTE4MyAwLjAyNTgxMTYgMS44NjE4MUMgMC4wOTIwMDMxIDEuNDMxOCAwLjI4MzIwNCAxLjAzMTI2IDAuNTc1MjEzIDAuNzEwODgzQyAwLjg2NzIyMiAwLjM5MDUxIDEuMjQ2OTEgMC4xNjQ3MDggMS42NjYyMiAwLjA2MjA1OTJDIDIuMDg1NTMgLTAuMDQwNTg5NyAyLjUyNTYxIC0wLjAxNTQ3MTQgMi45MzA3NiAwLjEzNDIzNUMgMy4zMzU5MSAwLjI4Mzk0MSAzLjY4NzkyIDAuNTUxNTA1IDMuOTQyMjIgMC45MDMwNkMgNC4xOTY1MiAxLjI1NDYyIDQuMzQxNjkgMS42NzQzNiA0LjM1OTM1IDIuMTA5MTZDIDQuMzgyOTkgMi42OTEwNyA0LjE3Njc4IDMuMjU4NjkgMy43ODU5NyAzLjY4NzQ2QyAzLjM5NTE2IDQuMTE2MjQgMi44NTE2NiA0LjM3MTE2IDIuMjc0NzEgNC4zOTYyOUwgMi4yNzQ3MSA0LjM5NjI5WiIvPgogICAgPC9nPgogIDwvZz4+Cjwvc3ZnPgo=);
  --jp-icon-jupyterlab-wordmark: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMDAiIHZpZXdCb3g9IjAgMCAxODYwLjggNDc1Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjIiIGZpbGw9IiM0RTRFNEUiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDQ4MC4xMzY0MDEsIDY0LjI3MTQ5MykiPgogICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMC4wMDAwMDAsIDU4Ljg3NTU2NikiPgogICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgwLjA4NzYwMywgMC4xNDAyOTQpIj4KICAgICAgICA8cGF0aCBkPSJNLTQyNi45LDE2OS44YzAsNDguNy0zLjcsNjQuNy0xMy42LDc2LjRjLTEwLjgsMTAtMjUsMTUuNS0zOS43LDE1LjVsMy43LDI5IGMyMi44LDAuMyw0NC44LTcuOSw2MS45LTIzLjFjMTcuOC0xOC41LDI0LTQ0LjEsMjQtODMuM1YwSC00Mjd2MTcwLjFMLTQyNi45LDE2OS44TC00MjYuOSwxNjkuOHoiLz4KICAgICAgPC9nPgogICAgPC9nPgogICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMTU1LjA0NTI5NiwgNTYuODM3MTA0KSI+CiAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDEuNTYyNDUzLCAxLjc5OTg0MikiPgogICAgICAgIDxwYXRoIGQ9Ik0tMzEyLDE0OGMwLDIxLDAsMzkuNSwxLjcsNTUuNGgtMzEuOGwtMi4xLTMzLjNoLTAuOGMtNi43LDExLjYtMTYuNCwyMS4zLTI4LDI3LjkgYy0xMS42LDYuNi0yNC44LDEwLTM4LjIsOS44Yy0zMS40LDAtNjktMTcuNy02OS04OVYwaDM2LjR2MTEyLjdjMCwzOC43LDExLjYsNjQuNyw0NC42LDY0LjdjMTAuMy0wLjIsMjAuNC0zLjUsMjguOS05LjQgYzguNS01LjksMTUuMS0xNC4zLDE4LjktMjMuOWMyLjItNi4xLDMuMy0xMi41LDMuMy0xOC45VjAuMmgzNi40VjE0OEgtMzEyTC0zMTIsMTQ4eiIvPgogICAgICA8L2c+CiAgICA8L2c+CiAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzOTAuMDEzMzIyLCA1My40Nzk2MzgpIj4KICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMS43MDY0NTgsIDAuMjMxNDI1KSI+CiAgICAgICAgPHBhdGggZD0iTS00NzguNiw3MS40YzAtMjYtMC44LTQ3LTEuNy02Ni43aDMyLjdsMS43LDM0LjhoMC44YzcuMS0xMi41LDE3LjUtMjIuOCwzMC4xLTI5LjcgYzEyLjUtNywyNi43LTEwLjMsNDEtOS44YzQ4LjMsMCw4NC43LDQxLjcsODQuNywxMDMuM2MwLDczLjEtNDMuNywxMDkuMi05MSwxMDkuMmMtMTIuMSwwLjUtMjQuMi0yLjItMzUtNy44IGMtMTAuOC01LjYtMTkuOS0xMy45LTI2LjYtMjQuMmgtMC44VjI5MWgtMzZ2LTIyMEwtNDc4LjYsNzEuNEwtNDc4LjYsNzEuNHogTS00NDIuNiwxMjUuNmMwLjEsNS4xLDAuNiwxMC4xLDEuNywxNS4xIGMzLDEyLjMsOS45LDIzLjMsMTkuOCwzMS4xYzkuOSw3LjgsMjIuMSwxMi4xLDM0LjcsMTIuMWMzOC41LDAsNjAuNy0zMS45LDYwLjctNzguNWMwLTQwLjctMjEuMS03NS42LTU5LjUtNzUuNiBjLTEyLjksMC40LTI1LjMsNS4xLTM1LjMsMTMuNGMtOS45LDguMy0xNi45LDE5LjctMTkuNiwzMi40Yy0xLjUsNC45LTIuMywxMC0yLjUsMTUuMVYxMjUuNkwtNDQyLjYsMTI1LjZMLTQ0Mi42LDEyNS42eiIvPgogICAgICA8L2c+CiAgICA8L2c+CiAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSg2MDYuNzQwNzI2LCA1Ni44MzcxMDQpIj4KICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMC43NTEyMjYsIDEuOTg5Mjk5KSI+CiAgICAgICAgPHBhdGggZD0iTS00NDAuOCwwbDQzLjcsMTIwLjFjNC41LDEzLjQsOS41LDI5LjQsMTIuOCw0MS43aDAuOGMzLjctMTIuMiw3LjktMjcuNywxMi44LTQyLjQgbDM5LjctMTE5LjJoMzguNUwtMzQ2LjksMTQ1Yy0yNiw2OS43LTQzLjcsMTA1LjQtNjguNiwxMjcuMmMtMTIuNSwxMS43LTI3LjksMjAtNDQuNiwyMy45bC05LjEtMzEuMSBjMTEuNy0zLjksMjIuNS0xMC4xLDMxLjgtMTguMWMxMy4yLTExLjEsMjMuNy0yNS4yLDMwLjYtNDEuMmMxLjUtMi44LDIuNS01LjcsMi45LTguOGMtMC4zLTMuMy0xLjItNi42LTIuNS05LjdMLTQ4MC4yLDAuMSBoMzkuN0wtNDQwLjgsMEwtNDQwLjgsMHoiLz4KICAgICAgPC9nPgogICAgPC9nPgogICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoODIyLjc0ODEwNCwgMC4wMDAwMDApIj4KICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMS40NjQwNTAsIDAuMzc4OTE0KSI+CiAgICAgICAgPHBhdGggZD0iTS00MTMuNywwdjU4LjNoNTJ2MjguMmgtNTJWMTk2YzAsMjUsNywzOS41LDI3LjMsMzkuNWM3LjEsMC4xLDE0LjItMC43LDIxLjEtMi41IGwxLjcsMjcuN2MtMTAuMywzLjctMjEuMyw1LjQtMzIuMiw1Yy03LjMsMC40LTE0LjYtMC43LTIxLjMtMy40Yy02LjgtMi43LTEyLjktNi44LTE3LjktMTIuMWMtMTAuMy0xMC45LTE0LjEtMjktMTQuMS01Mi45IFY4Ni41aC0zMVY1OC4zaDMxVjkuNkwtNDEzLjcsMEwtNDEzLjcsMHoiLz4KICAgICAgPC9nPgogICAgPC9nPgogICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoOTc0LjQzMzI4NiwgNTMuNDc5NjM4KSI+CiAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDAuOTkwMDM0LCAwLjYxMDMzOSkiPgogICAgICAgIDxwYXRoIGQ9Ik0tNDQ1LjgsMTEzYzAuOCw1MCwzMi4yLDcwLjYsNjguNiw3MC42YzE5LDAuNiwzNy45LTMsNTUuMy0xMC41bDYuMiwyNi40IGMtMjAuOSw4LjktNDMuNSwxMy4xLTY2LjIsMTIuNmMtNjEuNSwwLTk4LjMtNDEuMi05OC4zLTEwMi41Qy00ODAuMiw0OC4yLTQ0NC43LDAtMzg2LjUsMGM2NS4yLDAsODIuNyw1OC4zLDgyLjcsOTUuNyBjLTAuMSw1LjgtMC41LDExLjUtMS4yLDE3LjJoLTE0MC42SC00NDUuOEwtNDQ1LjgsMTEzeiBNLTMzOS4yLDg2LjZjMC40LTIzLjUtOS41LTYwLjEtNTAuNC02MC4xIGMtMzYuOCwwLTUyLjgsMzQuNC01NS43LDYwLjFILTMzOS4yTC0zMzkuMiw4Ni42TC0zMzkuMiw4Ni42eiIvPgogICAgICA8L2c+CiAgICA8L2c+CiAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxMjAxLjk2MTA1OCwgNTMuNDc5NjM4KSI+CiAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDEuMTc5NjQwLCAwLjcwNTA2OCkiPgogICAgICAgIDxwYXRoIGQ9Ik0tNDc4LjYsNjhjMC0yMy45LTAuNC00NC41LTEuNy02My40aDMxLjhsMS4yLDM5LjloMS43YzkuMS0yNy4zLDMxLTQ0LjUsNTUuMy00NC41IGMzLjUtMC4xLDcsMC40LDEwLjMsMS4ydjM0LjhjLTQuMS0wLjktOC4yLTEuMy0xMi40LTEuMmMtMjUuNiwwLTQzLjcsMTkuNy00OC43LDQ3LjRjLTEsNS43LTEuNiwxMS41LTEuNywxNy4ydjEwOC4zaC0zNlY2OCBMLTQ3OC42LDY4eiIvPgogICAgICA8L2c+CiAgICA8L2c+CiAgPC9nPgoKICA8ZyBjbGFzcz0ianAtaWNvbi13YXJuMCIgZmlsbD0iI0YzNzcyNiI+CiAgICA8cGF0aCBkPSJNMTM1Mi4zLDMyNi4yaDM3VjI4aC0zN1YzMjYuMnogTTE2MDQuOCwzMjYuMmMtMi41LTEzLjktMy40LTMxLjEtMy40LTQ4Ljd2LTc2IGMwLTQwLjctMTUuMS04My4xLTc3LjMtODMuMWMtMjUuNiwwLTUwLDcuMS02Ni44LDE4LjFsOC40LDI0LjRjMTQuMy05LjIsMzQtMTUuMSw1My0xNS4xYzQxLjYsMCw0Ni4yLDMwLjIsNDYuMiw0N3Y0LjIgYy03OC42LTAuNC0xMjIuMywyNi41LTEyMi4zLDc1LjZjMCwyOS40LDIxLDU4LjQsNjIuMiw1OC40YzI5LDAsNTAuOS0xNC4zLDYyLjItMzAuMmgxLjNsMi45LDI1LjZIMTYwNC44eiBNMTU2NS43LDI1Ny43IGMwLDMuOC0wLjgsOC0yLjEsMTEuOGMtNS45LDE3LjItMjIuNywzNC00OS4yLDM0Yy0xOC45LDAtMzQuOS0xMS4zLTM0LjktMzUuM2MwLTM5LjUsNDUuOC00Ni42LDg2LjItNDUuOFYyNTcuN3ogTTE2OTguNSwzMjYuMiBsMS43LTMzLjZoMS4zYzE1LjEsMjYuOSwzOC43LDM4LjIsNjguMSwzOC4yYzQ1LjQsMCw5MS4yLTM2LjEsOTEuMi0xMDguOGMwLjQtNjEuNy0zNS4zLTEwMy43LTg1LjctMTAzLjcgYy0zMi44LDAtNTYuMywxNC43LTY5LjMsMzcuNGgtMC44VjI4aC0zNi42djI0NS43YzAsMTguMS0wLjgsMzguNi0xLjcsNTIuNUgxNjk4LjV6IE0xNzA0LjgsMjA4LjJjMC01LjksMS4zLTEwLjksMi4xLTE1LjEgYzcuNi0yOC4xLDMxLjEtNDUuNCw1Ni4zLTQ1LjRjMzkuNSwwLDYwLjUsMzQuOSw2MC41LDc1LjZjMCw0Ni42LTIzLjEsNzguMS02MS44LDc4LjFjLTI2LjksMC00OC4zLTE3LjYtNTUuNS00My4zIGMtMC44LTQuMi0xLjctOC44LTEuNy0xMy40VjIwOC4yeiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-kernel: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGNsYXNzPSJqcC1pY29uMiIgZmlsbD0iIzYxNjE2MSIgZD0iTTE1IDlIOXY2aDZWOXptLTIgNGgtMnYtMmgydjJ6bTgtMlY5aC0yVjdjMC0xLjEtLjktMi0yLTJoLTJWM2gtMnYyaC0yVjNIOXYySDdjLTEuMSAwLTIgLjktMiAydjJIM3YyaDJ2MkgzdjJoMnYyYzAgMS4xLjkgMiAyIDJoMnYyaDJ2LTJoMnYyaDJ2LTJoMmMxLjEgMCAyLS45IDItMnYtMmgydi0yaC0ydi0yaDJ6bS00IDZIN1Y3aDEwdjEweiIvPgo8L3N2Zz4K);
  --jp-icon-keyboard: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8cGF0aCBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIiBkPSJNMjAgNUg0Yy0xLjEgMC0xLjk5LjktMS45OSAyTDIgMTdjMCAxLjEuOSAyIDIgMmgxNmMxLjEgMCAyLS45IDItMlY3YzAtMS4xLS45LTItMi0yem0tOSAzaDJ2MmgtMlY4em0wIDNoMnYyaC0ydi0yek04IDhoMnYySDhWOHptMCAzaDJ2Mkg4di0yem0tMSAySDV2LTJoMnYyem0wLTNINVY4aDJ2MnptOSA3SDh2LTJoOHYyem0wLTRoLTJ2LTJoMnYyem0wLTNoLTJWOGgydjJ6bTMgM2gtMnYtMmgydjJ6bTAtM2gtMlY4aDJ2MnoiLz4KPC9zdmc+Cg==);
  --jp-icon-launch: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMzIgMzIiIHdpZHRoPSIzMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIj4KICAgIDxwYXRoIGQ9Ik0yNiwyOEg2YTIuMDAyNywyLjAwMjcsMCwwLDEtMi0yVjZBMi4wMDI3LDIuMDAyNywwLDAsMSw2LDRIMTZWNkg2VjI2SDI2VjE2aDJWMjZBMi4wMDI3LDIuMDAyNywwLDAsMSwyNiwyOFoiLz4KICAgIDxwb2x5Z29uIHBvaW50cz0iMjAgMiAyMCA0IDI2LjU4NiA0IDE4IDEyLjU4NiAxOS40MTQgMTQgMjggNS40MTQgMjggMTIgMzAgMTIgMzAgMiAyMCAyIi8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-launcher: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8cGF0aCBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIiBkPSJNMTkgMTlINVY1aDdWM0g1YTIgMiAwIDAwLTIgMnYxNGEyIDIgMCAwMDIgMmgxNGMxLjEgMCAyLS45IDItMnYtN2gtMnY3ek0xNCAzdjJoMy41OWwtOS44MyA5LjgzIDEuNDEgMS40MUwxOSA2LjQxVjEwaDJWM2gtN3oiLz4KPC9zdmc+Cg==);
  --jp-icon-line-form: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IndoaXRlIiBkPSJNNS44OCA0LjEyTDEzLjc2IDEybC03Ljg4IDcuODhMOCAyMmwxMC0xMEw4IDJ6Ii8+Cjwvc3ZnPgo=);
  --jp-icon-link: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTMuOSAxMmMwLTEuNzEgMS4zOS0zLjEgMy4xLTMuMWg0VjdIN2MtMi43NiAwLTUgMi4yNC01IDVzMi4yNCA1IDUgNWg0di0xLjlIN2MtMS43MSAwLTMuMS0xLjM5LTMuMS0zLjF6TTggMTNoOHYtMkg4djJ6bTktNmgtNHYxLjloNGMxLjcxIDAgMy4xIDEuMzkgMy4xIDMuMXMtMS4zOSAzLjEtMy4xIDMuMWgtNFYxN2g0YzIuNzYgMCA1LTIuMjQgNS01cy0yLjI0LTUtNS01eiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-list: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGNsYXNzPSJqcC1pY29uMiBqcC1pY29uLXNlbGVjdGFibGUiIGZpbGw9IiM2MTYxNjEiIGQ9Ik0xOSA1djE0SDVWNWgxNG0xLjEtMkgzLjljLS41IDAtLjkuNC0uOS45djE2LjJjMCAuNC40LjkuOS45aDE2LjJjLjQgMCAuOS0uNS45LS45VjMuOWMwLS41LS41LS45LS45LS45ek0xMSA3aDZ2MmgtNlY3em0wIDRoNnYyaC02di0yem0wIDRoNnYyaC02ek03IDdoMnYySDd6bTAgNGgydjJIN3ptMCA0aDJ2Mkg3eiIvPgo8L3N2Zz4=);
  --jp-icon-listings-info: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA1MC45NzggNTAuOTc4IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCA1MC45NzggNTAuOTc4OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+Cgk8Zz4KCQk8cGF0aCBzdHlsZT0iZmlsbDojMDEwMDAyOyIgZD0iTTQzLjUyLDcuNDU4QzM4LjcxMSwyLjY0OCwzMi4zMDcsMCwyNS40ODksMEMxOC42NywwLDEyLjI2NiwyLjY0OCw3LjQ1OCw3LjQ1OAoJCQljLTkuOTQzLDkuOTQxLTkuOTQzLDI2LjExOSwwLDM2LjA2MmM0LjgwOSw0LjgwOSwxMS4yMTIsNy40NTYsMTguMDMxLDcuNDU4YzAsMCwwLjAwMSwwLDAuMDAyLDAKCQkJYzYuODE2LDAsMTMuMjIxLTIuNjQ4LDE4LjAyOS03LjQ1OGM0LjgwOS00LjgwOSw3LjQ1Ny0xMS4yMTIsNy40NTctMTguMDNDNTAuOTc3LDE4LjY3LDQ4LjMyOCwxMi4yNjYsNDMuNTIsNy40NTh6CgkJCSBNNDIuMTA2LDQyLjEwNWMtNC40MzIsNC40MzEtMTAuMzMyLDYuODcyLTE2LjYxNSw2Ljg3MmgtMC4wMDJjLTYuMjg1LTAuMDAxLTEyLjE4Ny0yLjQ0MS0xNi42MTctNi44NzIKCQkJYy05LjE2Mi05LjE2My05LjE2Mi0yNC4wNzEsMC0zMy4yMzNDMTMuMzAzLDQuNDQsMTkuMjA0LDIsMjUuNDg5LDJjNi4yODQsMCwxMi4xODYsMi40NCwxNi42MTcsNi44NzIKCQkJYzQuNDMxLDQuNDMxLDYuODcxLDEwLjMzMiw2Ljg3MSwxNi42MTdDNDguOTc3LDMxLjc3Miw0Ni41MzYsMzcuNjc1LDQyLjEwNiw0Mi4xMDV6Ii8+CgkJPHBhdGggc3R5bGU9ImZpbGw6IzAxMDAwMjsiIGQ9Ik0yMy41NzgsMzIuMjE4Yy0wLjAyMy0xLjczNCwwLjE0My0zLjA1OSwwLjQ5Ni0zLjk3MmMwLjM1My0wLjkxMywxLjExLTEuOTk3LDIuMjcyLTMuMjUzCgkJCWMwLjQ2OC0wLjUzNiwwLjkyMy0xLjA2MiwxLjM2Ny0xLjU3NWMwLjYyNi0wLjc1MywxLjEwNC0xLjQ3OCwxLjQzNi0yLjE3NWMwLjMzMS0wLjcwNywwLjQ5NS0xLjU0MSwwLjQ5NS0yLjUKCQkJYzAtMS4wOTYtMC4yNi0yLjA4OC0wLjc3OS0yLjk3OWMtMC41NjUtMC44NzktMS41MDEtMS4zMzYtMi44MDYtMS4zNjljLTEuODAyLDAuMDU3LTIuOTg1LDAuNjY3LTMuNTUsMS44MzIKCQkJYy0wLjMwMSwwLjUzNS0wLjUwMywxLjE0MS0wLjYwNywxLjgxNGMtMC4xMzksMC43MDctMC4yMDcsMS40MzItMC4yMDcsMi4xNzRoLTIuOTM3Yy0wLjA5MS0yLjIwOCwwLjQwNy00LjExNCwxLjQ5My01LjcxOQoJCQljMS4wNjItMS42NCwyLjg1NS0yLjQ4MSw1LjM3OC0yLjUyN2MyLjE2LDAuMDIzLDMuODc0LDAuNjA4LDUuMTQxLDEuNzU4YzEuMjc4LDEuMTYsMS45MjksMi43NjQsMS45NSw0LjgxMQoJCQljMCwxLjE0Mi0wLjEzNywyLjExMS0wLjQxLDIuOTExYy0wLjMwOSwwLjg0NS0wLjczMSwxLjU5My0xLjI2OCwyLjI0M2MtMC40OTIsMC42NS0xLjA2OCwxLjMxOC0xLjczLDIuMDAyCgkJCWMtMC42NSwwLjY5Ny0xLjMxMywxLjQ3OS0xLjk4NywyLjM0NmMtMC4yMzksMC4zNzctMC40MjksMC43NzctMC41NjUsMS4xOTljLTAuMTYsMC45NTktMC4yMTcsMS45NTEtMC4xNzEsMi45NzkKCQkJQzI2LjU4OSwzMi4yMTgsMjMuNTc4LDMyLjIxOCwyMy41NzgsMzIuMjE4eiBNMjMuNTc4LDM4LjIydi0zLjQ4NGgzLjA3NnYzLjQ4NEgyMy41Nzh6Ii8+Cgk8L2c+Cjwvc3ZnPgo=);
  --jp-icon-markdown: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8cGF0aCBjbGFzcz0ianAtaWNvbi1jb250cmFzdDAganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjN0IxRkEyIiBkPSJNNSAxNC45aDEybC02LjEgNnptOS40LTYuOGMwLTEuMy0uMS0yLjktLjEtNC41LS40IDEuNC0uOSAyLjktMS4zIDQuM2wtMS4zIDQuM2gtMkw4LjUgNy45Yy0uNC0xLjMtLjctMi45LTEtNC4zLS4xIDEuNi0uMSAzLjItLjIgNC42TDcgMTIuNEg0LjhsLjctMTFoMy4zTDEwIDVjLjQgMS4yLjcgMi43IDEgMy45LjMtMS4yLjctMi42IDEtMy45bDEuMi0zLjdoMy4zbC42IDExaC0yLjRsLS4zLTQuMnoiLz4KPC9zdmc+Cg==);
  --jp-icon-move-down: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggY2xhc3M9ImpwLWljb24zIiBkPSJNMTIuNDcxIDcuNTI4OTlDMTIuNzYzMiA3LjIzNjg0IDEyLjc2MzIgNi43NjMxNiAxMi40NzEgNi40NzEwMVY2LjQ3MTAxQzEyLjE3OSA2LjE3OTA1IDExLjcwNTcgNi4xNzg4NCAxMS40MTM1IDYuNDcwNTRMNy43NSAxMC4xMjc1VjEuNzVDNy43NSAxLjMzNTc5IDcuNDE0MjEgMSA3IDFWMUM2LjU4NTc5IDEgNi4yNSAxLjMzNTc5IDYuMjUgMS43NVYxMC4xMjc1TDIuNTk3MjYgNi40NjgyMkMyLjMwMzM4IDYuMTczODEgMS44MjY0MSA2LjE3MzU5IDEuNTMyMjYgNi40Njc3NFY2LjQ2Nzc0QzEuMjM4MyA2Ljc2MTcgMS4yMzgzIDcuMjM4MyAxLjUzMjI2IDcuNTMyMjZMNi4yOTI4OSAxMi4yOTI5QzYuNjgzNDIgMTIuNjgzNCA3LjMxNjU4IDEyLjY4MzQgNy43MDcxMSAxMi4yOTI5TDEyLjQ3MSA3LjUyODk5WiIgZmlsbD0iIzYxNjE2MSIvPgo8L3N2Zz4K);
  --jp-icon-move-up: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggY2xhc3M9ImpwLWljb24zIiBkPSJNMS41Mjg5OSA2LjQ3MTAxQzEuMjM2ODQgNi43NjMxNiAxLjIzNjg0IDcuMjM2ODQgMS41Mjg5OSA3LjUyODk5VjcuNTI4OTlDMS44MjA5NSA3LjgyMDk1IDIuMjk0MjYgNy44MjExNiAyLjU4NjQ5IDcuNTI5NDZMNi4yNSAzLjg3MjVWMTIuMjVDNi4yNSAxMi42NjQyIDYuNTg1NzkgMTMgNyAxM1YxM0M3LjQxNDIxIDEzIDcuNzUgMTIuNjY0MiA3Ljc1IDEyLjI1VjMuODcyNUwxMS40MDI3IDcuNTMxNzhDMTEuNjk2NiA3LjgyNjE5IDEyLjE3MzYgNy44MjY0MSAxMi40Njc3IDcuNTMyMjZWNy41MzIyNkMxMi43NjE3IDcuMjM4MyAxMi43NjE3IDYuNzYxNyAxMi40Njc3IDYuNDY3NzRMNy43MDcxMSAxLjcwNzExQzcuMzE2NTggMS4zMTY1OCA2LjY4MzQyIDEuMzE2NTggNi4yOTI4OSAxLjcwNzExTDEuNTI4OTkgNi40NzEwMVoiIGZpbGw9IiM2MTYxNjEiLz4KPC9zdmc+Cg==);
  --jp-icon-new-folder: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTIwIDZoLThsLTItMkg0Yy0xLjExIDAtMS45OS44OS0xLjk5IDJMMiAxOGMwIDEuMTEuODkgMiAyIDJoMTZjMS4xMSAwIDItLjg5IDItMlY4YzAtMS4xMS0uODktMi0yLTJ6bS0xIDhoLTN2M2gtMnYtM2gtM3YtMmgzVjloMnYzaDN2MnoiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-not-trusted: url(data:image/svg+xml;base64,PHN2ZyBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI1IDI1Ij4KICAgIDxwYXRoIGNsYXNzPSJqcC1pY29uMiIgc3Ryb2tlPSIjMzMzMzMzIiBzdHJva2Utd2lkdGg9IjIiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMgMykiIGQ9Ik0xLjg2MDk0IDExLjQ0MDlDMC44MjY0NDggOC43NzAyNyAwLjg2Mzc3OSA2LjA1NzY0IDEuMjQ5MDcgNC4xOTkzMkMyLjQ4MjA2IDMuOTMzNDcgNC4wODA2OCAzLjQwMzQ3IDUuNjAxMDIgMi44NDQ5QzcuMjM1NDkgMi4yNDQ0IDguODU2NjYgMS41ODE1IDkuOTg3NiAxLjA5NTM5QzExLjA1OTcgMS41ODM0MSAxMi42MDk0IDIuMjQ0NCAxNC4yMTggMi44NDMzOUMxNS43NTAzIDMuNDEzOTQgMTcuMzk5NSAzLjk1MjU4IDE4Ljc1MzkgNC4yMTM4NUMxOS4xMzY0IDYuMDcxNzcgMTkuMTcwOSA4Ljc3NzIyIDE4LjEzOSAxMS40NDA5QzE3LjAzMDMgMTQuMzAzMiAxNC42NjY4IDE3LjE4NDQgOS45OTk5OSAxOC45MzU0QzUuMzMzMTkgMTcuMTg0NCAyLjk2OTY4IDE0LjMwMzIgMS44NjA5NCAxMS40NDA5WiIvPgogICAgPHBhdGggY2xhc3M9ImpwLWljb24yIiBzdHJva2U9IiMzMzMzMzMiIHN0cm9rZS13aWR0aD0iMiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoOS4zMTU5MiA5LjMyMDMxKSIgZD0iTTcuMzY4NDIgMEwwIDcuMzY0NzkiLz4KICAgIDxwYXRoIGNsYXNzPSJqcC1pY29uMiIgc3Ryb2tlPSIjMzMzMzMzIiBzdHJva2Utd2lkdGg9IjIiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDkuMzE1OTIgMTYuNjgzNikgc2NhbGUoMSAtMSkiIGQ9Ik03LjM2ODQyIDBMMCA3LjM2NDc5Ii8+Cjwvc3ZnPgo=);
  --jp-icon-notebook: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8ZyBjbGFzcz0ianAtbm90ZWJvb2staWNvbi1jb2xvciBqcC1pY29uLXNlbGVjdGFibGUiIGZpbGw9IiNFRjZDMDAiPgogICAgPHBhdGggZD0iTTE4LjcgMy4zdjE1LjRIMy4zVjMuM2gxNS40bTEuNS0xLjVIMS44djE4LjNoMTguM2wuMS0xOC4zeiIvPgogICAgPHBhdGggZD0iTTE2LjUgMTYuNWwtNS40LTQuMy01LjYgNC4zdi0xMWgxMXoiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-numbering: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjIiIGhlaWdodD0iMjIiIHZpZXdCb3g9IjAgMCAyOCAyOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KCTxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CgkJPHBhdGggZD0iTTQgMTlINlYxOS41SDVWMjAuNUg2VjIxSDRWMjJIN1YxOEg0VjE5Wk01IDEwSDZWNkg0VjdINVYxMFpNNCAxM0g1LjhMNCAxNS4xVjE2SDdWMTVINS4yTDcgMTIuOVYxMkg0VjEzWk05IDdWOUgyM1Y3SDlaTTkgMjFIMjNWMTlIOVYyMVpNOSAxNUgyM1YxM0g5VjE1WiIvPgoJPC9nPgo8L3N2Zz4K);
  --jp-icon-offline-bolt: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCIgd2lkdGg9IjE2Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTEyIDIuMDJjLTUuNTEgMC05Ljk4IDQuNDctOS45OCA5Ljk4czQuNDcgOS45OCA5Ljk4IDkuOTggOS45OC00LjQ3IDkuOTgtOS45OFMxNy41MSAyLjAyIDEyIDIuMDJ6TTExLjQ4IDIwdi02LjI2SDhMMTMgNHY2LjI2aDMuMzVMMTEuNDggMjB6Ii8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-palette: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTE4IDEzVjIwSDRWNkg5LjAyQzkuMDcgNS4yOSA5LjI0IDQuNjIgOS41IDRINEMyLjkgNCAyIDQuOSAyIDZWMjBDMiAyMS4xIDIuOSAyMiA0IDIySDE4QzE5LjEgMjIgMjAgMjEuMSAyMCAyMFYxNUwxOCAxM1pNMTkuMyA4Ljg5QzE5Ljc0IDguMTkgMjAgNy4zOCAyMCA2LjVDMjAgNC4wMSAxNy45OSAyIDE1LjUgMkMxMy4wMSAyIDExIDQuMDEgMTEgNi41QzExIDguOTkgMTMuMDEgMTEgMTUuNDkgMTFDMTYuMzcgMTEgMTcuMTkgMTAuNzQgMTcuODggMTAuM0wyMSAxMy40MkwyMi40MiAxMkwxOS4zIDguODlaTTE1LjUgOUMxNC4xMiA5IDEzIDcuODggMTMgNi41QzEzIDUuMTIgMTQuMTIgNCAxNS41IDRDMTYuODggNCAxOCA1LjEyIDE4IDYuNUMxOCA3Ljg4IDE2Ljg4IDkgMTUuNSA5WiIvPgogICAgPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik00IDZIOS4wMTg5NEM5LjAwNjM5IDYuMTY1MDIgOSA2LjMzMTc2IDkgNi41QzkgOC44MTU3NyAxMC4yMTEgMTAuODQ4NyAxMi4wMzQzIDEySDlWMTRIMTZWMTIuOTgxMUMxNi41NzAzIDEyLjkzNzcgMTcuMTIgMTIuODIwNyAxNy42Mzk2IDEyLjYzOTZMMTggMTNWMjBINFY2Wk04IDhINlYxMEg4VjhaTTYgMTJIOFYxNEg2VjEyWk04IDE2SDZWMThIOFYxNlpNOSAxNkgxNlYxOEg5VjE2WiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-paste: url(data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CiAgICAgICAgPHBhdGggZD0iTTE5IDJoLTQuMThDMTQuNC44NCAxMy4zIDAgMTIgMGMtMS4zIDAtMi40Ljg0LTIuODIgMkg1Yy0xLjEgMC0yIC45LTIgMnYxNmMwIDEuMS45IDIgMiAyaDE0YzEuMSAwIDItLjkgMi0yVjRjMC0xLjEtLjktMi0yLTJ6bS03IDBjLjU1IDAgMSAuNDUgMSAxcy0uNDUgMS0xIDEtMS0uNDUtMS0xIC40NS0xIDEtMXptNyAxOEg1VjRoMnYzaDEwVjRoMnYxNnoiLz4KICAgIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-pdf: url(data:image/svg+xml;base64,PHN2ZwogICB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyMiAyMiIgd2lkdGg9IjE2Ij4KICAgIDxwYXRoIHRyYW5zZm9ybT0icm90YXRlKDQ1KSIgY2xhc3M9ImpwLWljb24tc2VsZWN0YWJsZSIgZmlsbD0iI0ZGMkEyQSIKICAgICAgIGQ9Im0gMjIuMzQ0MzY5LC0zLjAxNjM2NDIgaCA1LjYzODYwNCB2IDEuNTc5MjQzMyBoIC0zLjU0OTIyNyB2IDEuNTA4NjkyOTkgaCAzLjMzNzU3NiBWIDEuNjUwODE1NCBoIC0zLjMzNzU3NiB2IDMuNDM1MjYxMyBoIC0yLjA4OTM3NyB6IG0gLTcuMTM2NDQ0LDEuNTc5MjQzMyB2IDQuOTQzOTU0MyBoIDAuNzQ4OTIgcSAxLjI4MDc2MSwwIDEuOTUzNzAzLC0wLjYzNDk1MzUgMC42NzgzNjksLTAuNjM0OTUzNSAwLjY3ODM2OSwtMS44NDUxNjQxIDAsLTEuMjA0NzgzNTUgLTAuNjcyOTQyLC0xLjgzNDMxMDExIC0wLjY3Mjk0MiwtMC42Mjk1MjY1OSAtMS45NTkxMywtMC42Mjk1MjY1OSB6IG0gLTIuMDg5Mzc3LC0xLjU3OTI0MzMgaCAyLjIwMzM0MyBxIDEuODQ1MTY0LDAgMi43NDYwMzksMC4yNjU5MjA3IDAuOTA2MzAxLDAuMjYwNDkzNyAxLjU1MjEwOCwwLjg5MDAyMDMgMC41Njk4MywwLjU0ODEyMjMgMC44NDY2MDUsMS4yNjQ0ODAwNiAwLjI3Njc3NCwwLjcxNjM1NzgxIDAuMjc2Nzc0LDEuNjIyNjU4OTQgMCwwLjkxNzE1NTEgLTAuMjc2Nzc0LDEuNjM4OTM5OSAtMC4yNzY3NzUsMC43MTYzNTc4IC0wLjg0NjYwNSwxLjI2NDQ4IC0wLjY1MTIzNCwwLjYyOTUyNjYgLTEuNTYyOTYyLDAuODk1NDQ3MyAtMC45MTE3MjgsMC4yNjA0OTM3IC0yLjczNTE4NSwwLjI2MDQ5MzcgaCAtMi4yMDMzNDMgeiBtIC04LjE0NTg1NjUsMCBoIDMuNDY3ODIzIHEgMS41NDY2ODE2LDAgMi4zNzE1Nzg1LDAuNjg5MjIzIDAuODMwMzI0LDAuNjgzNzk2MSAwLjgzMDMyNCwxLjk1MzcwMzE0IDAsMS4yNzUzMzM5NyAtMC44MzAzMjQsMS45NjQ1NTcwNiBRIDkuOTg3MTk2MSwyLjI3NDkxNSA4LjQ0MDUxNDUsMi4yNzQ5MTUgSCA3LjA2MjA2ODQgViA1LjA4NjA3NjcgSCA0Ljk3MjY5MTUgWiBtIDIuMDg5Mzc2OSwxLjUxNDExOTkgdiAyLjI2MzAzOTQzIGggMS4xNTU5NDEgcSAwLjYwNzgxODgsMCAwLjkzODg2MjksLTAuMjkzMDU1NDcgMC4zMzEwNDQxLC0wLjI5ODQ4MjQxIDAuMzMxMDQ0MSwtMC44NDExNzc3MiAwLC0wLjU0MjY5NTMxIC0wLjMzMTA0NDEsLTAuODM1NzUwNzQgLTAuMzMxMDQ0MSwtMC4yOTMwNTU1IC0wLjkzODg2MjksLTAuMjkzMDU1NSB6IgovPgo8L3N2Zz4K);
  --jp-icon-python: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iLTEwIC0xMCAxMzEuMTYxMzYxNjk0MzM1OTQgMTMyLjM4ODk5OTkzODk2NDg0Ij4KICA8cGF0aCBjbGFzcz0ianAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjMzA2OTk4IiBkPSJNIDU0LjkxODc4NSw5LjE5Mjc0MjFlLTQgQyA1MC4zMzUxMzIsMC4wMjIyMTcyNyA0NS45NTc4NDYsMC40MTMxMzY5NyA0Mi4xMDYyODUsMS4wOTQ2NjkzIDMwLjc2MDA2OSwzLjA5OTE3MzEgMjguNzAwMDM2LDcuMjk0NzcxNCAyOC43MDAwMzUsMTUuMDMyMTY5IHYgMTAuMjE4NzUgaCAyNi44MTI1IHYgMy40MDYyNSBoIC0yNi44MTI1IC0xMC4wNjI1IGMgLTcuNzkyNDU5LDAgLTE0LjYxNTc1ODgsNC42ODM3MTcgLTE2Ljc0OTk5OTgsMTMuNTkzNzUgLTIuNDYxODE5OTgsMTAuMjEyOTY2IC0yLjU3MTAxNTA4LDE2LjU4NjAyMyAwLDI3LjI1IDEuOTA1OTI4Myw3LjkzNzg1MiA2LjQ1NzU0MzIsMTMuNTkzNzQ4IDE0LjI0OTk5OTgsMTMuNTkzNzUgaCA5LjIxODc1IHYgLTEyLjI1IGMgMCwtOC44NDk5MDIgNy42NTcxNDQsLTE2LjY1NjI0OCAxNi43NSwtMTYuNjU2MjUgaCAyNi43ODEyNSBjIDcuNDU0OTUxLDAgMTMuNDA2MjUzLC02LjEzODE2NCAxMy40MDYyNSwtMTMuNjI1IHYgLTI1LjUzMTI1IGMgMCwtNy4yNjYzMzg2IC02LjEyOTk4LC0xMi43MjQ3NzcxIC0xMy40MDYyNSwtMTMuOTM3NDk5NyBDIDY0LjI4MTU0OCwwLjMyNzk0Mzk3IDU5LjUwMjQzOCwtMC4wMjAzNzkwMyA1NC45MTg3ODUsOS4xOTI3NDIxZS00IFogbSAtMTQuNSw4LjIxODc1MDEyNTc5IGMgMi43Njk1NDcsMCA1LjAzMTI1LDIuMjk4NjQ1NiA1LjAzMTI1LDUuMTI0OTk5NiAtMmUtNiwyLjgxNjMzNiAtMi4yNjE3MDMsNS4wOTM3NSAtNS4wMzEyNSw1LjA5Mzc1IC0yLjc3OTQ3NiwtMWUtNiAtNS4wMzEyNSwtMi4yNzc0MTUgLTUuMDMxMjUsLTUuMDkzNzUgLTEwZS03LC0yLjgyNjM1MyAyLjI1MTc3NCwtNS4xMjQ5OTk2IDUuMDMxMjUsLTUuMTI0OTk5NiB6Ii8+CiAgPHBhdGggY2xhc3M9ImpwLWljb24tc2VsZWN0YWJsZSIgZmlsbD0iI2ZmZDQzYiIgZD0ibSA4NS42Mzc1MzUsMjguNjU3MTY5IHYgMTEuOTA2MjUgYyAwLDkuMjMwNzU1IC03LjgyNTg5NSwxNi45OTk5OTkgLTE2Ljc1LDE3IGggLTI2Ljc4MTI1IGMgLTcuMzM1ODMzLDAgLTEzLjQwNjI0OSw2LjI3ODQ4MyAtMTMuNDA2MjUsMTMuNjI1IHYgMjUuNTMxMjQ3IGMgMCw3LjI2NjM0NCA2LjMxODU4OCwxMS41NDAzMjQgMTMuNDA2MjUsMTMuNjI1MDA0IDguNDg3MzMxLDIuNDk1NjEgMTYuNjI2MjM3LDIuOTQ2NjMgMjYuNzgxMjUsMCA2Ljc1MDE1NSwtMS45NTQzOSAxMy40MDYyNTMsLTUuODg3NjEgMTMuNDA2MjUsLTEzLjYyNTAwNCBWIDg2LjUwMDkxOSBoIC0yNi43ODEyNSB2IC0zLjQwNjI1IGggMjYuNzgxMjUgMTMuNDA2MjU0IGMgNy43OTI0NjEsMCAxMC42OTYyNTEsLTUuNDM1NDA4IDEzLjQwNjI0MSwtMTMuNTkzNzUgMi43OTkzMywtOC4zOTg4ODYgMi42ODAyMiwtMTYuNDc1Nzc2IDAsLTI3LjI1IC0xLjkyNTc4LC03Ljc1NzQ0MSAtNS42MDM4NywtMTMuNTkzNzUgLTEzLjQwNjI0MSwtMTMuNTkzNzUgeiBtIC0xNS4wNjI1LDY0LjY1NjI1IGMgMi43Nzk0NzgsM2UtNiA1LjAzMTI1LDIuMjc3NDE3IDUuMDMxMjUsNS4wOTM3NDcgLTJlLTYsMi44MjYzNTQgLTIuMjUxNzc1LDUuMTI1MDA0IC01LjAzMTI1LDUuMTI1MDA0IC0yLjc2OTU1LDAgLTUuMDMxMjUsLTIuMjk4NjUgLTUuMDMxMjUsLTUuMTI1MDA0IDJlLTYsLTIuODE2MzMgMi4yNjE2OTcsLTUuMDkzNzQ3IDUuMDMxMjUsLTUuMDkzNzQ3IHoiLz4KPC9zdmc+Cg==);
  --jp-icon-r-kernel: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8cGF0aCBjbGFzcz0ianAtaWNvbi1jb250cmFzdDMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjMjE5NkYzIiBkPSJNNC40IDIuNWMxLjItLjEgMi45LS4zIDQuOS0uMyAyLjUgMCA0LjEuNCA1LjIgMS4zIDEgLjcgMS41IDEuOSAxLjUgMy41IDAgMi0xLjQgMy41LTIuOSA0LjEgMS4yLjQgMS43IDEuNiAyLjIgMyAuNiAxLjkgMSAzLjkgMS4zIDQuNmgtMy44Yy0uMy0uNC0uOC0xLjctMS4yLTMuN3MtMS4yLTIuNi0yLjYtMi42aC0uOXY2LjRINC40VjIuNXptMy43IDYuOWgxLjRjMS45IDAgMi45LS45IDIuOS0yLjNzLTEtMi4zLTIuOC0yLjNjLS43IDAtMS4zIDAtMS42LjJ2NC41aC4xdi0uMXoiLz4KPC9zdmc+Cg==);
  --jp-icon-react: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMTUwIDE1MCA1NDEuOSAyOTUuMyI+CiAgPGcgY2xhc3M9ImpwLWljb24tYnJhbmQyIGpwLWljb24tc2VsZWN0YWJsZSIgZmlsbD0iIzYxREFGQiI+CiAgICA8cGF0aCBkPSJNNjY2LjMgMjk2LjVjMC0zMi41LTQwLjctNjMuMy0xMDMuMS04Mi40IDE0LjQtNjMuNiA4LTExNC4yLTIwLjItMTMwLjQtNi41LTMuOC0xNC4xLTUuNi0yMi40LTUuNnYyMi4zYzQuNiAwIDguMy45IDExLjQgMi42IDEzLjYgNy44IDE5LjUgMzcuNSAxNC45IDc1LjctMS4xIDkuNC0yLjkgMTkuMy01LjEgMjkuNC0xOS42LTQuOC00MS04LjUtNjMuNS0xMC45LTEzLjUtMTguNS0yNy41LTM1LjMtNDEuNi01MCAzMi42LTMwLjMgNjMuMi00Ni45IDg0LTQ2LjlWNzhjLTI3LjUgMC02My41IDE5LjYtOTkuOSA1My42LTM2LjQtMzMuOC03Mi40LTUzLjItOTkuOS01My4ydjIyLjNjMjAuNyAwIDUxLjQgMTYuNSA4NCA0Ni42LTE0IDE0LjctMjggMzEuNC00MS4zIDQ5LjktMjIuNiAyLjQtNDQgNi4xLTYzLjYgMTEtMi4zLTEwLTQtMTkuNy01LjItMjktNC43LTM4LjIgMS4xLTY3LjkgMTQuNi03NS44IDMtMS44IDYuOS0yLjYgMTEuNS0yLjZWNzguNWMtOC40IDAtMTYgMS44LTIyLjYgNS42LTI4LjEgMTYuMi0zNC40IDY2LjctMTkuOSAxMzAuMS02Mi4yIDE5LjItMTAyLjcgNDkuOS0xMDIuNyA4Mi4zIDAgMzIuNSA0MC43IDYzLjMgMTAzLjEgODIuNC0xNC40IDYzLjYtOCAxMTQuMiAyMC4yIDEzMC40IDYuNSAzLjggMTQuMSA1LjYgMjIuNSA1LjYgMjcuNSAwIDYzLjUtMTkuNiA5OS45LTUzLjYgMzYuNCAzMy44IDcyLjQgNTMuMiA5OS45IDUzLjIgOC40IDAgMTYtMS44IDIyLjYtNS42IDI4LjEtMTYuMiAzNC40LTY2LjcgMTkuOS0xMzAuMSA2Mi0xOS4xIDEwMi41LTQ5LjkgMTAyLjUtODIuM3ptLTEzMC4yLTY2LjdjLTMuNyAxMi45LTguMyAyNi4yLTEzLjUgMzkuNS00LjEtOC04LjQtMTYtMTMuMS0yNC00LjYtOC05LjUtMTUuOC0xNC40LTIzLjQgMTQuMiAyLjEgMjcuOSA0LjcgNDEgNy45em0tNDUuOCAxMDYuNWMtNy44IDEzLjUtMTUuOCAyNi4zLTI0LjEgMzguMi0xNC45IDEuMy0zMCAyLTQ1LjIgMi0xNS4xIDAtMzAuMi0uNy00NS0xLjktOC4zLTExLjktMTYuNC0yNC42LTI0LjItMzgtNy42LTEzLjEtMTQuNS0yNi40LTIwLjgtMzkuOCA2LjItMTMuNCAxMy4yLTI2LjggMjAuNy0zOS45IDcuOC0xMy41IDE1LjgtMjYuMyAyNC4xLTM4LjIgMTQuOS0xLjMgMzAtMiA0NS4yLTIgMTUuMSAwIDMwLjIuNyA0NSAxLjkgOC4zIDExLjkgMTYuNCAyNC42IDI0LjIgMzggNy42IDEzLjEgMTQuNSAyNi40IDIwLjggMzkuOC02LjMgMTMuNC0xMy4yIDI2LjgtMjAuNyAzOS45em0zMi4zLTEzYzUuNCAxMy40IDEwIDI2LjggMTMuOCAzOS44LTEzLjEgMy4yLTI2LjkgNS45LTQxLjIgOCA0LjktNy43IDkuOC0xNS42IDE0LjQtMjMuNyA0LjYtOCA4LjktMTYuMSAxMy0yNC4xek00MjEuMiA0MzBjLTkuMy05LjYtMTguNi0yMC4zLTI3LjgtMzIgOSAuNCAxOC4yLjcgMjcuNS43IDkuNCAwIDE4LjctLjIgMjcuOC0uNy05IDExLjctMTguMyAyMi40LTI3LjUgMzJ6bS03NC40LTU4LjljLTE0LjItMi4xLTI3LjktNC43LTQxLTcuOSAzLjctMTIuOSA4LjMtMjYuMiAxMy41LTM5LjUgNC4xIDggOC40IDE2IDEzLjEgMjQgNC43IDggOS41IDE1LjggMTQuNCAyMy40ek00MjAuNyAxNjNjOS4zIDkuNiAxOC42IDIwLjMgMjcuOCAzMi05LS40LTE4LjItLjctMjcuNS0uNy05LjQgMC0xOC43LjItMjcuOC43IDktMTEuNyAxOC4zLTIyLjQgMjcuNS0zMnptLTc0IDU4LjljLTQuOSA3LjctOS44IDE1LjYtMTQuNCAyMy43LTQuNiA4LTguOSAxNi0xMyAyNC01LjQtMTMuNC0xMC0yNi44LTEzLjgtMzkuOCAxMy4xLTMuMSAyNi45LTUuOCA0MS4yLTcuOXptLTkwLjUgMTI1LjJjLTM1LjQtMTUuMS01OC4zLTM0LjktNTguMy01MC42IDAtMTUuNyAyMi45LTM1LjYgNTguMy01MC42IDguNi0zLjcgMTgtNyAyNy43LTEwLjEgNS43IDE5LjYgMTMuMiA0MCAyMi41IDYwLjktOS4yIDIwLjgtMTYuNiA0MS4xLTIyLjIgNjAuNi05LjktMy4xLTE5LjMtNi41LTI4LTEwLjJ6TTMxMCA0OTBjLTEzLjYtNy44LTE5LjUtMzcuNS0xNC45LTc1LjcgMS4xLTkuNCAyLjktMTkuMyA1LjEtMjkuNCAxOS42IDQuOCA0MSA4LjUgNjMuNSAxMC45IDEzLjUgMTguNSAyNy41IDM1LjMgNDEuNiA1MC0zMi42IDMwLjMtNjMuMiA0Ni45LTg0IDQ2LjktNC41LS4xLTguMy0xLTExLjMtMi43em0yMzcuMi03Ni4yYzQuNyAzOC4yLTEuMSA2Ny45LTE0LjYgNzUuOC0zIDEuOC02LjkgMi42LTExLjUgMi42LTIwLjcgMC01MS40LTE2LjUtODQtNDYuNiAxNC0xNC43IDI4LTMxLjQgNDEuMy00OS45IDIyLjYtMi40IDQ0LTYuMSA2My42LTExIDIuMyAxMC4xIDQuMSAxOS44IDUuMiAyOS4xem0zOC41LTY2LjdjLTguNiAzLjctMTggNy0yNy43IDEwLjEtNS43LTE5LjYtMTMuMi00MC0yMi41LTYwLjkgOS4yLTIwLjggMTYuNi00MS4xIDIyLjItNjAuNiA5LjkgMy4xIDE5LjMgNi41IDI4LjEgMTAuMiAzNS40IDE1LjEgNTguMyAzNC45IDU4LjMgNTAuNi0uMSAxNS43LTIzIDM1LjYtNTguNCA1MC42ek0zMjAuOCA3OC40eiIvPgogICAgPGNpcmNsZSBjeD0iNDIwLjkiIGN5PSIyOTYuNSIgcj0iNDUuNyIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-redo: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgd2lkdGg9IjE2Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgICA8cGF0aCBkPSJNMCAwaDI0djI0SDB6IiBmaWxsPSJub25lIi8+PHBhdGggZD0iTTE4LjQgMTAuNkMxNi41NSA4Ljk5IDE0LjE1IDggMTEuNSA4Yy00LjY1IDAtOC41OCAzLjAzLTkuOTYgNy4yMkwzLjkgMTZjMS4wNS0zLjE5IDQuMDUtNS41IDcuNi01LjUgMS45NSAwIDMuNzMuNzIgNS4xMiAxLjg4TDEzIDE2aDlWN2wtMy42IDMuNnoiLz4KICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-refresh: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDE4IDE4Ij4KICAgIDxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CiAgICAgICAgPHBhdGggZD0iTTkgMTMuNWMtMi40OSAwLTQuNS0yLjAxLTQuNS00LjVTNi41MSA0LjUgOSA0LjVjMS4yNCAwIDIuMzYuNTIgMy4xNyAxLjMzTDEwIDhoNVYzbC0xLjc2IDEuNzZDMTIuMTUgMy42OCAxMC42NiAzIDkgMyA1LjY5IDMgMy4wMSA1LjY5IDMuMDEgOVM1LjY5IDE1IDkgMTVjMi45NyAwIDUuNDMtMi4xNiA1LjktNWgtMS41MmMtLjQ2IDItMi4yNCAzLjUtNC4zOCAzLjV6Ii8+CiAgICA8L2c+Cjwvc3ZnPgo=);
  --jp-icon-regex: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIwIDIwIj4KICA8ZyBjbGFzcz0ianAtaWNvbjIiIGZpbGw9IiM0MTQxNDEiPgogICAgPHJlY3QgeD0iMiIgeT0iMiIgd2lkdGg9IjE2IiBoZWlnaHQ9IjE2Ii8+CiAgPC9nPgoKICA8ZyBjbGFzcz0ianAtaWNvbi1hY2NlbnQyIiBmaWxsPSIjRkZGIj4KICAgIDxjaXJjbGUgY2xhc3M9InN0MiIgY3g9IjUuNSIgY3k9IjE0LjUiIHI9IjEuNSIvPgogICAgPHJlY3QgeD0iMTIiIHk9IjQiIGNsYXNzPSJzdDIiIHdpZHRoPSIxIiBoZWlnaHQ9IjgiLz4KICAgIDxyZWN0IHg9IjguNSIgeT0iNy41IiB0cmFuc2Zvcm09Im1hdHJpeCgwLjg2NiAtMC41IDAuNSAwLjg2NiAtMi4zMjU1IDcuMzIxOSkiIGNsYXNzPSJzdDIiIHdpZHRoPSI4IiBoZWlnaHQ9IjEiLz4KICAgIDxyZWN0IHg9IjEyIiB5PSI0IiB0cmFuc2Zvcm09Im1hdHJpeCgwLjUgLTAuODY2IDAuODY2IDAuNSAtMC42Nzc5IDE0LjgyNTIpIiBjbGFzcz0ic3QyIiB3aWR0aD0iMSIgaGVpZ2h0PSI4Ii8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-run: url(data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CiAgICAgICAgPHBhdGggZD0iTTggNXYxNGwxMS03eiIvPgogICAgPC9nPgo8L3N2Zz4K);
  --jp-icon-running: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDUxMiA1MTIiPgogIDxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CiAgICA8cGF0aCBkPSJNMjU2IDhDMTE5IDggOCAxMTkgOCAyNTZzMTExIDI0OCAyNDggMjQ4IDI0OC0xMTEgMjQ4LTI0OFMzOTMgOCAyNTYgOHptOTYgMzI4YzAgOC44LTcuMiAxNi0xNiAxNkgxNzZjLTguOCAwLTE2LTcuMi0xNi0xNlYxNzZjMC04LjggNy4yLTE2IDE2LTE2aDE2MGM4LjggMCAxNiA3LjIgMTYgMTZ2MTYweiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-save: url(data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CiAgICAgICAgPHBhdGggZD0iTTE3IDNINWMtMS4xMSAwLTIgLjktMiAydjE0YzAgMS4xLjg5IDIgMiAyaDE0YzEuMSAwIDItLjkgMi0yVjdsLTQtNHptLTUgMTZjLTEuNjYgMC0zLTEuMzQtMy0zczEuMzQtMyAzLTMgMyAxLjM0IDMgMy0xLjM0IDMtMyAzem0zLTEwSDVWNWgxMHY0eiIvPgogICAgPC9nPgo8L3N2Zz4K);
  --jp-icon-search: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMTggMTgiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTEyLjEsMTAuOWgtMC43bC0wLjItMC4yYzAuOC0wLjksMS4zLTIuMiwxLjMtMy41YzAtMy0yLjQtNS40LTUuNC01LjRTMS44LDQuMiwxLjgsNy4xczIuNCw1LjQsNS40LDUuNCBjMS4zLDAsMi41LTAuNSwzLjUtMS4zbDAuMiwwLjJ2MC43bDQuMSw0LjFsMS4yLTEuMkwxMi4xLDEwLjl6IE03LjEsMTAuOWMtMi4xLDAtMy43LTEuNy0zLjctMy43czEuNy0zLjcsMy43LTMuN3MzLjcsMS43LDMuNywzLjcgUzkuMiwxMC45LDcuMSwxMC45eiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-settings: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8cGF0aCBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIiBkPSJNMTkuNDMgMTIuOThjLjA0LS4zMi4wNy0uNjQuMDctLjk4cy0uMDMtLjY2LS4wNy0uOThsMi4xMS0xLjY1Yy4xOS0uMTUuMjQtLjQyLjEyLS42NGwtMi0zLjQ2Yy0uMTItLjIyLS4zOS0uMy0uNjEtLjIybC0yLjQ5IDFjLS41Mi0uNC0xLjA4LS43My0xLjY5LS45OGwtLjM4LTIuNjVBLjQ4OC40ODggMCAwMDE0IDJoLTRjLS4yNSAwLS40Ni4xOC0uNDkuNDJsLS4zOCAyLjY1Yy0uNjEuMjUtMS4xNy41OS0xLjY5Ljk4bC0yLjQ5LTFjLS4yMy0uMDktLjQ5IDAtLjYxLjIybC0yIDMuNDZjLS4xMy4yMi0uMDcuNDkuMTIuNjRsMi4xMSAxLjY1Yy0uMDQuMzItLjA3LjY1LS4wNy45OHMuMDMuNjYuMDcuOThsLTIuMTEgMS42NWMtLjE5LjE1LS4yNC40Mi0uMTIuNjRsMiAzLjQ2Yy4xMi4yMi4zOS4zLjYxLjIybDIuNDktMWMuNTIuNCAxLjA4LjczIDEuNjkuOThsLjM4IDIuNjVjLjAzLjI0LjI0LjQyLjQ5LjQyaDRjLjI1IDAgLjQ2LS4xOC40OS0uNDJsLjM4LTIuNjVjLjYxLS4yNSAxLjE3LS41OSAxLjY5LS45OGwyLjQ5IDFjLjIzLjA5LjQ5IDAgLjYxLS4yMmwyLTMuNDZjLjEyLS4yMi4wNy0uNDktLjEyLS42NGwtMi4xMS0xLjY1ek0xMiAxNS41Yy0xLjkzIDAtMy41LTEuNTctMy41LTMuNXMxLjU3LTMuNSAzLjUtMy41IDMuNSAxLjU3IDMuNSAzLjUtMS41NyAzLjUtMy41IDMuNXoiLz4KPC9zdmc+Cg==);
  --jp-icon-share: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTSAxOCAyIEMgMTYuMzU0OTkgMiAxNSAzLjM1NDk5MDQgMTUgNSBDIDE1IDUuMTkwOTUyOSAxNS4wMjE3OTEgNS4zNzcxMjI0IDE1LjA1NjY0MSA1LjU1ODU5MzggTCA3LjkyMTg3NSA5LjcyMDcwMzEgQyA3LjM5ODUzOTkgOS4yNzc4NTM5IDYuNzMyMDc3MSA5IDYgOSBDIDQuMzU0OTkwNCA5IDMgMTAuMzU0OTkgMyAxMiBDIDMgMTMuNjQ1MDEgNC4zNTQ5OTA0IDE1IDYgMTUgQyA2LjczMjA3NzEgMTUgNy4zOTg1Mzk5IDE0LjcyMjE0NiA3LjkyMTg3NSAxNC4yNzkyOTcgTCAxNS4wNTY2NDEgMTguNDM5NDUzIEMgMTUuMDIxNTU1IDE4LjYyMTUxNCAxNSAxOC44MDgzODYgMTUgMTkgQyAxNSAyMC42NDUwMSAxNi4zNTQ5OSAyMiAxOCAyMiBDIDE5LjY0NTAxIDIyIDIxIDIwLjY0NTAxIDIxIDE5IEMgMjEgMTcuMzU0OTkgMTkuNjQ1MDEgMTYgMTggMTYgQyAxNy4yNjc0OCAxNiAxNi42MDE1OTMgMTYuMjc5MzI4IDE2LjA3ODEyNSAxNi43MjI2NTYgTCA4Ljk0MzM1OTQgMTIuNTU4NTk0IEMgOC45NzgyMDk1IDEyLjM3NzEyMiA5IDEyLjE5MDk1MyA5IDEyIEMgOSAxMS44MDkwNDcgOC45NzgyMDk1IDExLjYyMjg3OCA4Ljk0MzM1OTQgMTEuNDQxNDA2IEwgMTYuMDc4MTI1IDcuMjc5Mjk2OSBDIDE2LjYwMTQ2IDcuNzIyMTQ2MSAxNy4yNjc5MjMgOCAxOCA4IEMgMTkuNjQ1MDEgOCAyMSA2LjY0NTAwOTYgMjEgNSBDIDIxIDMuMzU0OTkwNCAxOS42NDUwMSAyIDE4IDIgeiBNIDE4IDQgQyAxOC41NjQxMjkgNCAxOSA0LjQzNTg3MDYgMTkgNSBDIDE5IDUuNTY0MTI5NCAxOC41NjQxMjkgNiAxOCA2IEMgMTcuNDM1ODcxIDYgMTcgNS41NjQxMjk0IDE3IDUgQyAxNyA0LjQzNTg3MDYgMTcuNDM1ODcxIDQgMTggNCB6IE0gNiAxMSBDIDYuNTY0MTI5NCAxMSA3IDExLjQzNTg3MSA3IDEyIEMgNyAxMi41NjQxMjkgNi41NjQxMjk0IDEzIDYgMTMgQyA1LjQzNTg3MDYgMTMgNSAxMi41NjQxMjkgNSAxMiBDIDUgMTEuNDM1ODcxIDUuNDM1ODcwNiAxMSA2IDExIHogTSAxOCAxOCBDIDE4LjU2NDEyOSAxOCAxOSAxOC40MzU4NzEgMTkgMTkgQyAxOSAxOS41NjQxMjkgMTguNTY0MTI5IDIwIDE4IDIwIEMgMTcuNDM1ODcxIDIwIDE3IDE5LjU2NDEyOSAxNyAxOSBDIDE3IDE4LjQzNTg3MSAxNy40MzU4NzEgMTggMTggMTggeiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-spreadsheet: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8cGF0aCBjbGFzcz0ianAtaWNvbi1jb250cmFzdDEganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNENBRjUwIiBkPSJNMi4yIDIuMnYxNy42aDE3LjZWMi4ySDIuMnptMTUuNCA3LjdoLTUuNVY0LjRoNS41djUuNXpNOS45IDQuNHY1LjVINC40VjQuNGg1LjV6bS01LjUgNy43aDUuNXY1LjVINC40di01LjV6bTcuNyA1LjV2LTUuNWg1LjV2NS41aC01LjV6Ii8+Cjwvc3ZnPgo=);
  --jp-icon-stop: url(data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIgZmlsbD0ibm9uZSIvPgogICAgICAgIDxwYXRoIGQ9Ik02IDZoMTJ2MTJINnoiLz4KICAgIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-tab: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTIxIDNIM2MtMS4xIDAtMiAuOS0yIDJ2MTRjMCAxLjEuOSAyIDIgMmgxOGMxLjEgMCAyLS45IDItMlY1YzAtMS4xLS45LTItMi0yem0wIDE2SDNWNWgxMHY0aDh2MTB6Ii8+CiAgPC9nPgo8L3N2Zz4K);
  --jp-icon-table-rows: url(data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIgZmlsbD0ibm9uZSIvPgogICAgICAgIDxwYXRoIGQ9Ik0yMSw4SDNWNGgxOFY4eiBNMjEsMTBIM3Y0aDE4VjEweiBNMjEsMTZIM3Y0aDE4VjE2eiIvPgogICAgPC9nPgo8L3N2Zz4=);
  --jp-icon-tag: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjgiIGhlaWdodD0iMjgiIHZpZXdCb3g9IjAgMCA0MyAyOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KCTxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CgkJPHBhdGggZD0iTTI4LjgzMzIgMTIuMzM0TDMyLjk5OTggMTYuNTAwN0wzNy4xNjY1IDEyLjMzNEgyOC44MzMyWiIvPgoJCTxwYXRoIGQ9Ik0xNi4yMDk1IDIxLjYxMDRDMTUuNjg3MyAyMi4xMjk5IDE0Ljg0NDMgMjIuMTI5OSAxNC4zMjQ4IDIxLjYxMDRMNi45ODI5IDE0LjcyNDVDNi41NzI0IDE0LjMzOTQgNi4wODMxMyAxMy42MDk4IDYuMDQ3ODYgMTMuMDQ4MkM1Ljk1MzQ3IDExLjUyODggNi4wMjAwMiA4LjYxOTQ0IDYuMDY2MjEgNy4wNzY5NUM2LjA4MjgxIDYuNTE0NzcgNi41NTU0OCA2LjA0MzQ3IDcuMTE4MDQgNi4wMzA1NUM5LjA4ODYzIDUuOTg0NzMgMTMuMjYzOCA1LjkzNTc5IDEzLjY1MTggNi4zMjQyNUwyMS43MzY5IDEzLjYzOUMyMi4yNTYgMTQuMTU4NSAyMS43ODUxIDE1LjQ3MjQgMjEuMjYyIDE1Ljk5NDZMMTYuMjA5NSAyMS42MTA0Wk05Ljc3NTg1IDguMjY1QzkuMzM1NTEgNy44MjU2NiA4LjYyMzUxIDcuODI1NjYgOC4xODI4IDguMjY1QzcuNzQzNDYgOC43MDU3MSA3Ljc0MzQ2IDkuNDE3MzMgOC4xODI4IDkuODU2NjdDOC42MjM4MiAxMC4yOTY0IDkuMzM1ODIgMTAuMjk2NCA5Ljc3NTg1IDkuODU2NjdDMTAuMjE1NiA5LjQxNzMzIDEwLjIxNTYgOC43MDUzMyA5Ljc3NTg1IDguMjY1WiIvPgoJPC9nPgo8L3N2Zz4K);
  --jp-icon-terminal: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0IiA+CiAgICA8cmVjdCBjbGFzcz0ianAtdGVybWluYWwtaWNvbi1iYWNrZ3JvdW5kLWNvbG9yIGpwLWljb24tc2VsZWN0YWJsZSIgd2lkdGg9IjIwIiBoZWlnaHQ9IjIwIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgyIDIpIiBmaWxsPSIjMzMzMzMzIi8+CiAgICA8cGF0aCBjbGFzcz0ianAtdGVybWluYWwtaWNvbi1jb2xvciBqcC1pY29uLXNlbGVjdGFibGUtaW52ZXJzZSIgZD0iTTUuMDU2NjQgOC43NjE3MkM1LjA1NjY0IDguNTk3NjYgNS4wMzEyNSA4LjQ1MzEyIDQuOTgwNDcgOC4zMjgxMkM0LjkzMzU5IDguMTk5MjIgNC44NTU0NyA4LjA4MjAzIDQuNzQ2MDkgNy45NzY1NkM0LjY0MDYyIDcuODcxMDkgNC41IDcuNzc1MzkgNC4zMjQyMiA3LjY4OTQ1QzQuMTUyMzQgNy41OTk2MSAzLjk0MzM2IDcuNTExNzIgMy42OTcyNyA3LjQyNTc4QzMuMzAyNzMgNy4yODUxNiAyLjk0MzM2IDcuMTM2NzIgMi42MTkxNCA2Ljk4MDQ3QzIuMjk0OTIgNi44MjQyMiAyLjAxNzU4IDYuNjQyNTggMS43ODcxMSA2LjQzNTU1QzEuNTYwNTUgNi4yMjg1MiAxLjM4NDc3IDUuOTg4MjggMS4yNTk3NyA1LjcxNDg0QzEuMTM0NzcgNS40Mzc1IDEuMDcyMjcgNS4xMDkzOCAxLjA3MjI3IDQuNzMwNDdDMS4wNzIyNyA0LjM5ODQ0IDEuMTI4OTEgNC4wOTU3IDEuMjQyMTkgMy44MjIyN0MxLjM1NTQ3IDMuNTQ0OTIgMS41MTU2MiAzLjMwNDY5IDEuNzIyNjYgMy4xMDE1NkMxLjkyOTY5IDIuODk4NDQgMi4xNzk2OSAyLjczNDM3IDIuNDcyNjYgMi42MDkzOEMyLjc2NTYyIDIuNDg0MzggMy4wOTE4IDIuNDA0MyAzLjQ1MTE3IDIuMzY5MTRWMS4xMDkzOEg0LjM4ODY3VjIuMzgwODZDNC43NDAyMyAyLjQyNzczIDUuMDU2NjQgMi41MjM0NCA1LjMzNzg5IDIuNjY3OTdDNS42MTkxNCAyLjgxMjUgNS44NTc0MiAzLjAwMTk1IDYuMDUyNzMgMy4yMzYzM0M2LjI1MTk1IDMuNDY2OCA2LjQwNDMgMy43NDAyMyA2LjUwOTc3IDQuMDU2NjRDNi42MTkxNCA0LjM2OTE0IDYuNjczODMgNC43MjA3IDYuNjczODMgNS4xMTEzM0g1LjA0NDkyQzUuMDQ0OTIgNC42Mzg2NyA0LjkzNzUgNC4yODEyNSA0LjcyMjY2IDQuMDM5MDZDNC41MDc4MSAzLjc5Mjk3IDQuMjE2OCAzLjY2OTkyIDMuODQ5NjEgMy42Njk5MkMzLjY1MDM5IDMuNjY5OTIgMy40NzY1NiAzLjY5NzI3IDMuMzI4MTIgMy43NTE5NUMzLjE4MzU5IDMuODAyNzMgMy4wNjQ0NSAzLjg3Njk1IDIuOTcwNyAzLjk3NDYxQzIuODc2OTUgNC4wNjgzNiAyLjgwNjY0IDQuMTc5NjkgMi43NTk3NyA0LjMwODU5QzIuNzE2OCA0LjQzNzUgMi42OTUzMSA0LjU3ODEyIDIuNjk1MzEgNC43MzA0N0MyLjY5NTMxIDQuODgyODEgMi43MTY4IDUuMDE5NTMgMi43NTk3NyA1LjE0MDYyQzIuODA2NjQgNS4yNTc4MSAyLjg4MjgxIDUuMzY3MTkgMi45ODgyOCA1LjQ2ODc1QzMuMDk3NjYgNS41NzAzMSAzLjI0MDIzIDUuNjY3OTcgMy40MTYwMiA1Ljc2MTcyQzMuNTkxOCA1Ljg1MTU2IDMuODEwNTUgNS45NDMzNiA0LjA3MjI3IDYuMDM3MTFDNC40NjY4IDYuMTg1NTUgNC44MjQyMiA2LjMzOTg0IDUuMTQ0NTMgNi41QzUuNDY0ODQgNi42NTYyNSA1LjczODI4IDYuODM5ODQgNS45NjQ4NCA3LjA1MDc4QzYuMTk1MzEgNy4yNTc4MSA2LjM3MTA5IDcuNSA2LjQ5MjE5IDcuNzc3MzRDNi42MTcxOSA4LjA1MDc4IDYuNjc5NjkgOC4zNzUgNi42Nzk2OSA4Ljc1QzYuNjc5NjkgOS4wOTM3NSA2LjYyMzA1IDkuNDA0MyA2LjUwOTc3IDkuNjgxNjRDNi4zOTY0OCA5Ljk1NTA4IDYuMjM0MzggMTAuMTkxNCA2LjAyMzQ0IDEwLjM5MDZDNS44MTI1IDEwLjU4OTggNS41NTg1OSAxMC43NSA1LjI2MTcyIDEwLjg3MTFDNC45NjQ4NCAxMC45ODgzIDQuNjMyODEgMTEuMDY0NSA0LjI2NTYyIDExLjA5OTZWMTIuMjQ4SDMuMzMzOThWMTEuMDk5NkMzLjAwMTk1IDExLjA2ODQgMi42Nzk2OSAxMC45OTYxIDIuMzY3MTkgMTAuODgyOEMyLjA1NDY5IDEwLjc2NTYgMS43NzczNCAxMC41OTc3IDEuNTM1MTYgMTAuMzc4OUMxLjI5Njg4IDEwLjE2MDIgMS4xMDU0NyA5Ljg4NDc3IDAuOTYwOTM4IDkuNTUyNzNDMC44MTY0MDYgOS4yMTY4IDAuNzQ0MTQxIDguODE0NDUgMC43NDQxNDEgOC4zNDU3SDIuMzc4OTFDMi4zNzg5MSA4LjYyNjk1IDIuNDE5OTIgOC44NjMyOCAyLjUwMTk1IDkuMDU0NjlDMi41ODM5OCA5LjI0MjE5IDIuNjg5NDUgOS4zOTI1OCAyLjgxODM2IDkuNTA1ODZDMi45NTExNyA5LjYxNTIzIDMuMTAxNTYgOS42OTMzNiAzLjI2OTUzIDkuNzQwMjNDMy40Mzc1IDkuNzg3MTEgMy42MDkzOCA5LjgxMDU1IDMuNzg1MTYgOS44MTA1NUM0LjIwMzEyIDkuODEwNTUgNC41MTk1MyA5LjcxMjg5IDQuNzM0MzggOS41MTc1OEM0Ljk0OTIyIDkuMzIyMjcgNS4wNTY2NCA5LjA3MDMxIDUuMDU2NjQgOC43NjE3MlpNMTMuNDE4IDEyLjI3MTVIOC4wNzQyMlYxMUgxMy40MThWMTIuMjcxNVoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMuOTUyNjQgNikiIGZpbGw9IndoaXRlIi8+Cjwvc3ZnPgo=);
  --jp-icon-text-editor: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8cGF0aCBjbGFzcz0ianAtdGV4dC1lZGl0b3ItaWNvbi1jb2xvciBqcC1pY29uLXNlbGVjdGFibGUiIGZpbGw9IiM2MTYxNjEiIGQ9Ik0xNSAxNUgzdjJoMTJ2LTJ6bTAtOEgzdjJoMTJWN3pNMyAxM2gxOHYtMkgzdjJ6bTAgOGgxOHYtMkgzdjJ6TTMgM3YyaDE4VjNIM3oiLz4KPC9zdmc+Cg==);
  --jp-icon-toc: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICA8ZyBjbGFzcz0ianAtaWNvbjMganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjNjE2MTYxIj4KICAgIDxwYXRoIGQ9Ik03LDVIMjFWN0g3VjVNNywxM1YxMUgyMVYxM0g3TTQsNC41QTEuNSwxLjUgMCAwLDEgNS41LDZBMS41LDEuNSAwIDAsMSA0LDcuNUExLjUsMS41IDAgMCwxIDIuNSw2QTEuNSwxLjUgMCAwLDEgNCw0LjVNNCwxMC41QTEuNSwxLjUgMCAwLDEgNS41LDEyQTEuNSwxLjUgMCAwLDEgNCwxMy41QTEuNSwxLjUgMCAwLDEgMi41LDEyQTEuNSwxLjUgMCAwLDEgNCwxMC41TTcsMTlWMTdIMjFWMTlIN000LDE2LjVBMS41LDEuNSAwIDAsMSA1LjUsMThBMS41LDEuNSAwIDAsMSA0LDE5LjVBMS41LDEuNSAwIDAsMSAyLjUsMThBMS41LDEuNSAwIDAsMSA0LDE2LjVaIiAvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-tree-view: url(data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGNsYXNzPSJqcC1pY29uMyIgZmlsbD0iIzYxNjE2MSI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIgZmlsbD0ibm9uZSIvPgogICAgICAgIDxwYXRoIGQ9Ik0yMiAxMVYzaC03djNIOVYzSDJ2OGg3VjhoMnYxMGg0djNoN3YtOGgtN3YzaC0yVjhoMnYzeiIvPgogICAgPC9nPgo8L3N2Zz4=);
  --jp-icon-trusted: url(data:image/svg+xml;base64,PHN2ZyBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDI0IDI1Ij4KICAgIDxwYXRoIGNsYXNzPSJqcC1pY29uMiIgc3Ryb2tlPSIjMzMzMzMzIiBzdHJva2Utd2lkdGg9IjIiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDIgMykiIGQ9Ik0xLjg2MDk0IDExLjQ0MDlDMC44MjY0NDggOC43NzAyNyAwLjg2Mzc3OSA2LjA1NzY0IDEuMjQ5MDcgNC4xOTkzMkMyLjQ4MjA2IDMuOTMzNDcgNC4wODA2OCAzLjQwMzQ3IDUuNjAxMDIgMi44NDQ5QzcuMjM1NDkgMi4yNDQ0IDguODU2NjYgMS41ODE1IDkuOTg3NiAxLjA5NTM5QzExLjA1OTcgMS41ODM0MSAxMi42MDk0IDIuMjQ0NCAxNC4yMTggMi44NDMzOUMxNS43NTAzIDMuNDEzOTQgMTcuMzk5NSAzLjk1MjU4IDE4Ljc1MzkgNC4yMTM4NUMxOS4xMzY0IDYuMDcxNzcgMTkuMTcwOSA4Ljc3NzIyIDE4LjEzOSAxMS40NDA5QzE3LjAzMDMgMTQuMzAzMiAxNC42NjY4IDE3LjE4NDQgOS45OTk5OSAxOC45MzU0QzUuMzMzMiAxNy4xODQ0IDIuOTY5NjggMTQuMzAzMiAxLjg2MDk0IDExLjQ0MDlaIi8+CiAgICA8cGF0aCBjbGFzcz0ianAtaWNvbjIiIGZpbGw9IiMzMzMzMzMiIHN0cm9rZT0iIzMzMzMzMyIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoOCA5Ljg2NzE5KSIgZD0iTTIuODYwMTUgNC44NjUzNUwwLjcyNjU0OSAyLjk5OTU5TDAgMy42MzA0NUwyLjg2MDE1IDYuMTMxNTdMOCAwLjYzMDg3Mkw3LjI3ODU3IDBMMi44NjAxNSA0Ljg2NTM1WiIvPgo8L3N2Zz4K);
  --jp-icon-undo: url(data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjQgMjQiIHdpZHRoPSIxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTEyLjUgOGMtMi42NSAwLTUuMDUuOTktNi45IDIuNkwyIDd2OWg5bC0zLjYyLTMuNjJjMS4zOS0xLjE2IDMuMTYtMS44OCA1LjEyLTEuODggMy41NCAwIDYuNTUgMi4zMSA3LjYgNS41bDIuMzctLjc4QzIxLjA4IDExLjAzIDE3LjE1IDggMTIuNSA4eiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-user: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8ZyBjbGFzcz0ianAtaWNvbjMiIGZpbGw9IiM2MTYxNjEiPgogICAgPHBhdGggZD0iTTE2IDdhNCA0IDAgMTEtOCAwIDQgNCAwIDAxOCAwek0xMiAxNGE3IDcgMCAwMC03IDdoMTRhNyA3IDAgMDAtNy03eiIvPgogIDwvZz4KPC9zdmc+);
  --jp-icon-users: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZlcnNpb249IjEuMSIgdmlld0JveD0iMCAwIDM2IDI0IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogPGcgY2xhc3M9ImpwLWljb24zIiB0cmFuc2Zvcm09Im1hdHJpeCgxLjczMjcgMCAwIDEuNzMyNyAtMy42MjgyIC4wOTk1NzcpIiBmaWxsPSIjNjE2MTYxIj4KICA8cGF0aCB0cmFuc2Zvcm09Im1hdHJpeCgxLjUsMCwwLDEuNSwwLC02KSIgZD0ibTEyLjE4NiA3LjUwOThjLTEuMDUzNSAwLTEuOTc1NyAwLjU2NjUtMi40Nzg1IDEuNDEwMiAwLjc1MDYxIDAuMzEyNzcgMS4zOTc0IDAuODI2NDggMS44NzMgMS40NzI3aDMuNDg2M2MwLTEuNTkyLTEuMjg4OS0yLjg4MjgtMi44ODA5LTIuODgyOHoiLz4KICA8cGF0aCBkPSJtMjAuNDY1IDIuMzg5NWEyLjE4ODUgMi4xODg1IDAgMCAxLTIuMTg4NCAyLjE4ODUgMi4xODg1IDIuMTg4NSAwIDAgMS0yLjE4ODUtMi4xODg1IDIuMTg4NSAyLjE4ODUgMCAwIDEgMi4xODg1LTIuMTg4NSAyLjE4ODUgMi4xODg1IDAgMCAxIDIuMTg4NCAyLjE4ODV6Ii8+CiAgPHBhdGggdHJhbnNmb3JtPSJtYXRyaXgoMS41LDAsMCwxLjUsMCwtNikiIGQ9Im0zLjU4OTggOC40MjE5Yy0xLjExMjYgMC0yLjAxMzcgMC45MDExMS0yLjAxMzcgMi4wMTM3aDIuODE0NWMwLjI2Nzk3LTAuMzczMDkgMC41OTA3LTAuNzA0MzUgMC45NTg5OC0wLjk3ODUyLTAuMzQ0MzMtMC42MTY4OC0xLjAwMzEtMS4wMzUyLTEuNzU5OC0xLjAzNTJ6Ii8+CiAgPHBhdGggZD0ibTYuOTE1NCA0LjYyM2ExLjUyOTQgMS41Mjk0IDAgMCAxLTEuNTI5NCAxLjUyOTQgMS41Mjk0IDEuNTI5NCAwIDAgMS0xLjUyOTQtMS41Mjk0IDEuNTI5NCAxLjUyOTQgMCAwIDEgMS41Mjk0LTEuNTI5NCAxLjUyOTQgMS41Mjk0IDAgMCAxIDEuNTI5NCAxLjUyOTR6Ii8+CiAgPHBhdGggZD0ibTYuMTM1IDEzLjUzNWMwLTMuMjM5MiAyLjYyNTktNS44NjUgNS44NjUtNS44NjUgMy4yMzkyIDAgNS44NjUgMi42MjU5IDUuODY1IDUuODY1eiIvPgogIDxjaXJjbGUgY3g9IjEyIiBjeT0iMy43Njg1IiByPSIyLjk2ODUiLz4KIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-vega: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8ZyBjbGFzcz0ianAtaWNvbjEganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjMjEyMTIxIj4KICAgIDxwYXRoIGQ9Ik0xMC42IDUuNGwyLjItMy4ySDIuMnY3LjNsNC02LjZ6Ii8+CiAgICA8cGF0aCBkPSJNMTUuOCAyLjJsLTQuNCA2LjZMNyA2LjNsLTQuOCA4djUuNWgxNy42VjIuMmgtNHptLTcgMTUuNEg1LjV2LTQuNGgzLjN2NC40em00LjQgMEg5LjhWOS44aDMuNHY3Ljh6bTQuNCAwaC0zLjRWNi41aDMuNHYxMS4xeiIvPgogIDwvZz4KPC9zdmc+Cg==);
  --jp-icon-yaml: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgdmlld0JveD0iMCAwIDIyIDIyIj4KICA8ZyBjbGFzcz0ianAtaWNvbi1jb250cmFzdDIganAtaWNvbi1zZWxlY3RhYmxlIiBmaWxsPSIjRDgxQjYwIj4KICAgIDxwYXRoIGQ9Ik03LjIgMTguNnYtNS40TDMgNS42aDMuM2wxLjQgMy4xYy4zLjkuNiAxLjYgMSAyLjUuMy0uOC42LTEuNiAxLTIuNWwxLjQtMy4xaDMuNGwtNC40IDcuNnY1LjVsLTIuOS0uMXoiLz4KICAgIDxjaXJjbGUgY2xhc3M9InN0MCIgY3g9IjE3LjYiIGN5PSIxNi41IiByPSIyLjEiLz4KICAgIDxjaXJjbGUgY2xhc3M9InN0MCIgY3g9IjE3LjYiIGN5PSIxMSIgcj0iMi4xIi8+CiAgPC9nPgo8L3N2Zz4K);
}

/* Icon CSS class declarations */

.jp-AddAboveIcon {
  background-image: var(--jp-icon-add-above);
}
.jp-AddBelowIcon {
  background-image: var(--jp-icon-add-below);
}
.jp-AddIcon {
  background-image: var(--jp-icon-add);
}
.jp-BellIcon {
  background-image: var(--jp-icon-bell);
}
.jp-BugDotIcon {
  background-image: var(--jp-icon-bug-dot);
}
.jp-BugIcon {
  background-image: var(--jp-icon-bug);
}
.jp-BuildIcon {
  background-image: var(--jp-icon-build);
}
.jp-CaretDownEmptyIcon {
  background-image: var(--jp-icon-caret-down-empty);
}
.jp-CaretDownEmptyThinIcon {
  background-image: var(--jp-icon-caret-down-empty-thin);
}
.jp-CaretDownIcon {
  background-image: var(--jp-icon-caret-down);
}
.jp-CaretLeftIcon {
  background-image: var(--jp-icon-caret-left);
}
.jp-CaretRightIcon {
  background-image: var(--jp-icon-caret-right);
}
.jp-CaretUpEmptyThinIcon {
  background-image: var(--jp-icon-caret-up-empty-thin);
}
.jp-CaretUpIcon {
  background-image: var(--jp-icon-caret-up);
}
.jp-CaseSensitiveIcon {
  background-image: var(--jp-icon-case-sensitive);
}
.jp-CheckIcon {
  background-image: var(--jp-icon-check);
}
.jp-CircleEmptyIcon {
  background-image: var(--jp-icon-circle-empty);
}
.jp-CircleIcon {
  background-image: var(--jp-icon-circle);
}
.jp-ClearIcon {
  background-image: var(--jp-icon-clear);
}
.jp-CloseIcon {
  background-image: var(--jp-icon-close);
}
.jp-CodeIcon {
  background-image: var(--jp-icon-code);
}
.jp-ConsoleIcon {
  background-image: var(--jp-icon-console);
}
.jp-CopyIcon {
  background-image: var(--jp-icon-copy);
}
.jp-CopyrightIcon {
  background-image: var(--jp-icon-copyright);
}
.jp-CutIcon {
  background-image: var(--jp-icon-cut);
}
.jp-DeleteIcon {
  background-image: var(--jp-icon-delete);
}
.jp-DownloadIcon {
  background-image: var(--jp-icon-download);
}
.jp-DuplicateIcon {
  background-image: var(--jp-icon-duplicate);
}
.jp-EditIcon {
  background-image: var(--jp-icon-edit);
}
.jp-EllipsesIcon {
  background-image: var(--jp-icon-ellipses);
}
.jp-ExtensionIcon {
  background-image: var(--jp-icon-extension);
}
.jp-FastForwardIcon {
  background-image: var(--jp-icon-fast-forward);
}
.jp-FileIcon {
  background-image: var(--jp-icon-file);
}
.jp-FileUploadIcon {
  background-image: var(--jp-icon-file-upload);
}
.jp-FilterListIcon {
  background-image: var(--jp-icon-filter-list);
}
.jp-FolderFavoriteIcon {
  background-image: var(--jp-icon-folder-favorite);
}
.jp-FolderIcon {
  background-image: var(--jp-icon-folder);
}
.jp-HomeIcon {
  background-image: var(--jp-icon-home);
}
.jp-Html5Icon {
  background-image: var(--jp-icon-html5);
}
.jp-ImageIcon {
  background-image: var(--jp-icon-image);
}
.jp-InspectorIcon {
  background-image: var(--jp-icon-inspector);
}
.jp-JsonIcon {
  background-image: var(--jp-icon-json);
}
.jp-JuliaIcon {
  background-image: var(--jp-icon-julia);
}
.jp-JupyterFaviconIcon {
  background-image: var(--jp-icon-jupyter-favicon);
}
.jp-JupyterIcon {
  background-image: var(--jp-icon-jupyter);
}
.jp-JupyterlabWordmarkIcon {
  background-image: var(--jp-icon-jupyterlab-wordmark);
}
.jp-KernelIcon {
  background-image: var(--jp-icon-kernel);
}
.jp-KeyboardIcon {
  background-image: var(--jp-icon-keyboard);
}
.jp-LaunchIcon {
  background-image: var(--jp-icon-launch);
}
.jp-LauncherIcon {
  background-image: var(--jp-icon-launcher);
}
.jp-LineFormIcon {
  background-image: var(--jp-icon-line-form);
}
.jp-LinkIcon {
  background-image: var(--jp-icon-link);
}
.jp-ListIcon {
  background-image: var(--jp-icon-list);
}
.jp-ListingsInfoIcon {
  background-image: var(--jp-icon-listings-info);
}
.jp-MarkdownIcon {
  background-image: var(--jp-icon-markdown);
}
.jp-MoveDownIcon {
  background-image: var(--jp-icon-move-down);
}
.jp-MoveUpIcon {
  background-image: var(--jp-icon-move-up);
}
.jp-NewFolderIcon {
  background-image: var(--jp-icon-new-folder);
}
.jp-NotTrustedIcon {
  background-image: var(--jp-icon-not-trusted);
}
.jp-NotebookIcon {
  background-image: var(--jp-icon-notebook);
}
.jp-NumberingIcon {
  background-image: var(--jp-icon-numbering);
}
.jp-OfflineBoltIcon {
  background-image: var(--jp-icon-offline-bolt);
}
.jp-PaletteIcon {
  background-image: var(--jp-icon-palette);
}
.jp-PasteIcon {
  background-image: var(--jp-icon-paste);
}
.jp-PdfIcon {
  background-image: var(--jp-icon-pdf);
}
.jp-PythonIcon {
  background-image: var(--jp-icon-python);
}
.jp-RKernelIcon {
  background-image: var(--jp-icon-r-kernel);
}
.jp-ReactIcon {
  background-image: var(--jp-icon-react);
}
.jp-RedoIcon {
  background-image: var(--jp-icon-redo);
}
.jp-RefreshIcon {
  background-image: var(--jp-icon-refresh);
}
.jp-RegexIcon {
  background-image: var(--jp-icon-regex);
}
.jp-RunIcon {
  background-image: var(--jp-icon-run);
}
.jp-RunningIcon {
  background-image: var(--jp-icon-running);
}
.jp-SaveIcon {
  background-image: var(--jp-icon-save);
}
.jp-SearchIcon {
  background-image: var(--jp-icon-search);
}
.jp-SettingsIcon {
  background-image: var(--jp-icon-settings);
}
.jp-ShareIcon {
  background-image: var(--jp-icon-share);
}
.jp-SpreadsheetIcon {
  background-image: var(--jp-icon-spreadsheet);
}
.jp-StopIcon {
  background-image: var(--jp-icon-stop);
}
.jp-TabIcon {
  background-image: var(--jp-icon-tab);
}
.jp-TableRowsIcon {
  background-image: var(--jp-icon-table-rows);
}
.jp-TagIcon {
  background-image: var(--jp-icon-tag);
}
.jp-TerminalIcon {
  background-image: var(--jp-icon-terminal);
}
.jp-TextEditorIcon {
  background-image: var(--jp-icon-text-editor);
}
.jp-TocIcon {
  background-image: var(--jp-icon-toc);
}
.jp-TreeViewIcon {
  background-image: var(--jp-icon-tree-view);
}
.jp-TrustedIcon {
  background-image: var(--jp-icon-trusted);
}
.jp-UndoIcon {
  background-image: var(--jp-icon-undo);
}
.jp-UserIcon {
  background-image: var(--jp-icon-user);
}
.jp-UsersIcon {
  background-image: var(--jp-icon-users);
}
.jp-VegaIcon {
  background-image: var(--jp-icon-vega);
}
.jp-YamlIcon {
  background-image: var(--jp-icon-yaml);
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/**
 * (DEPRECATED) Support for consuming icons as CSS background images
 */

.jp-Icon,
.jp-MaterialIcon {
  background-position: center;
  background-repeat: no-repeat;
  background-size: 16px;
  min-width: 16px;
  min-height: 16px;
}

.jp-Icon-cover {
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

/**
 * (DEPRECATED) Support for specific CSS icon sizes
 */

.jp-Icon-16 {
  background-size: 16px;
  min-width: 16px;
  min-height: 16px;
}

.jp-Icon-18 {
  background-size: 18px;
  min-width: 18px;
  min-height: 18px;
}

.jp-Icon-20 {
  background-size: 20px;
  min-width: 20px;
  min-height: 20px;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.lm-TabBar .lm-TabBar-addButton {
  align-items: center;
  display: flex;
  padding: 4px;
  padding-bottom: 5px;
  margin-right: 1px;
  background-color: var(--jp-layout-color2);
}

.lm-TabBar .lm-TabBar-addButton:hover {
  background-color: var(--jp-layout-color1);
}

.lm-DockPanel-tabBar .lm-TabBar-tab {
  width: var(--jp-private-horizontal-tab-width);
}

.lm-DockPanel-tabBar .lm-TabBar-content {
  flex: unset;
}

.lm-DockPanel-tabBar[data-orientation='horizontal'] {
  flex: 1 1 auto;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/**
 * Support for icons as inline SVG HTMLElements
 */

/* recolor the primary elements of an icon */
.jp-icon0[fill] {
  fill: var(--jp-inverse-layout-color0);
}
.jp-icon1[fill] {
  fill: var(--jp-inverse-layout-color1);
}
.jp-icon2[fill] {
  fill: var(--jp-inverse-layout-color2);
}
.jp-icon3[fill] {
  fill: var(--jp-inverse-layout-color3);
}
.jp-icon4[fill] {
  fill: var(--jp-inverse-layout-color4);
}

.jp-icon0[stroke] {
  stroke: var(--jp-inverse-layout-color0);
}
.jp-icon1[stroke] {
  stroke: var(--jp-inverse-layout-color1);
}
.jp-icon2[stroke] {
  stroke: var(--jp-inverse-layout-color2);
}
.jp-icon3[stroke] {
  stroke: var(--jp-inverse-layout-color3);
}
.jp-icon4[stroke] {
  stroke: var(--jp-inverse-layout-color4);
}
/* recolor the accent elements of an icon */
.jp-icon-accent0[fill] {
  fill: var(--jp-layout-color0);
}
.jp-icon-accent1[fill] {
  fill: var(--jp-layout-color1);
}
.jp-icon-accent2[fill] {
  fill: var(--jp-layout-color2);
}
.jp-icon-accent3[fill] {
  fill: var(--jp-layout-color3);
}
.jp-icon-accent4[fill] {
  fill: var(--jp-layout-color4);
}

.jp-icon-accent0[stroke] {
  stroke: var(--jp-layout-color0);
}
.jp-icon-accent1[stroke] {
  stroke: var(--jp-layout-color1);
}
.jp-icon-accent2[stroke] {
  stroke: var(--jp-layout-color2);
}
.jp-icon-accent3[stroke] {
  stroke: var(--jp-layout-color3);
}
.jp-icon-accent4[stroke] {
  stroke: var(--jp-layout-color4);
}
/* set the color of an icon to transparent */
.jp-icon-none[fill] {
  fill: none;
}

.jp-icon-none[stroke] {
  stroke: none;
}
/* brand icon colors. Same for light and dark */
.jp-icon-brand0[fill] {
  fill: var(--jp-brand-color0);
}
.jp-icon-brand1[fill] {
  fill: var(--jp-brand-color1);
}
.jp-icon-brand2[fill] {
  fill: var(--jp-brand-color2);
}
.jp-icon-brand3[fill] {
  fill: var(--jp-brand-color3);
}
.jp-icon-brand4[fill] {
  fill: var(--jp-brand-color4);
}

.jp-icon-brand0[stroke] {
  stroke: var(--jp-brand-color0);
}
.jp-icon-brand1[stroke] {
  stroke: var(--jp-brand-color1);
}
.jp-icon-brand2[stroke] {
  stroke: var(--jp-brand-color2);
}
.jp-icon-brand3[stroke] {
  stroke: var(--jp-brand-color3);
}
.jp-icon-brand4[stroke] {
  stroke: var(--jp-brand-color4);
}
/* warn icon colors. Same for light and dark */
.jp-icon-warn0[fill] {
  fill: var(--jp-warn-color0);
}
.jp-icon-warn1[fill] {
  fill: var(--jp-warn-color1);
}
.jp-icon-warn2[fill] {
  fill: var(--jp-warn-color2);
}
.jp-icon-warn3[fill] {
  fill: var(--jp-warn-color3);
}

.jp-icon-warn0[stroke] {
  stroke: var(--jp-warn-color0);
}
.jp-icon-warn1[stroke] {
  stroke: var(--jp-warn-color1);
}
.jp-icon-warn2[stroke] {
  stroke: var(--jp-warn-color2);
}
.jp-icon-warn3[stroke] {
  stroke: var(--jp-warn-color3);
}
/* icon colors that contrast well with each other and most backgrounds */
.jp-icon-contrast0[fill] {
  fill: var(--jp-icon-contrast-color0);
}
.jp-icon-contrast1[fill] {
  fill: var(--jp-icon-contrast-color1);
}
.jp-icon-contrast2[fill] {
  fill: var(--jp-icon-contrast-color2);
}
.jp-icon-contrast3[fill] {
  fill: var(--jp-icon-contrast-color3);
}

.jp-icon-contrast0[stroke] {
  stroke: var(--jp-icon-contrast-color0);
}
.jp-icon-contrast1[stroke] {
  stroke: var(--jp-icon-contrast-color1);
}
.jp-icon-contrast2[stroke] {
  stroke: var(--jp-icon-contrast-color2);
}
.jp-icon-contrast3[stroke] {
  stroke: var(--jp-icon-contrast-color3);
}

.jp-jupyter-icon-color[fill] {
  fill: var(--jp-jupyter-icon-color, var(--jp-warn-color0));
}

.jp-notebook-icon-color[fill] {
  fill: var(--jp-notebook-icon-color, var(--jp-warn-color0));
}

.jp-json-icon-color[fill] {
  fill: var(--jp-json-icon-color, var(--jp-warn-color1));
}

.jp-console-icon-color[fill] {
  fill: var(--jp-console-icon-color, white);
}

.jp-console-icon-background-color[fill] {
  fill: var(--jp-console-icon-background-color, var(--jp-brand-color1));
}

.jp-terminal-icon-color[fill] {
  fill: var(--jp-terminal-icon-color, var(--jp-layout-color2));
}

.jp-terminal-icon-background-color[fill] {
  fill: var(--jp-terminal-icon-background-color, var(--jp-inverse-layout2));
}

.jp-text-editor-icon-color[fill] {
  fill: var(--jp-text-editor-icon-color, var(--jp-inverse-layout3));
}

.jp-inspector-icon-color[fill] {
  fill: var(--jp-inspector-icon-color, var(--jp-inverse-layout3));
}

/* CSS for icons in selected filebrowser listing items */
.jp-DirListing-item.jp-mod-selected .jp-icon-selectable[fill] {
  fill: #fff;
}
.jp-DirListing-item.jp-mod-selected .jp-icon-selectable-inverse[fill] {
  fill: var(--jp-brand-color1);
}

/* CSS for icons in selected tabs in the sidebar tab manager */
#tab-manager .lm-TabBar-tab.jp-mod-active .jp-icon-selectable[fill] {
  fill: #fff;
}

#tab-manager .lm-TabBar-tab.jp-mod-active .jp-icon-selectable-inverse[fill] {
  fill: var(--jp-brand-color1);
}
#tab-manager
  .lm-TabBar-tab.jp-mod-active
  .jp-icon-hover
  :hover
  .jp-icon-selectable[fill] {
  fill: var(--jp-brand-color1);
}

#tab-manager
  .lm-TabBar-tab.jp-mod-active
  .jp-icon-hover
  :hover
  .jp-icon-selectable-inverse[fill] {
  fill: #fff;
}

/**
 * TODO: come up with non css-hack solution for showing the busy icon on top
 *  of the close icon
 * CSS for complex behavior of close icon of tabs in the sidebar tab manager
 */
#tab-manager
  .lm-TabBar-tab.jp-mod-dirty
  > .lm-TabBar-tabCloseIcon
  > :not(:hover)
  > .jp-icon3[fill] {
  fill: none;
}
#tab-manager
  .lm-TabBar-tab.jp-mod-dirty
  > .lm-TabBar-tabCloseIcon
  > :not(:hover)
  > .jp-icon-busy[fill] {
  fill: var(--jp-inverse-layout-color3);
}

#tab-manager
  .lm-TabBar-tab.jp-mod-dirty.jp-mod-active
  > .lm-TabBar-tabCloseIcon
  > :not(:hover)
  > .jp-icon-busy[fill] {
  fill: #fff;
}

/**
* TODO: come up with non css-hack solution for showing the busy icon on top
*  of the close icon
* CSS for complex behavior of close icon of tabs in the main area tabbar
*/
.lm-DockPanel-tabBar
  .lm-TabBar-tab.lm-mod-closable.jp-mod-dirty
  > .lm-TabBar-tabCloseIcon
  > :not(:hover)
  > .jp-icon3[fill] {
  fill: none;
}
.lm-DockPanel-tabBar
  .lm-TabBar-tab.lm-mod-closable.jp-mod-dirty
  > .lm-TabBar-tabCloseIcon
  > :not(:hover)
  > .jp-icon-busy[fill] {
  fill: var(--jp-inverse-layout-color3);
}

/* CSS for icons in status bar */
#jp-main-statusbar .jp-mod-selected .jp-icon-selectable[fill] {
  fill: #fff;
}

#jp-main-statusbar .jp-mod-selected .jp-icon-selectable-inverse[fill] {
  fill: var(--jp-brand-color1);
}
/* special handling for splash icon CSS. While the theme CSS reloads during
   splash, the splash icon can loose theming. To prevent that, we set a
   default for its color variable */
:root {
  --jp-warn-color0: var(--md-orange-700);
}

/* not sure what to do with this one, used in filebrowser listing */
.jp-DragIcon {
  margin-right: 4px;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/**
 * Support for alt colors for icons as inline SVG HTMLElements
 */

/* alt recolor the primary elements of an icon */
.jp-icon-alt .jp-icon0[fill] {
  fill: var(--jp-layout-color0);
}
.jp-icon-alt .jp-icon1[fill] {
  fill: var(--jp-layout-color1);
}
.jp-icon-alt .jp-icon2[fill] {
  fill: var(--jp-layout-color2);
}
.jp-icon-alt .jp-icon3[fill] {
  fill: var(--jp-layout-color3);
}
.jp-icon-alt .jp-icon4[fill] {
  fill: var(--jp-layout-color4);
}

.jp-icon-alt .jp-icon0[stroke] {
  stroke: var(--jp-layout-color0);
}
.jp-icon-alt .jp-icon1[stroke] {
  stroke: var(--jp-layout-color1);
}
.jp-icon-alt .jp-icon2[stroke] {
  stroke: var(--jp-layout-color2);
}
.jp-icon-alt .jp-icon3[stroke] {
  stroke: var(--jp-layout-color3);
}
.jp-icon-alt .jp-icon4[stroke] {
  stroke: var(--jp-layout-color4);
}

/* alt recolor the accent elements of an icon */
.jp-icon-alt .jp-icon-accent0[fill] {
  fill: var(--jp-inverse-layout-color0);
}
.jp-icon-alt .jp-icon-accent1[fill] {
  fill: var(--jp-inverse-layout-color1);
}
.jp-icon-alt .jp-icon-accent2[fill] {
  fill: var(--jp-inverse-layout-color2);
}
.jp-icon-alt .jp-icon-accent3[fill] {
  fill: var(--jp-inverse-layout-color3);
}
.jp-icon-alt .jp-icon-accent4[fill] {
  fill: var(--jp-inverse-layout-color4);
}

.jp-icon-alt .jp-icon-accent0[stroke] {
  stroke: var(--jp-inverse-layout-color0);
}
.jp-icon-alt .jp-icon-accent1[stroke] {
  stroke: var(--jp-inverse-layout-color1);
}
.jp-icon-alt .jp-icon-accent2[stroke] {
  stroke: var(--jp-inverse-layout-color2);
}
.jp-icon-alt .jp-icon-accent3[stroke] {
  stroke: var(--jp-inverse-layout-color3);
}
.jp-icon-alt .jp-icon-accent4[stroke] {
  stroke: var(--jp-inverse-layout-color4);
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-icon-hoverShow:not(:hover) .jp-icon-hoverShow-content {
  display: none !important;
}

/**
 * Support for hover colors for icons as inline SVG HTMLElements
 */

/**
 * regular colors
 */

/* recolor the primary elements of an icon */
.jp-icon-hover :hover .jp-icon0-hover[fill] {
  fill: var(--jp-inverse-layout-color0);
}
.jp-icon-hover :hover .jp-icon1-hover[fill] {
  fill: var(--jp-inverse-layout-color1);
}
.jp-icon-hover :hover .jp-icon2-hover[fill] {
  fill: var(--jp-inverse-layout-color2);
}
.jp-icon-hover :hover .jp-icon3-hover[fill] {
  fill: var(--jp-inverse-layout-color3);
}
.jp-icon-hover :hover .jp-icon4-hover[fill] {
  fill: var(--jp-inverse-layout-color4);
}

.jp-icon-hover :hover .jp-icon0-hover[stroke] {
  stroke: var(--jp-inverse-layout-color0);
}
.jp-icon-hover :hover .jp-icon1-hover[stroke] {
  stroke: var(--jp-inverse-layout-color1);
}
.jp-icon-hover :hover .jp-icon2-hover[stroke] {
  stroke: var(--jp-inverse-layout-color2);
}
.jp-icon-hover :hover .jp-icon3-hover[stroke] {
  stroke: var(--jp-inverse-layout-color3);
}
.jp-icon-hover :hover .jp-icon4-hover[stroke] {
  stroke: var(--jp-inverse-layout-color4);
}

/* recolor the accent elements of an icon */
.jp-icon-hover :hover .jp-icon-accent0-hover[fill] {
  fill: var(--jp-layout-color0);
}
.jp-icon-hover :hover .jp-icon-accent1-hover[fill] {
  fill: var(--jp-layout-color1);
}
.jp-icon-hover :hover .jp-icon-accent2-hover[fill] {
  fill: var(--jp-layout-color2);
}
.jp-icon-hover :hover .jp-icon-accent3-hover[fill] {
  fill: var(--jp-layout-color3);
}
.jp-icon-hover :hover .jp-icon-accent4-hover[fill] {
  fill: var(--jp-layout-color4);
}

.jp-icon-hover :hover .jp-icon-accent0-hover[stroke] {
  stroke: var(--jp-layout-color0);
}
.jp-icon-hover :hover .jp-icon-accent1-hover[stroke] {
  stroke: var(--jp-layout-color1);
}
.jp-icon-hover :hover .jp-icon-accent2-hover[stroke] {
  stroke: var(--jp-layout-color2);
}
.jp-icon-hover :hover .jp-icon-accent3-hover[stroke] {
  stroke: var(--jp-layout-color3);
}
.jp-icon-hover :hover .jp-icon-accent4-hover[stroke] {
  stroke: var(--jp-layout-color4);
}

/* set the color of an icon to transparent */
.jp-icon-hover :hover .jp-icon-none-hover[fill] {
  fill: none;
}

.jp-icon-hover :hover .jp-icon-none-hover[stroke] {
  stroke: none;
}

/**
 * inverse colors
 */

/* inverse recolor the primary elements of an icon */
.jp-icon-hover.jp-icon-alt :hover .jp-icon0-hover[fill] {
  fill: var(--jp-layout-color0);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon1-hover[fill] {
  fill: var(--jp-layout-color1);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon2-hover[fill] {
  fill: var(--jp-layout-color2);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon3-hover[fill] {
  fill: var(--jp-layout-color3);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon4-hover[fill] {
  fill: var(--jp-layout-color4);
}

.jp-icon-hover.jp-icon-alt :hover .jp-icon0-hover[stroke] {
  stroke: var(--jp-layout-color0);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon1-hover[stroke] {
  stroke: var(--jp-layout-color1);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon2-hover[stroke] {
  stroke: var(--jp-layout-color2);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon3-hover[stroke] {
  stroke: var(--jp-layout-color3);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon4-hover[stroke] {
  stroke: var(--jp-layout-color4);
}

/* inverse recolor the accent elements of an icon */
.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent0-hover[fill] {
  fill: var(--jp-inverse-layout-color0);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent1-hover[fill] {
  fill: var(--jp-inverse-layout-color1);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent2-hover[fill] {
  fill: var(--jp-inverse-layout-color2);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent3-hover[fill] {
  fill: var(--jp-inverse-layout-color3);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent4-hover[fill] {
  fill: var(--jp-inverse-layout-color4);
}

.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent0-hover[stroke] {
  stroke: var(--jp-inverse-layout-color0);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent1-hover[stroke] {
  stroke: var(--jp-inverse-layout-color1);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent2-hover[stroke] {
  stroke: var(--jp-inverse-layout-color2);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent3-hover[stroke] {
  stroke: var(--jp-inverse-layout-color3);
}
.jp-icon-hover.jp-icon-alt :hover .jp-icon-accent4-hover[stroke] {
  stroke: var(--jp-inverse-layout-color4);
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-switch {
  display: flex;
  align-items: center;
  padding-left: 4px;
  padding-right: 4px;
  font-size: var(--jp-ui-font-size1);
  background-color: transparent;
  color: var(--jp-ui-font-color1);
  border: none;
  height: 20px;
}

.jp-switch:hover {
  background-color: var(--jp-layout-color2);
}

.jp-switch-label {
  margin-right: 5px;
}

.jp-switch-track {
  cursor: pointer;
  background-color: var(--jp-switch-color, var(--jp-border-color1));
  -webkit-transition: 0.4s;
  transition: 0.4s;
  border-radius: 34px;
  height: 16px;
  width: 35px;
  position: relative;
}

.jp-switch-track::before {
  content: '';
  position: absolute;
  height: 10px;
  width: 10px;
  margin: 3px;
  left: 0px;
  background-color: var(--jp-ui-inverse-font-color1);
  -webkit-transition: 0.4s;
  transition: 0.4s;
  border-radius: 50%;
}

.jp-switch[aria-checked='true'] .jp-switch-track {
  background-color: var(--jp-switch-true-position-color, var(--jp-warn-color0));
}

.jp-switch[aria-checked='true'] .jp-switch-track::before {
  /* track width (35) - margins (3 + 3) - thumb width (10) */
  left: 19px;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/* Sibling imports */

/* Override Blueprint's _reset.scss styles */
html {
  box-sizing: unset;
}

*,
*::before,
*::after {
  box-sizing: unset;
}

body {
  color: unset;
  font-family: var(--jp-ui-font-family);
}

p {
  margin-top: unset;
  margin-bottom: unset;
}

small {
  font-size: unset;
}

strong {
  font-weight: unset;
}

/* Override Blueprint's _typography.scss styles */
a {
  text-decoration: unset;
  color: unset;
}
a:hover {
  text-decoration: unset;
  color: unset;
}

/* Override Blueprint's _accessibility.scss styles */
:focus {
  outline: unset;
  outline-offset: unset;
  -moz-outline-radius: unset;
}

/* Styles for ui-components */
.jp-Button {
  border-radius: var(--jp-border-radius);
  padding: 0px 12px;
  font-size: var(--jp-ui-font-size1);
}

/* Use our own theme for hover styles */
button.jp-Button.bp3-button.bp3-minimal:hover {
  background-color: var(--jp-layout-color2);
}
.jp-Button.minimal {
  color: unset !important;
}

.jp-Button.jp-ToolbarButtonComponent {
  text-transform: none;
}

.jp-InputGroup input {
  box-sizing: border-box;
  border-radius: 0;
  background-color: transparent;
  color: var(--jp-ui-font-color0);
  box-shadow: inset 0 0 0 var(--jp-border-width) var(--jp-input-border-color);
}

.jp-InputGroup input:focus {
  box-shadow: inset 0 0 0 var(--jp-border-width)
      var(--jp-input-active-box-shadow-color),
    inset 0 0 0 3px var(--jp-input-active-box-shadow-color);
}

.jp-InputGroup input::placeholder,
input::placeholder {
  color: var(--jp-ui-font-color3);
}

.jp-BPIcon {
  display: inline-block;
  vertical-align: middle;
  margin: auto;
}

/* Stop blueprint futzing with our icon fills */
.bp3-icon.jp-BPIcon > svg:not([fill]) {
  fill: var(--jp-inverse-layout-color3);
}

.jp-InputGroupAction {
  padding: 6px;
}

.jp-HTMLSelect.jp-DefaultStyle select {
  background-color: initial;
  border: none;
  border-radius: 0;
  box-shadow: none;
  color: var(--jp-ui-font-color0);
  display: block;
  font-size: var(--jp-ui-font-size1);
  height: 24px;
  line-height: 14px;
  padding: 0 25px 0 10px;
  text-align: left;
  -moz-appearance: none;
  -webkit-appearance: none;
}

/* Use our own theme for hover and option styles */
.jp-HTMLSelect.jp-DefaultStyle select:hover,
.jp-HTMLSelect.jp-DefaultStyle select > option {
  background-color: var(--jp-layout-color2);
  color: var(--jp-ui-font-color0);
}
select {
  box-sizing: border-box;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-Collapse {
  display: flex;
  flex-direction: column;
  align-items: stretch;
  border-top: 1px solid var(--jp-border-color2);
  border-bottom: 1px solid var(--jp-border-color2);
}

.jp-Collapse-header {
  padding: 1px 12px;
  color: var(--jp-ui-font-color1);
  background-color: var(--jp-layout-color1);
  font-size: var(--jp-ui-font-size2);
}

.jp-Collapse-header:hover {
  background-color: var(--jp-layout-color2);
}

.jp-Collapse-contents {
  padding: 0px 12px 0px 12px;
  background-color: var(--jp-layout-color1);
  color: var(--jp-ui-font-color1);
  overflow: auto;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Variables
|----------------------------------------------------------------------------*/

:root {
  --jp-private-commandpalette-search-height: 28px;
}

/*-----------------------------------------------------------------------------
| Overall styles
|----------------------------------------------------------------------------*/

.lm-CommandPalette {
  padding-bottom: 0px;
  color: var(--jp-ui-font-color1);
  background: var(--jp-layout-color1);
  /* This is needed so that all font sizing of children done in ems is
   * relative to this base size */
  font-size: var(--jp-ui-font-size1);
}

/*-----------------------------------------------------------------------------
| Modal variant
|----------------------------------------------------------------------------*/

.jp-ModalCommandPalette {
  position: absolute;
  z-index: 10000;
  top: 38px;
  left: 30%;
  margin: 0;
  padding: 4px;
  width: 40%;
  box-shadow: var(--jp-elevation-z4);
  border-radius: 4px;
  background: var(--jp-layout-color0);
}

.jp-ModalCommandPalette .lm-CommandPalette {
  max-height: 40vh;
}

.jp-ModalCommandPalette .lm-CommandPalette .lm-close-icon::after {
  display: none;
}

.jp-ModalCommandPalette .lm-CommandPalette .lm-CommandPalette-header {
  display: none;
}

.jp-ModalCommandPalette .lm-CommandPalette .lm-CommandPalette-item {
  margin-left: 4px;
  margin-right: 4px;
}

.jp-ModalCommandPalette
  .lm-CommandPalette
  .lm-CommandPalette-item.lm-mod-disabled {
  display: none;
}

/*-----------------------------------------------------------------------------
| Search
|----------------------------------------------------------------------------*/

.lm-CommandPalette-search {
  padding: 4px;
  background-color: var(--jp-layout-color1);
  z-index: 2;
}

.lm-CommandPalette-wrapper {
  overflow: overlay;
  padding: 0px 9px;
  background-color: var(--jp-input-active-background);
  height: 30px;
  box-shadow: inset 0 0 0 var(--jp-border-width) var(--jp-input-border-color);
}

.lm-CommandPalette.lm-mod-focused .lm-CommandPalette-wrapper {
  box-shadow: inset 0 0 0 1px var(--jp-input-active-box-shadow-color),
    inset 0 0 0 3px var(--jp-input-active-box-shadow-color);
}

.jp-SearchIconGroup {
  color: white;
  background-color: var(--jp-brand-color1);
  position: absolute;
  top: 4px;
  right: 4px;
  padding: 5px 5px 1px 5px;
}

.jp-SearchIconGroup svg {
  height: 20px;
  width: 20px;
}

.jp-SearchIconGroup .jp-icon3[fill] {
  fill: var(--jp-layout-color0);
}

.lm-CommandPalette-input {
  background: transparent;
  width: calc(100% - 18px);
  float: left;
  border: none;
  outline: none;
  font-size: var(--jp-ui-font-size1);
  color: var(--jp-ui-font-color0);
  line-height: var(--jp-private-commandpalette-search-height);
}

.lm-CommandPalette-input::-webkit-input-placeholder,
.lm-CommandPalette-input::-moz-placeholder,
.lm-CommandPalette-input:-ms-input-placeholder {
  color: var(--jp-ui-font-color2);
  font-size: var(--jp-ui-font-size1);
}

/*-----------------------------------------------------------------------------
| Results
|----------------------------------------------------------------------------*/

.lm-CommandPalette-header:first-child {
  margin-top: 0px;
}

.lm-CommandPalette-header {
  border-bottom: solid var(--jp-border-width) var(--jp-border-color2);
  color: var(--jp-ui-font-color1);
  cursor: pointer;
  display: flex;
  font-size: var(--jp-ui-font-size0);
  font-weight: 600;
  letter-spacing: 1px;
  margin-top: 8px;
  padding: 8px 0 8px 12px;
  text-transform: uppercase;
}

.lm-CommandPalette-header.lm-mod-active {
  background: var(--jp-layout-color2);
}

.lm-CommandPalette-header > mark {
  background-color: transparent;
  font-weight: bold;
  color: var(--jp-ui-font-color1);
}

.lm-CommandPalette-item {
  padding: 4px 12px 4px 4px;
  color: var(--jp-ui-font-color1);
  font-size: var(--jp-ui-font-size1);
  font-weight: 400;
  display: flex;
}

.lm-CommandPalette-item.lm-mod-disabled {
  color: var(--jp-ui-font-color2);
}

.lm-CommandPalette-item.lm-mod-active {
  color: var(--jp-ui-inverse-font-color1);
  background: var(--jp-brand-color1);
}

.lm-CommandPalette-item.lm-mod-active .lm-CommandPalette-itemLabel > mark {
  color: var(--jp-ui-inverse-font-color0);
}

.lm-CommandPalette-item.lm-mod-active .jp-icon-selectable[fill] {
  fill: var(--jp-layout-color0);
}

.lm-CommandPalette-item.lm-mod-active .lm-CommandPalette-itemLabel > mark {
  color: var(--jp-ui-inverse-font-color0);
}

.lm-CommandPalette-item.lm-mod-active:hover:not(.lm-mod-disabled) {
  color: var(--jp-ui-inverse-font-color1);
  background: var(--jp-brand-color1);
}

.lm-CommandPalette-item:hover:not(.lm-mod-active):not(.lm-mod-disabled) {
  background: var(--jp-layout-color2);
}

.lm-CommandPalette-itemContent {
  overflow: hidden;
}

.lm-CommandPalette-itemLabel > mark {
  color: var(--jp-ui-font-color0);
  background-color: transparent;
  font-weight: bold;
}

.lm-CommandPalette-item.lm-mod-disabled mark {
  color: var(--jp-ui-font-color2);
}

.lm-CommandPalette-item .lm-CommandPalette-itemIcon {
  margin: 0 4px 0 0;
  position: relative;
  width: 16px;
  top: 2px;
  flex: 0 0 auto;
}

.lm-CommandPalette-item.lm-mod-disabled .lm-CommandPalette-itemIcon {
  opacity: 0.6;
}

.lm-CommandPalette-item .lm-CommandPalette-itemShortcut {
  flex: 0 0 auto;
}

.lm-CommandPalette-itemCaption {
  display: none;
}

.lm-CommandPalette-content {
  background-color: var(--jp-layout-color1);
}

.lm-CommandPalette-content:empty:after {
  content: 'No results';
  margin: auto;
  margin-top: 20px;
  width: 100px;
  display: block;
  font-size: var(--jp-ui-font-size2);
  font-family: var(--jp-ui-font-family);
  font-weight: lighter;
}

.lm-CommandPalette-emptyMessage {
  text-align: center;
  margin-top: 24px;
  line-height: 1.32;
  padding: 0px 8px;
  color: var(--jp-content-font-color3);
}

/*-----------------------------------------------------------------------------
| Copyright (c) 2014-2017, Jupyter Development Team.
|
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-Dialog {
  position: absolute;
  z-index: 10000;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  top: 0px;
  left: 0px;
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  background: var(--jp-dialog-background);
}

.jp-Dialog-content {
  display: flex;
  flex-direction: column;
  margin-left: auto;
  margin-right: auto;
  background: var(--jp-layout-color1);
  padding: 24px 24px 12px 24px;
  min-width: 300px;
  min-height: 150px;
  max-width: 1000px;
  max-height: 500px;
  box-sizing: border-box;
  box-shadow: var(--jp-elevation-z20);
  word-wrap: break-word;
  border-radius: var(--jp-border-radius);
  /* This is needed so that all font sizing of children done in ems is
   * relative to this base size */
  font-size: var(--jp-ui-font-size1);
  color: var(--jp-ui-font-color1);
  resize: both;
}

.jp-Dialog-content.jp-Dialog-content-small {
  max-width: 500px;
}

.jp-Dialog-button {
  overflow: visible;
}

button.jp-Dialog-button:focus {
  outline: 1px solid var(--jp-brand-color1);
  outline-offset: 4px;
  -moz-outline-radius: 0px;
}

button.jp-Dialog-button:focus::-moz-focus-inner {
  border: 0;
}

button.jp-Dialog-button.jp-mod-styled.jp-mod-accept:focus,
button.jp-Dialog-button.jp-mod-styled.jp-mod-warn:focus,
button.jp-Dialog-button.jp-mod-styled.jp-mod-reject:focus {
  outline-offset: 4px;
  -moz-outline-radius: 0px;
}

button.jp-Dialog-button.jp-mod-styled.jp-mod-accept:focus {
  outline: 1px solid var(--md-blue-700);
}

button.jp-Dialog-button.jp-mod-styled.jp-mod-warn:focus {
  outline: 1px solid var(--md-red-600);
}

button.jp-Dialog-button.jp-mod-styled.jp-mod-reject:focus {
  outline: 1px solid var(--md-grey-700);
}

button.jp-Dialog-close-button {
  padding: 0;
  height: 100%;
  min-width: unset;
  min-height: unset;
}

.jp-Dialog-header {
  display: flex;
  justify-content: space-between;
  flex: 0 0 auto;
  padding-bottom: 12px;
  font-size: var(--jp-ui-font-size3);
  font-weight: 400;
  color: var(--jp-ui-font-color0);
}

.jp-Dialog-body {
  display: flex;
  flex-direction: column;
  flex: 1 1 auto;
  font-size: var(--jp-ui-font-size1);
  background: var(--jp-layout-color1);
  overflow: auto;
}

.jp-Dialog-footer {
  display: flex;
  flex-direction: row;
  justify-content: flex-end;
  align-items: center;
  flex: 0 0 auto;
  margin-left: -12px;
  margin-right: -12px;
  padding: 12px;
}

.jp-Dialog-checkbox {
  padding-right: 5px;
}

.jp-Dialog-checkbox > input:focus-visible {
  outline: 1px solid var(--jp-input-active-border-color);
  outline-offset: 1px;
}

.jp-Dialog-spacer {
  flex: 1 1 auto;
}

.jp-Dialog-title {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.jp-Dialog-body > .jp-select-wrapper {
  width: 100%;
}

.jp-Dialog-body > button {
  padding: 0px 16px;
}

.jp-Dialog-body > label {
  line-height: 1.4;
  color: var(--jp-ui-font-color0);
}

.jp-Dialog-button.jp-mod-styled:not(:last-child) {
  margin-right: 12px;
}

/*-----------------------------------------------------------------------------
| Copyright (c) 2014-2016, Jupyter Development Team.
|
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-HoverBox {
  position: fixed;
}

.jp-HoverBox.jp-mod-outofview {
  display: none;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-IFrame {
  width: 100%;
  height: 100%;
}

.jp-IFrame > iframe {
  border: none;
}

/*
When drag events occur, `p-mod-override-cursor` is added to the body.
Because iframes steal all cursor events, the following two rules are necessary
to suppress pointer events while resize drags are occurring. There may be a
better solution to this problem.
*/
body.lm-mod-override-cursor .jp-IFrame {
  position: relative;
}

body.lm-mod-override-cursor .jp-IFrame:before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: transparent;
}

.jp-Input-Boolean-Dialog {
  flex-direction: row-reverse;
  align-items: end;
  width: 100%;
}

.jp-Input-Boolean-Dialog > label {
  flex: 1 1 auto;
}

/*-----------------------------------------------------------------------------
| Copyright (c) 2014-2016, Jupyter Development Team.
|
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-MainAreaWidget > :focus {
  outline: none;
}

.jp-MainAreaWidget .jp-MainAreaWidget-error {
  padding: 6px;
}

.jp-MainAreaWidget .jp-MainAreaWidget-error > pre {
  width: auto;
  padding: 10px;
  background: var(--jp-error-color3);
  border: var(--jp-border-width) solid var(--jp-error-color1);
  border-radius: var(--jp-border-radius);
  color: var(--jp-ui-font-color1);
  font-size: var(--jp-ui-font-size1);
  white-space: pre-wrap;
  word-wrap: break-word;
}

.jp-MainAreaWidget {
  contain: strict;
}

/**
 * google-material-color v1.2.6
 * https://github.com/danlevan/google-material-color
 */
:root {
  --md-red-50: #ffebee;
  --md-red-100: #ffcdd2;
  --md-red-200: #ef9a9a;
  --md-red-300: #e57373;
  --md-red-400: #ef5350;
  --md-red-500: #f44336;
  --md-red-600: #e53935;
  --md-red-700: #d32f2f;
  --md-red-800: #c62828;
  --md-red-900: #b71c1c;
  --md-red-A100: #ff8a80;
  --md-red-A200: #ff5252;
  --md-red-A400: #ff1744;
  --md-red-A700: #d50000;

  --md-pink-50: #fce4ec;
  --md-pink-100: #f8bbd0;
  --md-pink-200: #f48fb1;
  --md-pink-300: #f06292;
  --md-pink-400: #ec407a;
  --md-pink-500: #e91e63;
  --md-pink-600: #d81b60;
  --md-pink-700: #c2185b;
  --md-pink-800: #ad1457;
  --md-pink-900: #880e4f;
  --md-pink-A100: #ff80ab;
  --md-pink-A200: #ff4081;
  --md-pink-A400: #f50057;
  --md-pink-A700: #c51162;

  --md-purple-50: #f3e5f5;
  --md-purple-100: #e1bee7;
  --md-purple-200: #ce93d8;
  --md-purple-300: #ba68c8;
  --md-purple-400: #ab47bc;
  --md-purple-500: #9c27b0;
  --md-purple-600: #8e24aa;
  --md-purple-700: #7b1fa2;
  --md-purple-800: #6a1b9a;
  --md-purple-900: #4a148c;
  --md-purple-A100: #ea80fc;
  --md-purple-A200: #e040fb;
  --md-purple-A400: #d500f9;
  --md-purple-A700: #aa00ff;

  --md-deep-purple-50: #ede7f6;
  --md-deep-purple-100: #d1c4e9;
  --md-deep-purple-200: #b39ddb;
  --md-deep-purple-300: #9575cd;
  --md-deep-purple-400: #7e57c2;
  --md-deep-purple-500: #673ab7;
  --md-deep-purple-600: #5e35b1;
  --md-deep-purple-700: #512da8;
  --md-deep-purple-800: #4527a0;
  --md-deep-purple-900: #311b92;
  --md-deep-purple-A100: #b388ff;
  --md-deep-purple-A200: #7c4dff;
  --md-deep-purple-A400: #651fff;
  --md-deep-purple-A700: #6200ea;

  --md-indigo-50: #e8eaf6;
  --md-indigo-100: #c5cae9;
  --md-indigo-200: #9fa8da;
  --md-indigo-300: #7986cb;
  --md-indigo-400: #5c6bc0;
  --md-indigo-500: #3f51b5;
  --md-indigo-600: #3949ab;
  --md-indigo-700: #303f9f;
  --md-indigo-800: #283593;
  --md-indigo-900: #1a237e;
  --md-indigo-A100: #8c9eff;
  --md-indigo-A200: #536dfe;
  --md-indigo-A400: #3d5afe;
  --md-indigo-A700: #304ffe;

  --md-blue-50: #e3f2fd;
  --md-blue-100: #bbdefb;
  --md-blue-200: #90caf9;
  --md-blue-300: #64b5f6;
  --md-blue-400: #42a5f5;
  --md-blue-500: #2196f3;
  --md-blue-600: #1e88e5;
  --md-blue-700: #1976d2;
  --md-blue-800: #1565c0;
  --md-blue-900: #0d47a1;
  --md-blue-A100: #82b1ff;
  --md-blue-A200: #448aff;
  --md-blue-A400: #2979ff;
  --md-blue-A700: #2962ff;

  --md-light-blue-50: #e1f5fe;
  --md-light-blue-100: #b3e5fc;
  --md-light-blue-200: #81d4fa;
  --md-light-blue-300: #4fc3f7;
  --md-light-blue-400: #29b6f6;
  --md-light-blue-500: #03a9f4;
  --md-light-blue-600: #039be5;
  --md-light-blue-700: #0288d1;
  --md-light-blue-800: #0277bd;
  --md-light-blue-900: #01579b;
  --md-light-blue-A100: #80d8ff;
  --md-light-blue-A200: #40c4ff;
  --md-light-blue-A400: #00b0ff;
  --md-light-blue-A700: #0091ea;

  --md-cyan-50: #e0f7fa;
  --md-cyan-100: #b2ebf2;
  --md-cyan-200: #80deea;
  --md-cyan-300: #4dd0e1;
  --md-cyan-400: #26c6da;
  --md-cyan-500: #00bcd4;
  --md-cyan-600: #00acc1;
  --md-cyan-700: #0097a7;
  --md-cyan-800: #00838f;
  --md-cyan-900: #006064;
  --md-cyan-A100: #84ffff;
  --md-cyan-A200: #18ffff;
  --md-cyan-A400: #00e5ff;
  --md-cyan-A700: #00b8d4;

  --md-teal-50: #e0f2f1;
  --md-teal-100: #b2dfdb;
  --md-teal-200: #80cbc4;
  --md-teal-300: #4db6ac;
  --md-teal-400: #26a69a;
  --md-teal-500: #009688;
  --md-teal-600: #00897b;
  --md-teal-700: #00796b;
  --md-teal-800: #00695c;
  --md-teal-900: #004d40;
  --md-teal-A100: #a7ffeb;
  --md-teal-A200: #64ffda;
  --md-teal-A400: #1de9b6;
  --md-teal-A700: #00bfa5;

  --md-green-50: #e8f5e9;
  --md-green-100: #c8e6c9;
  --md-green-200: #a5d6a7;
  --md-green-300: #81c784;
  --md-green-400: #66bb6a;
  --md-green-500: #4caf50;
  --md-green-600: #43a047;
  --md-green-700: #388e3c;
  --md-green-800: #2e7d32;
  --md-green-900: #1b5e20;
  --md-green-A100: #b9f6ca;
  --md-green-A200: #69f0ae;
  --md-green-A400: #00e676;
  --md-green-A700: #00c853;

  --md-light-green-50: #f1f8e9;
  --md-light-green-100: #dcedc8;
  --md-light-green-200: #c5e1a5;
  --md-light-green-300: #aed581;
  --md-light-green-400: #9ccc65;
  --md-light-green-500: #8bc34a;
  --md-light-green-600: #7cb342;
  --md-light-green-700: #689f38;
  --md-light-green-800: #558b2f;
  --md-light-green-900: #33691e;
  --md-light-green-A100: #ccff90;
  --md-light-green-A200: #b2ff59;
  --md-light-green-A400: #76ff03;
  --md-light-green-A700: #64dd17;

  --md-lime-50: #f9fbe7;
  --md-lime-100: #f0f4c3;
  --md-lime-200: #e6ee9c;
  --md-lime-300: #dce775;
  --md-lime-400: #d4e157;
  --md-lime-500: #cddc39;
  --md-lime-600: #c0ca33;
  --md-lime-700: #afb42b;
  --md-lime-800: #9e9d24;
  --md-lime-900: #827717;
  --md-lime-A100: #f4ff81;
  --md-lime-A200: #eeff41;
  --md-lime-A400: #c6ff00;
  --md-lime-A700: #aeea00;

  --md-yellow-50: #fffde7;
  --md-yellow-100: #fff9c4;
  --md-yellow-200: #fff59d;
  --md-yellow-300: #fff176;
  --md-yellow-400: #ffee58;
  --md-yellow-500: #ffeb3b;
  --md-yellow-600: #fdd835;
  --md-yellow-700: #fbc02d;
  --md-yellow-800: #f9a825;
  --md-yellow-900: #f57f17;
  --md-yellow-A100: #ffff8d;
  --md-yellow-A200: #ffff00;
  --md-yellow-A400: #ffea00;
  --md-yellow-A700: #ffd600;

  --md-amber-50: #fff8e1;
  --md-amber-100: #ffecb3;
  --md-amber-200: #ffe082;
  --md-amber-300: #ffd54f;
  --md-amber-400: #ffca28;
  --md-amber-500: #ffc107;
  --md-amber-600: #ffb300;
  --md-amber-700: #ffa000;
  --md-amber-800: #ff8f00;
  --md-amber-900: #ff6f00;
  --md-amber-A100: #ffe57f;
  --md-amber-A200: #ffd740;
  --md-amber-A400: #ffc400;
  --md-amber-A700: #ffab00;

  --md-orange-50: #fff3e0;
  --md-orange-100: #ffe0b2;
  --md-orange-200: #ffcc80;
  --md-orange-300: #ffb74d;
  --md-orange-400: #ffa726;
  --md-orange-500: #ff9800;
  --md-orange-600: #fb8c00;
  --md-orange-700: #f57c00;
  --md-orange-800: #ef6c00;
  --md-orange-900: #e65100;
  --md-orange-A100: #ffd180;
  --md-orange-A200: #ffab40;
  --md-orange-A400: #ff9100;
  --md-orange-A700: #ff6d00;

  --md-deep-orange-50: #fbe9e7;
  --md-deep-orange-100: #ffccbc;
  --md-deep-orange-200: #ffab91;
  --md-deep-orange-300: #ff8a65;
  --md-deep-orange-400: #ff7043;
  --md-deep-orange-500: #ff5722;
  --md-deep-orange-600: #f4511e;
  --md-deep-orange-700: #e64a19;
  --md-deep-orange-800: #d84315;
  --md-deep-orange-900: #bf360c;
  --md-deep-orange-A100: #ff9e80;
  --md-deep-orange-A200: #ff6e40;
  --md-deep-orange-A400: #ff3d00;
  --md-deep-orange-A700: #dd2c00;

  --md-brown-50: #efebe9;
  --md-brown-100: #d7ccc8;
  --md-brown-200: #bcaaa4;
  --md-brown-300: #a1887f;
  --md-brown-400: #8d6e63;
  --md-brown-500: #795548;
  --md-brown-600: #6d4c41;
  --md-brown-700: #5d4037;
  --md-brown-800: #4e342e;
  --md-brown-900: #3e2723;

  --md-grey-50: #fafafa;
  --md-grey-100: #f5f5f5;
  --md-grey-200: #eeeeee;
  --md-grey-300: #e0e0e0;
  --md-grey-400: #bdbdbd;
  --md-grey-500: #9e9e9e;
  --md-grey-600: #757575;
  --md-grey-700: #616161;
  --md-grey-800: #424242;
  --md-grey-900: #212121;

  --md-blue-grey-50: #eceff1;
  --md-blue-grey-100: #cfd8dc;
  --md-blue-grey-200: #b0bec5;
  --md-blue-grey-300: #90a4ae;
  --md-blue-grey-400: #78909c;
  --md-blue-grey-500: #607d8b;
  --md-blue-grey-600: #546e7a;
  --md-blue-grey-700: #455a64;
  --md-blue-grey-800: #37474f;
  --md-blue-grey-900: #263238;
}

/*-----------------------------------------------------------------------------
| Copyright (c) 2017, Jupyter Development Team.
|
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-Spinner {
  position: absolute;
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 10;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: var(--jp-layout-color0);
  outline: none;
}

.jp-SpinnerContent {
  font-size: 10px;
  margin: 50px auto;
  text-indent: -9999em;
  width: 3em;
  height: 3em;
  border-radius: 50%;
  background: var(--jp-brand-color3);
  background: linear-gradient(
    to right,
    #f37626 10%,
    rgba(255, 255, 255, 0) 42%
  );
  position: relative;
  animation: load3 1s infinite linear, fadeIn 1s;
}

.jp-SpinnerContent:before {
  width: 50%;
  height: 50%;
  background: #f37626;
  border-radius: 100% 0 0 0;
  position: absolute;
  top: 0;
  left: 0;
  content: '';
}

.jp-SpinnerContent:after {
  background: var(--jp-layout-color0);
  width: 75%;
  height: 75%;
  border-radius: 50%;
  content: '';
  margin: auto;
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
}

@keyframes fadeIn {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}

@keyframes load3 {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

/*-----------------------------------------------------------------------------
| Copyright (c) 2014-2017, Jupyter Development Team.
|
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

button.jp-mod-styled {
  font-size: var(--jp-ui-font-size1);
  color: var(--jp-ui-font-color0);
  border: none;
  box-sizing: border-box;
  text-align: center;
  line-height: 32px;
  height: 32px;
  padding: 0px 12px;
  letter-spacing: 0.8px;
  outline: none;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
}

input.jp-mod-styled {
  background: var(--jp-input-background);
  height: 28px;
  box-sizing: border-box;
  border: var(--jp-border-width) solid var(--jp-border-color1);
  padding-left: 7px;
  padding-right: 7px;
  font-size: var(--jp-ui-font-size2);
  color: var(--jp-ui-font-color0);
  outline: none;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
}

input[type='checkbox'].jp-mod-styled {
  appearance: checkbox;
  -webkit-appearance: checkbox;
  -moz-appearance: checkbox;
  height: auto;
}

input.jp-mod-styled:focus {
  border: var(--jp-border-width) solid var(--md-blue-500);
  box-shadow: inset 0 0 4px var(--md-blue-300);
}

.jp-FileDialog-Checkbox {
  margin-top: 35px;
  display: flex;
  flex-direction: row;
  align-items: end;
  width: 100%;
}

.jp-FileDialog-Checkbox > label {
  flex: 1 1 auto;
}

.jp-select-wrapper {
  display: flex;
  position: relative;
  flex-direction: column;
  padding: 1px;
  background-color: var(--jp-layout-color1);
  height: 28px;
  box-sizing: border-box;
  margin-bottom: 12px;
}

.jp-select-wrapper.jp-mod-focused select.jp-mod-styled {
  border: var(--jp-border-width) solid var(--jp-input-active-border-color);
  box-shadow: var(--jp-input-box-shadow);
  background-color: var(--jp-input-active-background);
}

select.jp-mod-styled:hover {
  background-color: var(--jp-layout-color1);
  cursor: pointer;
  color: var(--jp-ui-font-color0);
  background-color: var(--jp-input-hover-background);
  box-shadow: inset 0 0px 1px rgba(0, 0, 0, 0.5);
}

select.jp-mod-styled {
  flex: 1 1 auto;
  height: 32px;
  width: 100%;
  font-size: var(--jp-ui-font-size2);
  background: var(--jp-input-background);
  color: var(--jp-ui-font-color0);
  padding: 0 25px 0 8px;
  border: var(--jp-border-width) solid var(--jp-input-border-color);
  border-radius: 0px;
  outline: none;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
}

/*-----------------------------------------------------------------------------
| Copyright (c) 2014-2016, Jupyter Development Team.
|
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

:root {
  --jp-private-toolbar-height: calc(
    28px + var(--jp-border-width)
  ); /* leave 28px for content */
}

.jp-Toolbar {
  color: var(--jp-ui-font-color1);
  flex: 0 0 auto;
  display: flex;
  flex-direction: row;
  border-bottom: var(--jp-border-width) solid var(--jp-toolbar-border-color);
  box-shadow: var(--jp-toolbar-box-shadow);
  background: var(--jp-toolbar-background);
  min-height: var(--jp-toolbar-micro-height);
  padding: 2px;
  z-index: 8;
  overflow-x: hidden;
}

/* Toolbar items */

.jp-Toolbar > .jp-Toolbar-item.jp-Toolbar-spacer {
  flex-grow: 1;
  flex-shrink: 1;
}

.jp-Toolbar-item.jp-Toolbar-kernelStatus {
  display: inline-block;
  width: 32px;
  background-repeat: no-repeat;
  background-position: center;
  background-size: 16px;
}

.jp-Toolbar > .jp-Toolbar-item {
  flex: 0 0 auto;
  display: flex;
  padding-left: 1px;
  padding-right: 1px;
  font-size: var(--jp-ui-font-size1);
  line-height: var(--jp-private-toolbar-height);
  height: 100%;
}

/* Toolbar buttons */

/* This is the div we use to wrap the react component into a Widget */
div.jp-ToolbarButton {
  color: transparent;
  border: none;
  box-sizing: border-box;
  outline: none;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  padding: 0px;
  margin: 0px;
}

button.jp-ToolbarButtonComponent {
  background: var(--jp-layout-color1);
  border: none;
  box-sizing: border-box;
  outline: none;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  padding: 0px 6px;
  margin: 0px;
  height: 24px;
  border-radius: var(--jp-border-radius);
  display: flex;
  align-items: center;
  text-align: center;
  font-size: 14px;
  min-width: unset;
  min-height: unset;
}

button.jp-ToolbarButtonComponent:disabled {
  opacity: 0.4;
}

button.jp-ToolbarButtonComponent span {
  padding: 0px;
  flex: 0 0 auto;
}

button.jp-ToolbarButtonComponent .jp-ToolbarButtonComponent-label {
  font-size: var(--jp-ui-font-size1);
  line-height: 100%;
  padding-left: 2px;
  color: var(--jp-ui-font-color1);
}

#jp-main-dock-panel[data-mode='single-document']
  .jp-MainAreaWidget
  > .jp-Toolbar.jp-Toolbar-micro {
  padding: 0;
  min-height: 0;
}

#jp-main-dock-panel[data-mode='single-document']
  .jp-MainAreaWidget
  > .jp-Toolbar {
  border: none;
  box-shadow: none;
}

/*-----------------------------------------------------------------------------
| Copyright (c) 2014-2017, Jupyter Development Team.
|
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Copyright (c) 2014-2017, PhosphorJS Contributors
|
| Distributed under the terms of the BSD 3-Clause License.
|
| The full license is in the file LICENSE, distributed with this software.
|----------------------------------------------------------------------------*/

/* <DEPRECATED> */
body.p-mod-override-cursor *, /* </DEPRECATED> */
body.lm-mod-override-cursor * {
  cursor: inherit !important;
}

/*-----------------------------------------------------------------------------
| Copyright (c) 2014-2016, Jupyter Development Team.
|
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-JSONEditor {
  display: flex;
  flex-direction: column;
  width: 100%;
}

.jp-JSONEditor-host {
  flex: 1 1 auto;
  border: var(--jp-border-width) solid var(--jp-input-border-color);
  border-radius: 0px;
  background: var(--jp-layout-color0);
  min-height: 50px;
  padding: 1px;
}

.jp-JSONEditor.jp-mod-error .jp-JSONEditor-host {
  border-color: red;
  outline-color: red;
}

.jp-JSONEditor-header {
  display: flex;
  flex: 1 0 auto;
  padding: 0 0 0 12px;
}

.jp-JSONEditor-header label {
  flex: 0 0 auto;
}

.jp-JSONEditor-commitButton {
  height: 16px;
  width: 16px;
  background-size: 18px;
  background-repeat: no-repeat;
  background-position: center;
}

.jp-JSONEditor-host.jp-mod-focused {
  background-color: var(--jp-input-active-background);
  border: 1px solid var(--jp-input-active-border-color);
  box-shadow: var(--jp-input-box-shadow);
}

.jp-Editor.jp-mod-dropTarget {
  border: var(--jp-border-width) solid var(--jp-input-active-border-color);
  box-shadow: var(--jp-input-box-shadow);
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Variables
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------

/*-----------------------------------------------------------------------------
| Styles
|----------------------------------------------------------------------------*/

.jp-Statusbar-ProgressCircle svg {
  display: block;
  margin: 0 auto;
  width: 16px;
  height: 24px;
  align-self: normal;
}
.jp-Statusbar-ProgressCircle path {
  fill: var(--jp-inverse-layout-color3);
}

.jp-Statusbar-ProgressBar-progress-bar {
  height: 10px;
  width: 100px;
  border: solid 0.25px var(--jp-brand-color2);
  border-radius: 3px;
  overflow: hidden;
  align-self: center;
}
.jp-Statusbar-ProgressBar-progress-bar > div {
  background-color: var(--jp-brand-color2);
  background-image: linear-gradient(
    -45deg,
    rgba(255, 255, 255, 0.2) 25%,
    transparent 25%,
    transparent 50%,
    rgba(255, 255, 255, 0.2) 50%,
    rgba(255, 255, 255, 0.2) 75%,
    transparent 75%,
    transparent
  );
  background-size: 40px 40px;
  float: left;
  width: 0%;
  height: 100%;
  font-size: 12px;
  line-height: 14px;
  color: #ffffff;
  text-align: center;
  animation: jp-Statusbar-ExecutionTime-progress-bar 2s linear infinite;
}

.jp-Statusbar-ProgressBar-progress-bar p {
  color: var(--jp-ui-font-color1);
  font-family: var(--jp-ui-font-family);
  font-size: var(--jp-ui-font-size1);
  line-height: 10px;
  width: 100px;
}

@keyframes jp-Statusbar-ExecutionTime-progress-bar {
  0% {
    background-position: 0 0;
  }
  100% {
    background-position: 40px 40px;
  }
}

/* BASICS */

.CodeMirror {
  /* Set height, width, borders, and global font properties here */
  font-family: monospace;
  height: 300px;
  color: black;
  direction: ltr;
}

/* PADDING */

.CodeMirror-lines {
  padding: 4px 0; /* Vertical padding around content */
}
.CodeMirror pre.CodeMirror-line,
.CodeMirror pre.CodeMirror-line-like {
  padding: 0 4px; /* Horizontal padding of content */
}

.CodeMirror-scrollbar-filler, .CodeMirror-gutter-filler {
  background-color: white; /* The little square between H and V scrollbars */
}

/* GUTTER */

.CodeMirror-gutters {
  border-right: 1px solid #ddd;
  background-color: #f7f7f7;
  white-space: nowrap;
}
.CodeMirror-linenumbers {}
.CodeMirror-linenumber {
  padding: 0 3px 0 5px;
  min-width: 20px;
  text-align: right;
  color: #999;
  white-space: nowrap;
}

.CodeMirror-guttermarker { color: black; }
.CodeMirror-guttermarker-subtle { color: #999; }

/* CURSOR */

.CodeMirror-cursor {
  border-left: 1px solid black;
  border-right: none;
  width: 0;
}
/* Shown when moving in bi-directional text */
.CodeMirror div.CodeMirror-secondarycursor {
  border-left: 1px solid silver;
}
.cm-fat-cursor .CodeMirror-cursor {
  width: auto;
  border: 0 !important;
  background: #7e7;
}
.cm-fat-cursor div.CodeMirror-cursors {
  z-index: 1;
}
.cm-fat-cursor-mark {
  background-color: rgba(20, 255, 20, 0.5);
  -webkit-animation: blink 1.06s steps(1) infinite;
  -moz-animation: blink 1.06s steps(1) infinite;
  animation: blink 1.06s steps(1) infinite;
}
.cm-animate-fat-cursor {
  width: auto;
  border: 0;
  -webkit-animation: blink 1.06s steps(1) infinite;
  -moz-animation: blink 1.06s steps(1) infinite;
  animation: blink 1.06s steps(1) infinite;
  background-color: #7e7;
}
@-moz-keyframes blink {
  0% {}
  50% { background-color: transparent; }
  100% {}
}
@-webkit-keyframes blink {
  0% {}
  50% { background-color: transparent; }
  100% {}
}
@keyframes blink {
  0% {}
  50% { background-color: transparent; }
  100% {}
}

/* Can style cursor different in overwrite (non-insert) mode */
.CodeMirror-overwrite .CodeMirror-cursor {}

.cm-tab { display: inline-block; text-decoration: inherit; }

.CodeMirror-rulers {
  position: absolute;
  left: 0; right: 0; top: -50px; bottom: 0;
  overflow: hidden;
}
.CodeMirror-ruler {
  border-left: 1px solid #ccc;
  top: 0; bottom: 0;
  position: absolute;
}

/* DEFAULT THEME */

.cm-s-default .cm-header {color: blue;}
.cm-s-default .cm-quote {color: #090;}
.cm-negative {color: #d44;}
.cm-positive {color: #292;}
.cm-header, .cm-strong {font-weight: bold;}
.cm-em {font-style: italic;}
.cm-link {text-decoration: underline;}
.cm-strikethrough {text-decoration: line-through;}

.cm-s-default .cm-keyword {color: #708;}
.cm-s-default .cm-atom {color: #219;}
.cm-s-default .cm-number {color: #164;}
.cm-s-default .cm-def {color: #00f;}
.cm-s-default .cm-variable,
.cm-s-default .cm-punctuation,
.cm-s-default .cm-property,
.cm-s-default .cm-operator {}
.cm-s-default .cm-variable-2 {color: #05a;}
.cm-s-default .cm-variable-3, .cm-s-default .cm-type {color: #085;}
.cm-s-default .cm-comment {color: #a50;}
.cm-s-default .cm-string {color: #a11;}
.cm-s-default .cm-string-2 {color: #f50;}
.cm-s-default .cm-meta {color: #555;}
.cm-s-default .cm-qualifier {color: #555;}
.cm-s-default .cm-builtin {color: #30a;}
.cm-s-default .cm-bracket {color: #997;}
.cm-s-default .cm-tag {color: #170;}
.cm-s-default .cm-attribute {color: #00c;}
.cm-s-default .cm-hr {color: #999;}
.cm-s-default .cm-link {color: #00c;}

.cm-s-default .cm-error {color: #f00;}
.cm-invalidchar {color: #f00;}

.CodeMirror-composing { border-bottom: 2px solid; }

/* Default styles for common addons */

div.CodeMirror span.CodeMirror-matchingbracket {color: #0b0;}
div.CodeMirror span.CodeMirror-nonmatchingbracket {color: #a22;}
.CodeMirror-matchingtag { background: rgba(255, 150, 0, .3); }
.CodeMirror-activeline-background {background: #e8f2ff;}

/* STOP */

/* The rest of this file contains styles related to the mechanics of
   the editor. You probably shouldn't touch them. */

.CodeMirror {
  position: relative;
  overflow: hidden;
  background: white;
}

.CodeMirror-scroll {
  overflow: scroll !important; /* Things will break if this is overridden */
  /* 50px is the magic margin used to hide the element's real scrollbars */
  /* See overflow: hidden in .CodeMirror */
  margin-bottom: -50px; margin-right: -50px;
  padding-bottom: 50px;
  height: 100%;
  outline: none; /* Prevent dragging from highlighting the element */
  position: relative;
}
.CodeMirror-sizer {
  position: relative;
  border-right: 50px solid transparent;
}

/* The fake, visible scrollbars. Used to force redraw during scrolling
   before actual scrolling happens, thus preventing shaking and
   flickering artifacts. */
.CodeMirror-vscrollbar, .CodeMirror-hscrollbar, .CodeMirror-scrollbar-filler, .CodeMirror-gutter-filler {
  position: absolute;
  z-index: 6;
  display: none;
  outline: none;
}
.CodeMirror-vscrollbar {
  right: 0; top: 0;
  overflow-x: hidden;
  overflow-y: scroll;
}
.CodeMirror-hscrollbar {
  bottom: 0; left: 0;
  overflow-y: hidden;
  overflow-x: scroll;
}
.CodeMirror-scrollbar-filler {
  right: 0; bottom: 0;
}
.CodeMirror-gutter-filler {
  left: 0; bottom: 0;
}

.CodeMirror-gutters {
  position: absolute; left: 0; top: 0;
  min-height: 100%;
  z-index: 3;
}
.CodeMirror-gutter {
  white-space: normal;
  height: 100%;
  display: inline-block;
  vertical-align: top;
  margin-bottom: -50px;
}
.CodeMirror-gutter-wrapper {
  position: absolute;
  z-index: 4;
  background: none !important;
  border: none !important;
}
.CodeMirror-gutter-background {
  position: absolute;
  top: 0; bottom: 0;
  z-index: 4;
}
.CodeMirror-gutter-elt {
  position: absolute;
  cursor: default;
  z-index: 4;
}
.CodeMirror-gutter-wrapper ::selection { background-color: transparent }
.CodeMirror-gutter-wrapper ::-moz-selection { background-color: transparent }

.CodeMirror-lines {
  cursor: text;
  min-height: 1px; /* prevents collapsing before first draw */
}
.CodeMirror pre.CodeMirror-line,
.CodeMirror pre.CodeMirror-line-like {
  /* Reset some styles that the rest of the page might have set */
  -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0;
  border-width: 0;
  background: transparent;
  font-family: inherit;
  font-size: inherit;
  margin: 0;
  white-space: pre;
  word-wrap: normal;
  line-height: inherit;
  color: inherit;
  z-index: 2;
  position: relative;
  overflow: visible;
  -webkit-tap-highlight-color: transparent;
  -webkit-font-variant-ligatures: contextual;
  font-variant-ligatures: contextual;
}
.CodeMirror-wrap pre.CodeMirror-line,
.CodeMirror-wrap pre.CodeMirror-line-like {
  word-wrap: break-word;
  white-space: pre-wrap;
  word-break: normal;
}

.CodeMirror-linebackground {
  position: absolute;
  left: 0; right: 0; top: 0; bottom: 0;
  z-index: 0;
}

.CodeMirror-linewidget {
  position: relative;
  z-index: 2;
  padding: 0.1px; /* Force widget margins to stay inside of the container */
}

.CodeMirror-widget {}

.CodeMirror-rtl pre { direction: rtl; }

.CodeMirror-code {
  outline: none;
}

/* Force content-box sizing for the elements where we expect it */
.CodeMirror-scroll,
.CodeMirror-sizer,
.CodeMirror-gutter,
.CodeMirror-gutters,
.CodeMirror-linenumber {
  -moz-box-sizing: content-box;
  box-sizing: content-box;
}

.CodeMirror-measure {
  position: absolute;
  width: 100%;
  height: 0;
  overflow: hidden;
  visibility: hidden;
}

.CodeMirror-cursor {
  position: absolute;
  pointer-events: none;
}
.CodeMirror-measure pre { position: static; }

div.CodeMirror-cursors {
  visibility: hidden;
  position: relative;
  z-index: 3;
}
div.CodeMirror-dragcursors {
  visibility: visible;
}

.CodeMirror-focused div.CodeMirror-cursors {
  visibility: visible;
}

.CodeMirror-selected { background: #d9d9d9; }
.CodeMirror-focused .CodeMirror-selected { background: #d7d4f0; }
.CodeMirror-crosshair { cursor: crosshair; }
.CodeMirror-line::selection, .CodeMirror-line > span::selection, .CodeMirror-line > span > span::selection { background: #d7d4f0; }
.CodeMirror-line::-moz-selection, .CodeMirror-line > span::-moz-selection, .CodeMirror-line > span > span::-moz-selection { background: #d7d4f0; }

.cm-searching {
  background-color: #ffa;
  background-color: rgba(255, 255, 0, .4);
}

/* Used to force a border model for a node */
.cm-force-border { padding-right: .1px; }

@media print {
  /* Hide the cursor when printing */
  .CodeMirror div.CodeMirror-cursors {
    visibility: hidden;
  }
}

/* See issue #2901 */
.cm-tab-wrap-hack:after { content: ''; }

/* Help users use markselection to safely style text background */
span.CodeMirror-selectedtext { background: none; }

.CodeMirror-dialog {
  position: absolute;
  left: 0; right: 0;
  background: inherit;
  z-index: 15;
  padding: .1em .8em;
  overflow: hidden;
  color: inherit;
}

.CodeMirror-dialog-top {
  border-bottom: 1px solid #eee;
  top: 0;
}

.CodeMirror-dialog-bottom {
  border-top: 1px solid #eee;
  bottom: 0;
}

.CodeMirror-dialog input {
  border: none;
  outline: none;
  background: transparent;
  width: 20em;
  color: inherit;
  font-family: monospace;
}

.CodeMirror-dialog button {
  font-size: 70%;
}

.CodeMirror-foldmarker {
  color: blue;
  text-shadow: #b9f 1px 1px 2px, #b9f -1px -1px 2px, #b9f 1px -1px 2px, #b9f -1px 1px 2px;
  font-family: arial;
  line-height: .3;
  cursor: pointer;
}
.CodeMirror-foldgutter {
  width: .7em;
}
.CodeMirror-foldgutter-open,
.CodeMirror-foldgutter-folded {
  cursor: pointer;
}
.CodeMirror-foldgutter-open:after {
  content: "\25BE";
}
.CodeMirror-foldgutter-folded:after {
  content: "\25B8";
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.CodeMirror {
  line-height: var(--jp-code-line-height);
  font-size: var(--jp-code-font-size);
  font-family: var(--jp-code-font-family);
  border: 0;
  border-radius: 0;
  height: auto;
  /* Changed to auto to autogrow */
}

.CodeMirror pre {
  padding: 0 var(--jp-code-padding);
}

.CodeMirror.cm-fat-cursor .cm-overlay.cm-searching {
  opacity: 0.5;
}

.jp-CodeMirrorEditor[data-type='inline'] .CodeMirror-dialog {
  background-color: var(--jp-layout-color0);
  color: var(--jp-content-font-color1);
}

/* This causes https://github.com/jupyter/jupyterlab/issues/522 */
/* May not cause it not because we changed it! */
.CodeMirror-lines {
  padding: var(--jp-code-padding) 0;
}

.CodeMirror-linenumber {
  padding: 0 8px;
}

.jp-CodeMirrorEditor {
  cursor: text;
}

.jp-CodeMirrorEditor[data-type='inline'] .CodeMirror-cursor {
  border-left: var(--jp-code-cursor-width0) solid var(--jp-editor-cursor-color);
}

/* When zoomed out 67% and 33% on a screen of 1440 width x 900 height */
@media screen and (min-width: 2138px) and (max-width: 4319px) {
  .jp-CodeMirrorEditor[data-type='inline'] .CodeMirror-cursor {
    border-left: var(--jp-code-cursor-width1) solid
      var(--jp-editor-cursor-color);
  }
}

/* When zoomed out less than 33% */
@media screen and (min-width: 4320px) {
  .jp-CodeMirrorEditor[data-type='inline'] .CodeMirror-cursor {
    border-left: var(--jp-code-cursor-width2) solid
      var(--jp-editor-cursor-color);
  }
}

.CodeMirror.jp-mod-readOnly .CodeMirror-cursor {
  display: none;
}

.CodeMirror-gutters {
  border-right: 1px solid var(--jp-border-color2);
  background-color: var(--jp-layout-color0);
}

.jp-CollaboratorCursor {
  border-left: 5px solid transparent;
  border-right: 5px solid transparent;
  border-top: none;
  border-bottom: 3px solid;
  background-clip: content-box;
  margin-left: -5px;
  margin-right: -5px;
}

.CodeMirror-selectedtext.cm-searching {
  background-color: var(--jp-search-selected-match-background-color) !important;
  color: var(--jp-search-selected-match-color) !important;
}

.cm-searching {
  background-color: var(
    --jp-search-unselected-match-background-color
  ) !important;
  color: var(--jp-search-unselected-match-color) !important;
}

.cm-trailingspace {
  background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAFCAYAAAB4ka1VAAAAsElEQVQIHQGlAFr/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA7+r3zKmT0/+pk9P/7+r3zAAAAAAAAAAABAAAAAAAAAAA6OPzM+/q9wAAAAAA6OPzMwAAAAAAAAAAAgAAAAAAAAAAGR8NiRQaCgAZIA0AGR8NiQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQyoYJ/SY80UAAAAASUVORK5CYII=);
  background-position: center left;
  background-repeat: repeat-x;
}

.CodeMirror-focused .CodeMirror-selected {
  background-color: var(--jp-editor-selected-focused-background);
}

.CodeMirror-selected {
  background-color: var(--jp-editor-selected-background);
}

.jp-CollaboratorCursor-hover {
  position: absolute;
  z-index: 1;
  transform: translateX(-50%);
  color: white;
  border-radius: 3px;
  padding-left: 4px;
  padding-right: 4px;
  padding-top: 1px;
  padding-bottom: 1px;
  text-align: center;
  font-size: var(--jp-ui-font-size1);
  white-space: nowrap;
}

.jp-CodeMirror-ruler {
  border-left: 1px dashed var(--jp-border-color2);
}

/**
 * Here is our jupyter theme for CodeMirror syntax highlighting
 * This is used in our marked.js syntax highlighting and CodeMirror itself
 * The string "jupyter" is set in ../codemirror/widget.DEFAULT_CODEMIRROR_THEME
 * This came from the classic notebook, which came form highlight.js/GitHub
 */

/**
 * CodeMirror themes are handling the background/color in this way. This works
 * fine for CodeMirror editors outside the notebook, but the notebook styles
 * these things differently.
 */
.CodeMirror.cm-s-jupyter {
  background: var(--jp-layout-color0);
  color: var(--jp-content-font-color1);
}

/* In the notebook, we want this styling to be handled by its container */
.jp-CodeConsole .CodeMirror.cm-s-jupyter,
.jp-Notebook .CodeMirror.cm-s-jupyter {
  background: transparent;
}

.cm-s-jupyter .CodeMirror-cursor {
  border-left: var(--jp-code-cursor-width0) solid var(--jp-editor-cursor-color);
}
.cm-s-jupyter span.cm-keyword {
  color: var(--jp-mirror-editor-keyword-color);
  font-weight: bold;
}
.cm-s-jupyter span.cm-atom {
  color: var(--jp-mirror-editor-atom-color);
}
.cm-s-jupyter span.cm-number {
  color: var(--jp-mirror-editor-number-color);
}
.cm-s-jupyter span.cm-def {
  color: var(--jp-mirror-editor-def-color);
}
.cm-s-jupyter span.cm-variable {
  color: var(--jp-mirror-editor-variable-color);
}
.cm-s-jupyter span.cm-variable-2 {
  color: var(--jp-mirror-editor-variable-2-color);
}
.cm-s-jupyter span.cm-variable-3 {
  color: var(--jp-mirror-editor-variable-3-color);
}
.cm-s-jupyter span.cm-punctuation {
  color: var(--jp-mirror-editor-punctuation-color);
}
.cm-s-jupyter span.cm-property {
  color: var(--jp-mirror-editor-property-color);
}
.cm-s-jupyter span.cm-operator {
  color: var(--jp-mirror-editor-operator-color);
  font-weight: bold;
}
.cm-s-jupyter span.cm-comment {
  color: var(--jp-mirror-editor-comment-color);
  font-style: italic;
}
.cm-s-jupyter span.cm-string {
  color: var(--jp-mirror-editor-string-color);
}
.cm-s-jupyter span.cm-string-2 {
  color: var(--jp-mirror-editor-string-2-color);
}
.cm-s-jupyter span.cm-meta {
  color: var(--jp-mirror-editor-meta-color);
}
.cm-s-jupyter span.cm-qualifier {
  color: var(--jp-mirror-editor-qualifier-color);
}
.cm-s-jupyter span.cm-builtin {
  color: var(--jp-mirror-editor-builtin-color);
}
.cm-s-jupyter span.cm-bracket {
  color: var(--jp-mirror-editor-bracket-color);
}
.cm-s-jupyter span.cm-tag {
  color: var(--jp-mirror-editor-tag-color);
}
.cm-s-jupyter span.cm-attribute {
  color: var(--jp-mirror-editor-attribute-color);
}
.cm-s-jupyter span.cm-header {
  color: var(--jp-mirror-editor-header-color);
}
.cm-s-jupyter span.cm-quote {
  color: var(--jp-mirror-editor-quote-color);
}
.cm-s-jupyter span.cm-link {
  color: var(--jp-mirror-editor-link-color);
}
.cm-s-jupyter span.cm-error {
  color: var(--jp-mirror-editor-error-color);
}
.cm-s-jupyter span.cm-hr {
  color: #999;
}

.cm-s-jupyter span.cm-tab {
  background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAMCAYAAAAkuj5RAAAAAXNSR0IArs4c6QAAAGFJREFUSMft1LsRQFAQheHPowAKoACx3IgEKtaEHujDjORSgWTH/ZOdnZOcM/sgk/kFFWY0qV8foQwS4MKBCS3qR6ixBJvElOobYAtivseIE120FaowJPN75GMu8j/LfMwNjh4HUpwg4LUAAAAASUVORK5CYII=);
  background-position: right;
  background-repeat: no-repeat;
}

.cm-s-jupyter .CodeMirror-activeline-background,
.cm-s-jupyter .CodeMirror-gutter {
  background-color: var(--jp-layout-color2);
}

/* Styles for shared cursors (remote cursor locations and selected ranges) */
.jp-CodeMirrorEditor .remote-caret {
  position: relative;
  border-left: 2px solid black;
  margin-left: -1px;
  margin-right: -1px;
  box-sizing: border-box;
}

.jp-CodeMirrorEditor .remote-caret > div {
  white-space: nowrap;
  position: absolute;
  top: -1.15em;
  padding-bottom: 0.05em;
  left: -2px;
  font-size: 0.95em;
  background-color: rgb(250, 129, 0);
  font-family: var(--jp-ui-font-family);
  font-weight: bold;
  line-height: normal;
  user-select: none;
  color: white;
  padding-left: 2px;
  padding-right: 2px;
  z-index: 3;
  transition: opacity 0.3s ease-in-out;
}

.jp-CodeMirrorEditor .remote-caret.hide-name > div {
  transition-delay: 0.7s;
  opacity: 0;
}

/* Use `div[style]` as more specific selector on 3.4.x to reduce the impact of
 * Chromium style invalidation strategy on performance when many divs are present.
 */
.jp-CodeMirrorEditor .remote-caret:hover > div[style] {
  opacity: 1;
  transition-delay: 0s;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| RenderedText
|----------------------------------------------------------------------------*/

:root {
  /* This is the padding value to fill the gaps between lines containing spans with background color. */
  --jp-private-code-span-padding: calc(
    (var(--jp-code-line-height) - 1) * var(--jp-code-font-size) / 2
  );
}

.jp-RenderedText {
  text-align: left;
  padding-left: var(--jp-code-padding);
  line-height: var(--jp-code-line-height);
  font-family: var(--jp-code-font-family);
}

.jp-RenderedText pre,
.jp-RenderedJavaScript pre,
.jp-RenderedHTMLCommon pre {
  color: var(--jp-content-font-color1);
  font-size: var(--jp-code-font-size);
  border: none;
  margin: 0px;
  padding: 0px;
}

.jp-RenderedText pre a:link {
  text-decoration: none;
  color: var(--jp-content-link-color);
}
.jp-RenderedText pre a:hover {
  text-decoration: underline;
  color: var(--jp-content-link-color);
}
.jp-RenderedText pre a:visited {
  text-decoration: none;
  color: var(--jp-content-link-color);
}

/* console foregrounds and backgrounds */
.jp-RenderedText pre .ansi-black-fg {
  color: #3e424d;
}
.jp-RenderedText pre .ansi-red-fg {
  color: #e75c58;
}
.jp-RenderedText pre .ansi-green-fg {
  color: #00a250;
}
.jp-RenderedText pre .ansi-yellow-fg {
  color: #ddb62b;
}
.jp-RenderedText pre .ansi-blue-fg {
  color: #208ffb;
}
.jp-RenderedText pre .ansi-magenta-fg {
  color: #d160c4;
}
.jp-RenderedText pre .ansi-cyan-fg {
  color: #60c6c8;
}
.jp-RenderedText pre .ansi-white-fg {
  color: #c5c1b4;
}

.jp-RenderedText pre .ansi-black-bg {
  background-color: #3e424d;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-red-bg {
  background-color: #e75c58;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-green-bg {
  background-color: #00a250;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-yellow-bg {
  background-color: #ddb62b;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-blue-bg {
  background-color: #208ffb;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-magenta-bg {
  background-color: #d160c4;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-cyan-bg {
  background-color: #60c6c8;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-white-bg {
  background-color: #c5c1b4;
  padding: var(--jp-private-code-span-padding) 0;
}

.jp-RenderedText pre .ansi-black-intense-fg {
  color: #282c36;
}
.jp-RenderedText pre .ansi-red-intense-fg {
  color: #b22b31;
}
.jp-RenderedText pre .ansi-green-intense-fg {
  color: #007427;
}
.jp-RenderedText pre .ansi-yellow-intense-fg {
  color: #b27d12;
}
.jp-RenderedText pre .ansi-blue-intense-fg {
  color: #0065ca;
}
.jp-RenderedText pre .ansi-magenta-intense-fg {
  color: #a03196;
}
.jp-RenderedText pre .ansi-cyan-intense-fg {
  color: #258f8f;
}
.jp-RenderedText pre .ansi-white-intense-fg {
  color: #a1a6b2;
}

.jp-RenderedText pre .ansi-black-intense-bg {
  background-color: #282c36;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-red-intense-bg {
  background-color: #b22b31;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-green-intense-bg {
  background-color: #007427;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-yellow-intense-bg {
  background-color: #b27d12;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-blue-intense-bg {
  background-color: #0065ca;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-magenta-intense-bg {
  background-color: #a03196;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-cyan-intense-bg {
  background-color: #258f8f;
  padding: var(--jp-private-code-span-padding) 0;
}
.jp-RenderedText pre .ansi-white-intense-bg {
  background-color: #a1a6b2;
  padding: var(--jp-private-code-span-padding) 0;
}

.jp-RenderedText pre .ansi-default-inverse-fg {
  color: var(--jp-ui-inverse-font-color0);
}
.jp-RenderedText pre .ansi-default-inverse-bg {
  background-color: var(--jp-inverse-layout-color0);
  padding: var(--jp-private-code-span-padding) 0;
}

.jp-RenderedText pre .ansi-bold {
  font-weight: bold;
}
.jp-RenderedText pre .ansi-underline {
  text-decoration: underline;
}

.jp-RenderedText[data-mime-type='application/vnd.jupyter.stderr'] {
  background: var(--jp-rendermime-error-background);
  padding-top: var(--jp-code-padding);
}

/*-----------------------------------------------------------------------------
| RenderedLatex
|----------------------------------------------------------------------------*/

.jp-RenderedLatex {
  color: var(--jp-content-font-color1);
  font-size: var(--jp-content-font-size1);
  line-height: var(--jp-content-line-height);
}

/* Left-justify outputs.*/
.jp-OutputArea-output.jp-RenderedLatex {
  padding: var(--jp-code-padding);
  text-align: left;
}

/*-----------------------------------------------------------------------------
| RenderedHTML
|----------------------------------------------------------------------------*/

.jp-RenderedHTMLCommon {
  color: var(--jp-content-font-color1);
  font-family: var(--jp-content-font-family);
  font-size: var(--jp-content-font-size1);
  line-height: var(--jp-content-line-height);
  /* Give a bit more R padding on Markdown text to keep line lengths reasonable */
  padding-right: 20px;
}

.jp-RenderedHTMLCommon em {
  font-style: italic;
}

.jp-RenderedHTMLCommon strong {
  font-weight: bold;
}

.jp-RenderedHTMLCommon u {
  text-decoration: underline;
}

.jp-RenderedHTMLCommon a:link {
  text-decoration: none;
  color: var(--jp-content-link-color);
}

.jp-RenderedHTMLCommon a:hover {
  text-decoration: underline;
  color: var(--jp-content-link-color);
}

.jp-RenderedHTMLCommon a:visited {
  text-decoration: none;
  color: var(--jp-content-link-color);
}

/* Headings */

.jp-RenderedHTMLCommon h1,
.jp-RenderedHTMLCommon h2,
.jp-RenderedHTMLCommon h3,
.jp-RenderedHTMLCommon h4,
.jp-RenderedHTMLCommon h5,
.jp-RenderedHTMLCommon h6 {
  line-height: var(--jp-content-heading-line-height);
  font-weight: var(--jp-content-heading-font-weight);
  font-style: normal;
  margin: var(--jp-content-heading-margin-top) 0
    var(--jp-content-heading-margin-bottom) 0;
}

.jp-RenderedHTMLCommon h1:first-child,
.jp-RenderedHTMLCommon h2:first-child,
.jp-RenderedHTMLCommon h3:first-child,
.jp-RenderedHTMLCommon h4:first-child,
.jp-RenderedHTMLCommon h5:first-child,
.jp-RenderedHTMLCommon h6:first-child {
  margin-top: calc(0.5 * var(--jp-content-heading-margin-top));
}

.jp-RenderedHTMLCommon h1:last-child,
.jp-RenderedHTMLCommon h2:last-child,
.jp-RenderedHTMLCommon h3:last-child,
.jp-RenderedHTMLCommon h4:last-child,
.jp-RenderedHTMLCommon h5:last-child,
.jp-RenderedHTMLCommon h6:last-child {
  margin-bottom: calc(0.5 * var(--jp-content-heading-margin-bottom));
}

.jp-RenderedHTMLCommon h1 {
  font-size: var(--jp-content-font-size5);
}

.jp-RenderedHTMLCommon h2 {
  font-size: var(--jp-content-font-size4);
}

.jp-RenderedHTMLCommon h3 {
  font-size: var(--jp-content-font-size3);
}

.jp-RenderedHTMLCommon h4 {
  font-size: var(--jp-content-font-size2);
}

.jp-RenderedHTMLCommon h5 {
  font-size: var(--jp-content-font-size1);
}

.jp-RenderedHTMLCommon h6 {
  font-size: var(--jp-content-font-size0);
}

/* Lists */

.jp-RenderedHTMLCommon ul:not(.list-inline),
.jp-RenderedHTMLCommon ol:not(.list-inline) {
  padding-left: 2em;
}

.jp-RenderedHTMLCommon ul {
  list-style: disc;
}

.jp-RenderedHTMLCommon ul ul {
  list-style: square;
}

.jp-RenderedHTMLCommon ul ul ul {
  list-style: circle;
}

.jp-RenderedHTMLCommon ol {
  list-style: decimal;
}

.jp-RenderedHTMLCommon ol ol {
  list-style: upper-alpha;
}

.jp-RenderedHTMLCommon ol ol ol {
  list-style: lower-alpha;
}

.jp-RenderedHTMLCommon ol ol ol ol {
  list-style: lower-roman;
}

.jp-RenderedHTMLCommon ol ol ol ol ol {
  list-style: decimal;
}

.jp-RenderedHTMLCommon ol,
.jp-RenderedHTMLCommon ul {
  margin-bottom: 1em;
}

.jp-RenderedHTMLCommon ul ul,
.jp-RenderedHTMLCommon ul ol,
.jp-RenderedHTMLCommon ol ul,
.jp-RenderedHTMLCommon ol ol {
  margin-bottom: 0em;
}

.jp-RenderedHTMLCommon hr {
  color: var(--jp-border-color2);
  background-color: var(--jp-border-color1);
  margin-top: 1em;
  margin-bottom: 1em;
}

.jp-RenderedHTMLCommon > pre {
  margin: 1.5em 2em;
}

.jp-RenderedHTMLCommon pre,
.jp-RenderedHTMLCommon code {
  border: 0;
  background-color: var(--jp-layout-color0);
  color: var(--jp-content-font-color1);
  font-family: var(--jp-code-font-family);
  font-size: inherit;
  line-height: var(--jp-code-line-height);
  padding: 0;
  white-space: pre-wrap;
}

.jp-RenderedHTMLCommon :not(pre) > code {
  background-color: var(--jp-layout-color2);
  padding: 1px 5px;
}

/* Tables */

.jp-RenderedHTMLCommon table {
  border-collapse: collapse;
  border-spacing: 0;
  border: none;
  color: var(--jp-ui-font-color1);
  font-size: var(--jp-ui-font-size1);
  table-layout: fixed;
  margin-left: auto;
  margin-right: auto;
}

.jp-RenderedHTMLCommon thead {
  border-bottom: var(--jp-border-width) solid var(--jp-border-color1);
  vertical-align: bottom;
}

.jp-RenderedHTMLCommon td,
.jp-RenderedHTMLCommon th,
.jp-RenderedHTMLCommon tr {
  vertical-align: middle;
  padding: 0.5em 0.5em;
  line-height: normal;
  white-space: normal;
  max-width: none;
  border: none;
}

.jp-RenderedMarkdown.jp-RenderedHTMLCommon td,
.jp-RenderedMarkdown.jp-RenderedHTMLCommon th {
  max-width: none;
}

:not(.jp-RenderedMarkdown).jp-RenderedHTMLCommon td,
:not(.jp-RenderedMarkdown).jp-RenderedHTMLCommon th,
:not(.jp-RenderedMarkdown).jp-RenderedHTMLCommon tr {
  text-align: right;
}

.jp-RenderedHTMLCommon th {
  font-weight: bold;
}

.jp-RenderedHTMLCommon tbody tr:nth-child(odd) {
  background: var(--jp-layout-color0);
}

.jp-RenderedHTMLCommon tbody tr:nth-child(even) {
  background: var(--jp-rendermime-table-row-background);
}

.jp-RenderedHTMLCommon tbody tr:hover {
  background: var(--jp-rendermime-table-row-hover-background);
}

.jp-RenderedHTMLCommon table {
  margin-bottom: 1em;
}

.jp-RenderedHTMLCommon p {
  text-align: left;
  margin: 0px;
}

.jp-RenderedHTMLCommon p {
  margin-bottom: 1em;
}

.jp-RenderedHTMLCommon img {
  -moz-force-broken-image-icon: 1;
}

/* Restrict to direct children as other images could be nested in other content. */
.jp-RenderedHTMLCommon > img {
  display: block;
  margin-left: 0;
  margin-right: 0;
  margin-bottom: 1em;
}

/* Change color behind transparent images if they need it... */
[data-jp-theme-light='false'] .jp-RenderedImage img.jp-needs-light-background {
  background-color: var(--jp-inverse-layout-color1);
}
[data-jp-theme-light='true'] .jp-RenderedImage img.jp-needs-dark-background {
  background-color: var(--jp-inverse-layout-color1);
}
/* ...or leave it untouched if they don't */
[data-jp-theme-light='false'] .jp-RenderedImage img.jp-needs-dark-background {
}
[data-jp-theme-light='true'] .jp-RenderedImage img.jp-needs-light-background {
}

.jp-RenderedHTMLCommon img,
.jp-RenderedImage img,
.jp-RenderedHTMLCommon svg,
.jp-RenderedSVG svg {
  max-width: 100%;
  height: auto;
}

.jp-RenderedHTMLCommon img.jp-mod-unconfined,
.jp-RenderedImage img.jp-mod-unconfined,
.jp-RenderedHTMLCommon svg.jp-mod-unconfined,
.jp-RenderedSVG svg.jp-mod-unconfined {
  max-width: none;
}

.jp-RenderedHTMLCommon .alert {
  padding: var(--jp-notebook-padding);
  border: var(--jp-border-width) solid transparent;
  border-radius: var(--jp-border-radius);
  margin-bottom: 1em;
}

.jp-RenderedHTMLCommon .alert-info {
  color: var(--jp-info-color0);
  background-color: var(--jp-info-color3);
  border-color: var(--jp-info-color2);
}
.jp-RenderedHTMLCommon .alert-info hr {
  border-color: var(--jp-info-color3);
}
.jp-RenderedHTMLCommon .alert-info > p:last-child,
.jp-RenderedHTMLCommon .alert-info > ul:last-child {
  margin-bottom: 0;
}

.jp-RenderedHTMLCommon .alert-warning {
  color: var(--jp-warn-color0);
  background-color: var(--jp-warn-color3);
  border-color: var(--jp-warn-color2);
}
.jp-RenderedHTMLCommon .alert-warning hr {
  border-color: var(--jp-warn-color3);
}
.jp-RenderedHTMLCommon .alert-warning > p:last-child,
.jp-RenderedHTMLCommon .alert-warning > ul:last-child {
  margin-bottom: 0;
}

.jp-RenderedHTMLCommon .alert-success {
  color: var(--jp-success-color0);
  background-color: var(--jp-success-color3);
  border-color: var(--jp-success-color2);
}
.jp-RenderedHTMLCommon .alert-success hr {
  border-color: var(--jp-success-color3);
}
.jp-RenderedHTMLCommon .alert-success > p:last-child,
.jp-RenderedHTMLCommon .alert-success > ul:last-child {
  margin-bottom: 0;
}

.jp-RenderedHTMLCommon .alert-danger {
  color: var(--jp-error-color0);
  background-color: var(--jp-error-color3);
  border-color: var(--jp-error-color2);
}
.jp-RenderedHTMLCommon .alert-danger hr {
  border-color: var(--jp-error-color3);
}
.jp-RenderedHTMLCommon .alert-danger > p:last-child,
.jp-RenderedHTMLCommon .alert-danger > ul:last-child {
  margin-bottom: 0;
}

.jp-RenderedHTMLCommon blockquote {
  margin: 1em 2em;
  padding: 0 1em;
  border-left: 5px solid var(--jp-border-color2);
}

a.jp-InternalAnchorLink {
  visibility: hidden;
  margin-left: 8px;
  color: var(--md-blue-800);
}

h1:hover .jp-InternalAnchorLink,
h2:hover .jp-InternalAnchorLink,
h3:hover .jp-InternalAnchorLink,
h4:hover .jp-InternalAnchorLink,
h5:hover .jp-InternalAnchorLink,
h6:hover .jp-InternalAnchorLink {
  visibility: visible;
}

.jp-RenderedHTMLCommon kbd {
  background-color: var(--jp-rendermime-table-row-background);
  border: 1px solid var(--jp-border-color0);
  border-bottom-color: var(--jp-border-color2);
  border-radius: 3px;
  box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.25);
  display: inline-block;
  font-size: var(--jp-ui-font-size0);
  line-height: 1em;
  padding: 0.2em 0.5em;
}

/* Most direct children of .jp-RenderedHTMLCommon have a margin-bottom of 1.0.
 * At the bottom of cells this is a bit too much as there is also spacing
 * between cells. Going all the way to 0 gets too tight between markdown and
 * code cells.
 */
.jp-RenderedHTMLCommon > *:last-child {
  margin-bottom: 0.5em;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-MimeDocument {
  outline: none;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Variables
|----------------------------------------------------------------------------*/

:root {
  --jp-private-filebrowser-button-height: 28px;
  --jp-private-filebrowser-button-width: 48px;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-FileBrowser {
  display: flex;
  flex-direction: column;
  color: var(--jp-ui-font-color1);
  background: var(--jp-layout-color1);
  /* This is needed so that all font sizing of children done in ems is
   * relative to this base size */
  font-size: var(--jp-ui-font-size1);
}

.jp-FileBrowser-toolbar.jp-Toolbar {
  border-bottom: none;
  height: auto;
  margin: 8px 12px 0px 12px;
  padding: 0px;
  box-shadow: none;
  justify-content: flex-start;
}

.jp-BreadCrumbs {
  flex: 0 0 auto;
  margin: 8px 12px 8px 12px;
}

.jp-BreadCrumbs-item {
  margin: 0px 2px;
  padding: 0px 2px;
  border-radius: var(--jp-border-radius);
  cursor: pointer;
}

.jp-BreadCrumbs-item:hover {
  background-color: var(--jp-layout-color2);
}

.jp-BreadCrumbs-item:first-child {
  margin-left: 0px;
}

.jp-BreadCrumbs-item.jp-mod-dropTarget {
  background-color: var(--jp-brand-color2);
  opacity: 0.7;
}

/*-----------------------------------------------------------------------------
| Buttons
|----------------------------------------------------------------------------*/

.jp-FileBrowser-toolbar > .jp-Toolbar-item {
  flex: 0 0 auto;
  padding-left: 0px;
  padding-right: 2px;
}

.jp-FileBrowser-toolbar > .jp-Toolbar-item .jp-ToolbarButtonComponent {
  width: 40px;
}

.jp-FileBrowser-toolbar
  .jp-ToolbarButtonComponent[data-command='filebrowser:create-main-launcher'] {
  width: 72px;
  background: var(--jp-brand-color1);
}

.jp-FileBrowser-toolbar
  .jp-ToolbarButtonComponent[data-command='filebrowser:create-main-launcher']:hover,
.jp-FileBrowser-toolbar
  .jp-ToolbarButtonComponent[data-command='filebrowser:create-main-launcher']:focus-visible {
  background-color: var(--jp-brand-color0) !important;
}

.jp-FileBrowser-toolbar
  .jp-ToolbarButtonComponent[data-command='filebrowser:create-main-launcher']
  .jp-icon3 {
  fill: var(--jp-layout-color1);
}

/*-----------------------------------------------------------------------------
| Other styles
|----------------------------------------------------------------------------*/

.jp-FileDialog.jp-mod-conflict input {
  color: var(--jp-error-color1);
}

.jp-FileDialog .jp-new-name-title {
  margin-top: 12px;
}

.jp-LastModified-hidden {
  display: none;
}

.jp-FileBrowser-filterBox {
  padding: 0px;
  flex: 0 0 auto;
  margin: 8px 12px 0px 12px;
}

/*-----------------------------------------------------------------------------
| DirListing
|----------------------------------------------------------------------------*/

.jp-DirListing {
  flex: 1 1 auto;
  display: flex;
  flex-direction: column;
  outline: 0;
}

.jp-DirListing:focus-visible {
  outline: 1px solid var(--jp-brand-color1);
  outline-offset: -2px;
}

.jp-DirListing-header {
  flex: 0 0 auto;
  display: flex;
  flex-direction: row;
  overflow: hidden;
  border-top: var(--jp-border-width) solid var(--jp-border-color2);
  border-bottom: var(--jp-border-width) solid var(--jp-border-color1);
  box-shadow: var(--jp-toolbar-box-shadow);
  z-index: 2;
}

.jp-DirListing-headerItem {
  padding: 4px 12px 2px 12px;
  font-weight: 500;
}

.jp-DirListing-headerItem:hover {
  background: var(--jp-layout-color2);
}

.jp-DirListing-headerItem.jp-id-name {
  flex: 1 0 84px;
}

.jp-DirListing-headerItem.jp-id-modified {
  flex: 0 0 112px;
  border-left: var(--jp-border-width) solid var(--jp-border-color2);
  text-align: right;
}

.jp-id-narrow {
  display: none;
  flex: 0 0 5px;
  padding: 4px 4px;
  border-left: var(--jp-border-width) solid var(--jp-border-color2);
  text-align: right;
  color: var(--jp-border-color2);
}

.jp-DirListing-narrow .jp-id-narrow {
  display: block;
}

.jp-DirListing-narrow .jp-id-modified,
.jp-DirListing-narrow .jp-DirListing-itemModified {
  display: none;
}

.jp-DirListing-headerItem.jp-mod-selected {
  font-weight: 600;
}

/* increase specificity to override bundled default */
.jp-DirListing-content {
  flex: 1 1 auto;
  margin: 0;
  padding: 0;
  list-style-type: none;
  overflow: auto;
  background-color: var(--jp-layout-color1);
}

.jp-DirListing-content mark {
  color: var(--jp-ui-font-color0);
  background-color: transparent;
  font-weight: bold;
}

.jp-DirListing-content .jp-DirListing-item.jp-mod-selected mark {
  color: var(--jp-ui-inverse-font-color0);
}

/* Style the directory listing content when a user drops a file to upload */
.jp-DirListing.jp-mod-native-drop .jp-DirListing-content {
  outline: 5px dashed rgba(128, 128, 128, 0.5);
  outline-offset: -10px;
  cursor: copy;
}

.jp-DirListing-item {
  display: flex;
  flex-direction: row;
  padding: 4px 12px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.jp-DirListing-item[data-is-dot] {
  opacity: 75%;
}

.jp-DirListing-item.jp-mod-selected {
  color: var(--jp-ui-inverse-font-color1);
  background: var(--jp-brand-color1);
}

.jp-DirListing-item.jp-mod-dropTarget {
  background: var(--jp-brand-color3);
}

.jp-DirListing-item:hover:not(.jp-mod-selected) {
  background: var(--jp-layout-color2);
}

.jp-DirListing-itemIcon {
  flex: 0 0 20px;
  margin-right: 4px;
}

.jp-DirListing-itemText {
  flex: 1 0 64px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  user-select: none;
}

.jp-DirListing-itemModified {
  flex: 0 0 125px;
  text-align: right;
}

.jp-DirListing-editor {
  flex: 1 0 64px;
  outline: none;
  border: none;
  color: var(--jp-ui-font-color1);
  background-color: var(--jp-layout-color1);
}

.jp-DirListing-item.jp-mod-running .jp-DirListing-itemIcon:before {
  color: var(--jp-success-color1);
  content: '\25CF';
  font-size: 8px;
  position: absolute;
  left: -8px;
}

.jp-DirListing-item.jp-mod-running.jp-mod-selected
  .jp-DirListing-itemIcon:before {
  color: var(--jp-ui-inverse-font-color1);
}

.jp-DirListing-item.lm-mod-drag-image,
.jp-DirListing-item.jp-mod-selected.lm-mod-drag-image {
  font-size: var(--jp-ui-font-size1);
  padding-left: 4px;
  margin-left: 4px;
  width: 160px;
  background-color: var(--jp-ui-inverse-font-color2);
  box-shadow: var(--jp-elevation-z2);
  border-radius: 0px;
  color: var(--jp-ui-font-color1);
  transform: translateX(-40%) translateY(-58%);
}

.jp-Document {
  min-width: 120px;
  min-height: 120px;
  outline: none;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Private CSS variables
|----------------------------------------------------------------------------*/

:root {
}

/*-----------------------------------------------------------------------------
| Main OutputArea
| OutputArea has a list of Outputs
|----------------------------------------------------------------------------*/

.jp-OutputArea {
  overflow-y: auto;
}

.jp-OutputArea-child {
  display: flex;
  flex-direction: row;
}

body[data-format='mobile'] .jp-OutputArea-child {
  flex-direction: column;
}

.jp-OutputPrompt {
  flex: 0 0 var(--jp-cell-prompt-width);
  color: var(--jp-cell-outprompt-font-color);
  font-family: var(--jp-cell-prompt-font-family);
  padding: var(--jp-code-padding);
  letter-spacing: var(--jp-cell-prompt-letter-spacing);
  line-height: var(--jp-code-line-height);
  font-size: var(--jp-code-font-size);
  border: var(--jp-border-width) solid transparent;
  opacity: var(--jp-cell-prompt-opacity);
  /* Right align prompt text, don't wrap to handle large prompt numbers */
  text-align: right;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  /* Disable text selection */
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

body[data-format='mobile'] .jp-OutputPrompt {
  flex: 0 0 auto;
  text-align: left;
}

.jp-OutputArea-output {
  height: auto;
  overflow: auto;
  user-select: text;
  -moz-user-select: text;
  -webkit-user-select: text;
  -ms-user-select: text;
}

.jp-OutputArea-child .jp-OutputArea-output {
  flex-grow: 1;
  flex-shrink: 1;
}

body[data-format='mobile'] .jp-OutputArea-child .jp-OutputArea-output {
  margin-left: var(--jp-notebook-padding);
}

/**
 * Isolated output.
 */
.jp-OutputArea-output.jp-mod-isolated {
  width: 100%;
  display: block;
}

/*
When drag events occur, `p-mod-override-cursor` is added to the body.
Because iframes steal all cursor events, the following two rules are necessary
to suppress pointer events while resize drags are occurring. There may be a
better solution to this problem.
*/
body.lm-mod-override-cursor .jp-OutputArea-output.jp-mod-isolated {
  position: relative;
}

body.lm-mod-override-cursor .jp-OutputArea-output.jp-mod-isolated:before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: transparent;
}

/* pre */

.jp-OutputArea-output pre {
  border: none;
  margin: 0px;
  padding: 0px;
  overflow-x: auto;
  overflow-y: auto;
  word-break: break-all;
  word-wrap: break-word;
  white-space: pre-wrap;
}

/* tables */

.jp-OutputArea-output.jp-RenderedHTMLCommon table {
  margin-left: 0;
  margin-right: 0;
}

/* description lists */

.jp-OutputArea-output dl,
.jp-OutputArea-output dt,
.jp-OutputArea-output dd {
  display: block;
}

.jp-OutputArea-output dl {
  width: 100%;
  overflow: hidden;
  padding: 0;
  margin: 0;
}

.jp-OutputArea-output dt {
  font-weight: bold;
  float: left;
  width: 20%;
  padding: 0;
  margin: 0;
}

.jp-OutputArea-output dd {
  float: left;
  width: 80%;
  padding: 0;
  margin: 0;
}

.jp-TrimmedOutputs a {
  margin: 10px;
  text-decoration: none;
  cursor: pointer;
}

/* Hide the gutter in case of
 *  - nested output areas (e.g. in the case of output widgets)
 *  - mirrored output areas
 */
.jp-OutputArea .jp-OutputArea .jp-OutputArea-prompt {
  display: none;
}

/* Hide empty lines in the output area, for instance due to cleared widgets */
.jp-OutputArea-prompt:empty {
  padding: 0;
  border: 0;
}

/*-----------------------------------------------------------------------------
| executeResult is added to any Output-result for the display of the object
| returned by a cell
|----------------------------------------------------------------------------*/

.jp-OutputArea-output.jp-OutputArea-executeResult {
  margin-left: 0px;
  flex: 1 1 auto;
}

/* Text output with the Out[] prompt needs a top padding to match the
 * alignment of the Out[] prompt itself.
 */
.jp-OutputArea-executeResult .jp-RenderedText.jp-OutputArea-output {
  padding-top: var(--jp-code-padding);
  border-top: var(--jp-border-width) solid transparent;
}

/*-----------------------------------------------------------------------------
| The Stdin output
|----------------------------------------------------------------------------*/

.jp-Stdin-prompt {
  color: var(--jp-content-font-color0);
  padding-right: var(--jp-code-padding);
  vertical-align: baseline;
  flex: 0 0 auto;
}

.jp-Stdin-input {
  font-family: var(--jp-code-font-family);
  font-size: inherit;
  color: inherit;
  background-color: inherit;
  width: 42%;
  min-width: 200px;
  /* make sure input baseline aligns with prompt */
  vertical-align: baseline;
  /* padding + margin = 0.5em between prompt and cursor */
  padding: 0em 0.25em;
  margin: 0em 0.25em;
  flex: 0 0 70%;
}

.jp-Stdin-input::placeholder {
  opacity: 0;
}

.jp-Stdin-input:focus {
  box-shadow: none;
}

.jp-Stdin-input:focus::placeholder {
  opacity: 1;
}

/*-----------------------------------------------------------------------------
| Output Area View
|----------------------------------------------------------------------------*/

.jp-LinkedOutputView .jp-OutputArea {
  height: 100%;
  display: block;
}

.jp-LinkedOutputView .jp-OutputArea-output:only-child {
  height: 100%;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

.jp-Collapser {
  flex: 0 0 var(--jp-cell-collapser-width);
  padding: 0px;
  margin: 0px;
  border: none;
  outline: none;
  background: transparent;
  border-radius: var(--jp-border-radius);
  opacity: 1;
}

.jp-Collapser-child {
  display: block;
  width: 100%;
  box-sizing: border-box;
  /* height: 100% doesn't work because the height of its parent is computed from content */
  position: absolute;
  top: 0px;
  bottom: 0px;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Header/Footer
|----------------------------------------------------------------------------*/

/* Hidden by zero height by default */
.jp-CellHeader,
.jp-CellFooter {
  height: 0px;
  width: 100%;
  padding: 0px;
  margin: 0px;
  border: none;
  outline: none;
  background: transparent;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Input
|----------------------------------------------------------------------------*/

/* All input areas */
.jp-InputArea {
  display: flex;
  flex-direction: row;
  overflow: hidden;
}

body[data-format='mobile'] .jp-InputArea {
  flex-direction: column;
}

.jp-InputArea-editor {
  flex: 1 1 auto;
  overflow: hidden;
}

.jp-InputArea-editor {
  /* This is the non-active, default styling */
  border: var(--jp-border-width) solid var(--jp-cell-editor-border-color);
  border-radius: 0px;
  background: var(--jp-cell-editor-background);
}

body[data-format='mobile'] .jp-InputArea-editor {
  margin-left: var(--jp-notebook-padding);
}

.jp-InputPrompt {
  flex: 0 0 var(--jp-cell-prompt-width);
  color: var(--jp-cell-inprompt-font-color);
  font-family: var(--jp-cell-prompt-font-family);
  padding: var(--jp-code-padding);
  letter-spacing: var(--jp-cell-prompt-letter-spacing);
  opacity: var(--jp-cell-prompt-opacity);
  line-height: var(--jp-code-line-height);
  font-size: var(--jp-code-font-size);
  border: var(--jp-border-width) solid transparent;
  opacity: var(--jp-cell-prompt-opacity);
  /* Right align prompt text, don't wrap to handle large prompt numbers */
  text-align: right;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  /* Disable text selection */
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

body[data-format='mobile'] .jp-InputPrompt {
  flex: 0 0 auto;
  text-align: left;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Placeholder
|----------------------------------------------------------------------------*/

.jp-Placeholder {
  display: flex;
  flex-direction: row;
  flex: 1 1 auto;
}

.jp-Placeholder-prompt {
  box-sizing: border-box;
}

.jp-Placeholder-content {
  flex: 1 1 auto;
  border: none;
  background: transparent;
  height: 20px;
  box-sizing: border-box;
}

.jp-Placeholder-content .jp-MoreHorizIcon {
  width: 32px;
  height: 16px;
  border: 1px solid transparent;
  border-radius: var(--jp-border-radius);
}

.jp-Placeholder-content .jp-MoreHorizIcon:hover {
  border: 1px solid var(--jp-border-color1);
  box-shadow: 0px 0px 2px 0px rgba(0, 0, 0, 0.25);
  background-color: var(--jp-layout-color0);
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Private CSS variables
|----------------------------------------------------------------------------*/

:root {
  --jp-private-cell-scrolling-output-offset: 5px;
}

/*-----------------------------------------------------------------------------
| Cell
|----------------------------------------------------------------------------*/

.jp-Cell {
  padding: var(--jp-cell-padding);
  margin: 0px;
  border: none;
  outline: none;
  background: transparent;
}

/*-----------------------------------------------------------------------------
| Common input/output
|----------------------------------------------------------------------------*/

.jp-Cell-inputWrapper,
.jp-Cell-outputWrapper {
  display: flex;
  flex-direction: row;
  padding: 0px;
  margin: 0px;
  /* Added to reveal the box-shadow on the input and output collapses. */
  overflow: visible;
}

/* Only input/output areas inside cells */
.jp-Cell-inputArea,
.jp-Cell-outputArea {
  flex: 1 1 auto;
}

/*-----------------------------------------------------------------------------
| Collapser
|----------------------------------------------------------------------------*/

/* Make the output collapser disappear when there is not output, but do so
 * in a manner that leaves it in the layout and preserves its width.
 */
.jp-Cell.jp-mod-noOutputs .jp-Cell-outputCollapser {
  border: none !important;
  background: transparent !important;
}

.jp-Cell:not(.jp-mod-noOutputs) .jp-Cell-outputCollapser {
  min-height: var(--jp-cell-collapser-min-height);
}

/*-----------------------------------------------------------------------------
| Output
|----------------------------------------------------------------------------*/

/* Put a space between input and output when there IS output */
.jp-Cell:not(.jp-mod-noOutputs) .jp-Cell-outputWrapper {
  margin-top: 5px;
}

.jp-CodeCell.jp-mod-outputsScrolled .jp-Cell-outputArea {
  overflow-y: auto;
  max-height: 24em;
  margin-left: var(--jp-private-cell-scrolling-output-offset);
}

.jp-CodeCell.jp-mod-outputsScrolled .jp-Cell-outputArea::after {
  content: ' ';
  box-shadow: inset 0 0 6px 2px rgb(0 0 0 / 30%);
  width: 100%;
  height: 100%;
  position: sticky;
  bottom: 0;
  top: 0;
  margin-top: -50%;
  float: left;
  display: block;
  pointer-events: none;
}

.jp-CodeCell.jp-mod-outputsScrolled .jp-OutputArea-child {
  padding-top: 6px;
}

.jp-CodeCell.jp-mod-outputsScrolled .jp-OutputArea-prompt {
  flex: 0 0
    calc(
      var(--jp-cell-prompt-width) -
        var(--jp-private-cell-scrolling-output-offset)
    );
}

/*-----------------------------------------------------------------------------
| CodeCell
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| MarkdownCell
|----------------------------------------------------------------------------*/

.jp-MarkdownOutput {
  flex: 1 1 auto;
  margin-top: 0;
  margin-bottom: 0;
  padding-left: var(--jp-code-padding);
}

.jp-MarkdownOutput.jp-RenderedHTMLCommon {
  overflow: auto;
}

/* collapseHeadingButton (show always if hiddenCellsButton is _not_ shown) */
.jp-collapseHeadingButton {
  display: none;
  min-height: var(--jp-cell-collapser-min-height);
  font-size: var(--jp-code-font-size);
  position: absolute;
  right: 0;
  top: 0;
  bottom: 0;
  background-color: transparent;
  background-size: 25px;
  background-repeat: no-repeat;
  background-position-x: center;
  background-position-y: top;
  background-image: var(--jp-icon-caret-down);
  border: none;
  cursor: pointer;
}

.jp-collapseHeadingButton:hover {
  background-color: var(--jp-layout-color2);
}

.jp-collapseHeadingButton.jp-mod-collapsed {
  background-image: var(--jp-icon-caret-right);
}

:is(.jp-MarkdownCell:hover, .jp-mod-active) .jp-collapseHeadingButton {
  display: flex;
}

/*
 set the container font size to match that of content
 so that the nested collapse buttons have the right size
*/
.jp-MarkdownCell .jp-InputPrompt {
  font-size: var(--jp-content-font-size1);
}

/*
  Align collapseHeadingButton with cell top header
  The font sizes are identical to the ones in packages/rendermime/style/base.css
*/
.jp-mod-rendered .jp-collapseHeadingButton[data-heading-level='1'] {
  font-size: var(--jp-content-font-size5);
  background-position-y: calc(0.3 * var(--jp-content-font-size5));
}

.jp-mod-rendered .jp-collapseHeadingButton[data-heading-level='2'] {
  font-size: var(--jp-content-font-size4);
  background-position-y: calc(0.3 * var(--jp-content-font-size4));
}

.jp-mod-rendered .jp-collapseHeadingButton[data-heading-level='3'] {
  font-size: var(--jp-content-font-size3);
  background-position-y: calc(0.3 * var(--jp-content-font-size3));
}

.jp-mod-rendered .jp-collapseHeadingButton[data-heading-level='4'] {
  font-size: var(--jp-content-font-size2);
  background-position-y: calc(0.3 * var(--jp-content-font-size2));
}

.jp-mod-rendered .jp-collapseHeadingButton[data-heading-level='5'] {
  font-size: var(--jp-content-font-size1);
  background-position-y: top;
}

.jp-mod-rendered .jp-collapseHeadingButton[data-heading-level='6'] {
  font-size: var(--jp-content-font-size0);
  background-position-y: top;
}

.jp-showHiddenCellsButton {
  margin-left: calc(var(--jp-cell-prompt-width) + 2 * var(--jp-code-padding));
  margin-top: var(--jp-code-padding);
  border: 1px solid var(--jp-border-color2);
  background-color: var(--jp-border-color3) !important;
  color: var(--jp-content-font-color0) !important;
}

.jp-showHiddenCellsButton:hover {
  background-color: var(--jp-border-color2) !important;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Variables
|----------------------------------------------------------------------------*/

:root {
  --jp-notebook-toolbar-padding: 2px 5px 2px 2px;
}

/*-----------------------------------------------------------------------------

/*-----------------------------------------------------------------------------
| Styles
|----------------------------------------------------------------------------*/

.jp-NotebookPanel-toolbar {
  padding: var(--jp-notebook-toolbar-padding);
}

.jp-Toolbar-item.jp-Notebook-toolbarCellType .jp-select-wrapper.jp-mod-focused {
  border: none;
  box-shadow: none;
}

.jp-Notebook-toolbarCellTypeDropdown select {
  height: 24px;
  font-size: var(--jp-ui-font-size1);
  line-height: 14px;
  border-radius: 0;
  display: block;
}

.jp-Notebook-toolbarCellTypeDropdown span {
  top: 5px !important;
}

.jp-Toolbar-responsive-popup {
  position: absolute;
  height: fit-content;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: flex-end;
  border-bottom: var(--jp-border-width) solid var(--jp-toolbar-border-color);
  box-shadow: var(--jp-toolbar-box-shadow);
  background: var(--jp-toolbar-background);
  min-height: var(--jp-toolbar-micro-height);
  padding: var(--jp-notebook-toolbar-padding);
  z-index: 1;
  right: 0px;
  top: 0px;
}

.jp-Toolbar > .jp-Toolbar-responsive-opener {
  margin-left: auto;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Variables
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------

/*-----------------------------------------------------------------------------
| Styles
|----------------------------------------------------------------------------*/

.jp-Notebook-ExecutionIndicator {
  position: relative;
  display: inline-block;
  height: 100%;
  z-index: 9997;
}

.jp-Notebook-ExecutionIndicator-tooltip {
  visibility: hidden;
  height: auto;
  width: max-content;
  width: -moz-max-content;
  background-color: var(--jp-layout-color2);
  color: var(--jp-ui-font-color1);
  text-align: justify;
  border-radius: 6px;
  padding: 0 5px;
  position: fixed;
  display: table;
}

.jp-Notebook-ExecutionIndicator-tooltip.up {
  transform: translateX(-50%) translateY(-100%) translateY(-32px);
}

.jp-Notebook-ExecutionIndicator-tooltip.down {
  transform: translateX(calc(-100% + 16px)) translateY(5px);
}

.jp-Notebook-ExecutionIndicator-tooltip.hidden {
  display: none;
}

.jp-Notebook-ExecutionIndicator:hover .jp-Notebook-ExecutionIndicator-tooltip {
  visibility: visible;
}

.jp-Notebook-ExecutionIndicator span {
  font-size: var(--jp-ui-font-size1);
  font-family: var(--jp-ui-font-family);
  color: var(--jp-ui-font-color1);
  line-height: 24px;
  display: block;
}

.jp-Notebook-ExecutionIndicator-progress-bar {
  display: flex;
  justify-content: center;
  height: 100%;
}

/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Private CSS variables
|----------------------------------------------------------------------------*/

:root {
  --jp-private-notebook-dragImage-width: 304px;
  --jp-private-notebook-dragImage-height: 36px;
  --jp-private-notebook-selected-color: var(--md-blue-400);
  --jp-private-notebook-active-color: var(--md-green-400);
}

/*-----------------------------------------------------------------------------
| Imports
|----------------------------------------------------------------------------*/

/*-----------------------------------------------------------------------------
| Notebook
|----------------------------------------------------------------------------*/

.jp-NotebookPanel {
  display: block;
  height: 100%;
}

.jp-NotebookPanel.jp-Document {
  min-width: 240px;
  min-height: 120px;
}

.jp-Notebook {
  padding: var(--jp-notebook-padding);
  outline: none;
  overflow: auto;
  background: var(--jp-layout-color0);
}

.jp-Notebook.jp-mod-scrollPastEnd::after {
  display: block;
  content: '';
  min-height: var(--jp-notebook-scroll-padding);
}

.jp-MainAreaWidget-ContainStrict .jp-Notebook * {
  contain: strict;
}

.jp-Notebook .jp-Cell {
  overflow: visible;
}

.jp-Notebook .jp-Cell .jp-InputPrompt {
  cursor: move;
  float: left;
}

/*-----------------------------------------------------------------------------
| Notebook state related styling
|
| The notebook and cells each have states, here are the possibilities:
|
| - Notebook
|   - Command
|   - Edit
| - Cell
|   - None
|   - Active (only one can be active)
|   - Selected (the cells actions are applied to)
|   - Multiselected (when multiple selected, the cursor)
|   - No outputs
|----------------------------------------------------------------------------*/

/* Command or edit modes */

.jp-Notebook .jp-Cell:not(.jp-mod-active) .jp-InputPrompt {
  opacity: var(--jp-cell-prompt-not-active-opacity);
  color: var(--jp-cell-prompt-not-active-font-color);
}

.jp-Notebook .jp-Cell:not(.jp-mod-active) .jp-OutputPrompt {
  opacity: var(--jp-cell-prompt-not-active-opacity);
  color: var(--jp-cell-prompt-not-active-font-color);
}

/* cell is active */
.jp-Notebook .jp-Cell.jp-mod-active .jp-Collapser {
  background: var(--jp-brand-color1);
}

/* cell is dirty */
.jp-Notebook .jp-Cell.jp-mod-dirty .jp-InputPrompt {
  color: var(--jp-warn-color1);
}
.jp-Notebook .jp-Cell.jp-mod-dirty .jp-InputPrompt:before {
  color: var(--jp-warn-color1);
  content: '•';
}

.jp-Notebook .jp-Cell.jp-mod-active.jp-mod-dirty .jp-Collapser {
  background: var(--jp-warn-color1);
}

/* collapser is hovered */
.jp-Notebook .jp-Cell .jp-Collapser:hover {
  box-shadow: var(--jp-elevation-z2);
  background: var(--jp-brand-color1);
  opacity: var(--jp-cell-collapser-not-active-hover-opacity);
}

/* cell is active and collapser is hovered */
.jp-Notebook .jp-Cell.jp-mod-active .jp-Collapser:hover {
  background: var(--jp-brand-color0);
  opacity: 1;
}

/* Command mode */

.jp-Notebook.jp-mod-commandMode .jp-Cell.jp-mod-selected {
  background: var(--jp-notebook-multiselected-color);
}

.jp-Notebook.jp-mod-commandMode
  .jp-Cell.jp-mod-active.jp-mod-selected:not(.jp-mod-multiSelected) {
  background: transparent;
}

/* Edit mode */

.jp-Notebook.jp-mod-editMode .jp-Cell.jp-mod-active .jp-InputArea-editor {
  border: var(--jp-border-width) solid var(--jp-cell-editor-active-border-color);
  box-shadow: var(--jp-input-box-shadow);
  background-color: var(--jp-cell-editor-active-background);
}

/*-----------------------------------------------------------------------------
| Notebook drag and drop
|----------------------------------------------------------------------------*/

.jp-Notebook-cell.jp-mod-dropSource {
  opacity: 0.5;
}

.jp-Notebook-cell.jp-mod-dropTarget,
.jp-Notebook.jp-mod-commandMode
  .jp-Notebook-cell.jp-mod-active.jp-mod-selected.jp-mod-dropTarget {
  border-top-color: var(--jp-private-notebook-selected-color);
  border-top-style: solid;
  border-top-width: 2px;
}

.jp-dragImage {
  display: block;
  flex-direction: row;
  width: var(--jp-private-notebook-dragImage-width);
  height: var(--jp-private-notebook-dragImage-height);
  border: var(--jp-border-width) solid var(--jp-cell-editor-border-color);
  background: var(--jp-cell-editor-background);
  overflow: visible;
}

.jp-dragImage-singlePrompt {
  box-shadow: 2px 2px 4px 0px rgba(0, 0, 0, 0.12);
}

.jp-dragImage .jp-dragImage-content {
  flex: 1 1 auto;
  z-index: 2;
  font-size: var(--jp-code-font-size);
  font-family: var(--jp-code-font-family);
  line-height: var(--jp-code-line-height);
  padding: var(--jp-code-padding);
  border: var(--jp-border-width) solid var(--jp-cell-editor-border-color);
  background: var(--jp-cell-editor-background-color);
  color: var(--jp-content-font-color3);
  text-align: left;
  margin: 4px 4px 4px 0px;
}

.jp-dragImage .jp-dragImage-prompt {
  flex: 0 0 auto;
  min-width: 36px;
  color: var(--jp-cell-inprompt-font-color);
  padding: var(--jp-code-padding);
  padding-left: 12px;
  font-family: var(--jp-cell-prompt-font-family);
  letter-spacing: var(--jp-cell-prompt-letter-spacing);
  line-height: 1.9;
  font-size: var(--jp-code-font-size);
  border: var(--jp-border-width) solid transparent;
}

.jp-dragImage-multipleBack {
  z-index: -1;
  position: absolute;
  height: 32px;
  width: 300px;
  top: 8px;
  left: 8px;
  background: var(--jp-layout-color2);
  border: var(--jp-border-width) solid var(--jp-input-border-color);
  box-shadow: 2px 2px 4px 0px rgba(0, 0, 0, 0.12);
}

/*-----------------------------------------------------------------------------
| Cell toolbar
|----------------------------------------------------------------------------*/

.jp-NotebookTools {
  display: block;
  min-width: var(--jp-sidebar-min-width);
  color: var(--jp-ui-font-color1);
  background: var(--jp-layout-color1);
  /* This is needed so that all font sizing of children done in ems is
    * relative to this base size */
  font-size: var(--jp-ui-font-size1);
  overflow: auto;
}

.jp-NotebookTools-tool {
  padding: 0px 12px 0 12px;
}

.jp-ActiveCellTool {
  padding: 12px;
  background-color: var(--jp-layout-color1);
  border-top: none !important;
}

.jp-ActiveCellTool .jp-InputArea-prompt {
  flex: 0 0 auto;
  padding-left: 0px;
}

.jp-ActiveCellTool .jp-InputArea-editor {
  flex: 1 1 auto;
  background: var(--jp-cell-editor-background);
  border-color: var(--jp-cell-editor-border-color);
}

.jp-ActiveCellTool .jp-InputArea-editor .CodeMirror {
  background: transparent;
}

.jp-MetadataEditorTool {
  flex-direction: column;
  padding: 12px 0px 12px 0px;
}

.jp-RankedPanel > :not(:first-child) {
  margin-top: 12px;
}

.jp-KeySelector select.jp-mod-styled {
  font-size: var(--jp-ui-font-size1);
  color: var(--jp-ui-font-color0);
  border: var(--jp-border-width) solid var(--jp-border-color1);
}

.jp-KeySelector label,
.jp-MetadataEditorTool label {
  line-height: 1.4;
}

.jp-NotebookTools .jp-select-wrapper {
  margin-top: 4px;
  margin-bottom: 0px;
}

.jp-NotebookTools .jp-Collapse {
  margin-top: 16px;
}

/*-----------------------------------------------------------------------------
| Presentation Mode (.jp-mod-presentationMode)
|----------------------------------------------------------------------------*/

.jp-mod-presentationMode .jp-Notebook {
  --jp-content-font-size1: var(--jp-content-presentation-font-size1);
  --jp-code-font-size: var(--jp-code-presentation-font-size);
}

.jp-mod-presentationMode .jp-Notebook .jp-Cell .jp-InputPrompt,
.jp-mod-presentationMode .jp-Notebook .jp-Cell .jp-OutputPrompt {
  flex: 0 0 110px;
}

/*-----------------------------------------------------------------------------
| Side-by-side Mode (.jp-mod-sideBySide)
|----------------------------------------------------------------------------*/
:root {
  --jp-side-by-side-output-size: 1fr;
  --jp-side-by-side-resized-cell: var(--jp-side-by-side-output-size);
}

.jp-mod-sideBySide.jp-Notebook .jp-Notebook-cell {
  margin-top: 3em;
  margin-bottom: 3em;
  margin-left: 5%;
  margin-right: 5%;
}

.jp-mod-sideBySide.jp-Notebook .jp-CodeCell {
  display: grid;
  grid-template-columns: minmax(0, 1fr) min-content minmax(
      0,
      var(--jp-side-by-side-output-size)
    );
  grid-template-rows: auto minmax(0, 1fr) auto;
  grid-template-areas:
    'header header header'
    'input handle output'
    'footer footer footer';
}

.jp-mod-sideBySide.jp-Notebook .jp-CodeCell.jp-mod-resizedCell {
  grid-template-columns: minmax(0, 1fr) min-content minmax(
      0,
      var(--jp-side-by-side-resized-cell)
    );
}

.jp-mod-sideBySide.jp-Notebook .jp-CodeCell .jp-CellHeader {
  grid-area: header;
}

.jp-mod-sideBySide.jp-Notebook .jp-CodeCell .jp-Cell-inputWrapper {
  grid-area: input;
}

.jp-mod-sideBySide.jp-Notebook .jp-CodeCell .jp-Cell-outputWrapper {
  /* overwrite the default margin (no vertical separation needed in side by side move */
  margin-top: 0;
  grid-area: output;
}

.jp-mod-sideBySide.jp-Notebook .jp-CodeCell .jp-CellFooter {
  grid-area: footer;
}

.jp-mod-sideBySide.jp-Notebook .jp-CodeCell .jp-CellResizeHandle {
  grid-area: handle;
  user-select: none;
  display: block;
  height: 100%;
  cursor: ew-resize;
  padding: 0 var(--jp-cell-padding);
}

.jp-mod-sideBySide.jp-Notebook .jp-CodeCell .jp-CellResizeHandle::after {
  content: '';
  display: block;
  background: var(--jp-border-color2);
  height: 100%;
  width: 5px;
}

.jp-mod-sideBySide.jp-Notebook
  .jp-CodeCell.jp-mod-resizedCell
  .jp-CellResizeHandle::after {
  background: var(--jp-border-color0);
}

.jp-CellResizeHandle {
  display: none;
}

/*-----------------------------------------------------------------------------
| Placeholder
|----------------------------------------------------------------------------*/

.jp-Cell-Placeholder {
  padding-left: 55px;
}

.jp-Cell-Placeholder-wrapper {
  background: #fff;
  border: 1px solid;
  border-color: #e5e6e9 #dfe0e4 #d0d1d5;
  border-radius: 4px;
  -webkit-border-radius: 4px;
  margin: 10px 15px;
}

.jp-Cell-Placeholder-wrapper-inner {
  padding: 15px;
  position: relative;
}

.jp-Cell-Placeholder-wrapper-body {
  background-repeat: repeat;
  background-size: 50% auto;
}

.jp-Cell-Placeholder-wrapper-body div {
  background: #f6f7f8;
  background-image: -webkit-linear-gradient(
    left,
    #f6f7f8 0%,
    #edeef1 20%,
    #f6f7f8 40%,
    #f6f7f8 100%
  );
  background-repeat: no-repeat;
  background-size: 800px 104px;
  height: 104px;
  position: relative;
}

.jp-Cell-Placeholder-wrapper-body div {
  position: absolute;
  right: 15px;
  left: 15px;
  top: 15px;
}

div.jp-Cell-Placeholder-h1 {
  top: 20px;
  height: 20px;
  left: 15px;
  width: 150px;
}

div.jp-Cell-Placeholder-h2 {
  left: 15px;
  top: 50px;
  height: 10px;
  width: 100px;
}

div.jp-Cell-Placeholder-content-1,
div.jp-Cell-Placeholder-content-2,
div.jp-Cell-Placeholder-content-3 {
  left: 15px;
  right: 15px;
  height: 10px;
}

div.jp-Cell-Placeholder-content-1 {
  top: 100px;
}

div.jp-Cell-Placeholder-content-2 {
  top: 120px;
}

div.jp-Cell-Placeholder-content-3 {
  top: 140px;
}

</style>

    <style type="text/css">
/*-----------------------------------------------------------------------------
| Copyright (c) Jupyter Development Team.
| Distributed under the terms of the Modified BSD License.
|----------------------------------------------------------------------------*/

/*
The following CSS variables define the main, public API for styling JupyterLab.
These variables should be used by all plugins wherever possible. In other
words, plugins should not define custom colors, sizes, etc unless absolutely
necessary. This enables users to change the visual theme of JupyterLab
by changing these variables.

Many variables appear in an ordered sequence (0,1,2,3). These sequences
are designed to work well together, so for example, `--jp-border-color1` should
be used with `--jp-layout-color1`. The numbers have the following meanings:

* 0: super-primary, reserved for special emphasis
* 1: primary, most important under normal situations
* 2: secondary, next most important under normal situations
* 3: tertiary, next most important under normal situations

Throughout JupyterLab, we are mostly following principles from Google's
Material Design when selecting colors. We are not, however, following
all of MD as it is not optimized for dense, information rich UIs.
*/

:root {
  /* Elevation
   *
   * We style box-shadows using Material Design's idea of elevation. These particular numbers are taken from here:
   *
   * https://github.com/material-components/material-components-web
   * https://material-components-web.appspot.com/elevation.html
   */

  --jp-shadow-base-lightness: 0;
  --jp-shadow-umbra-color: rgba(
    var(--jp-shadow-base-lightness),
    var(--jp-shadow-base-lightness),
    var(--jp-shadow-base-lightness),
    0.2
  );
  --jp-shadow-penumbra-color: rgba(
    var(--jp-shadow-base-lightness),
    var(--jp-shadow-base-lightness),
    var(--jp-shadow-base-lightness),
    0.14
  );
  --jp-shadow-ambient-color: rgba(
    var(--jp-shadow-base-lightness),
    var(--jp-shadow-base-lightness),
    var(--jp-shadow-base-lightness),
    0.12
  );
  --jp-elevation-z0: none;
  --jp-elevation-z1: 0px 2px 1px -1px var(--jp-shadow-umbra-color),
    0px 1px 1px 0px var(--jp-shadow-penumbra-color),
    0px 1px 3px 0px var(--jp-shadow-ambient-color);
  --jp-elevation-z2: 0px 3px 1px -2px var(--jp-shadow-umbra-color),
    0px 2px 2px 0px var(--jp-shadow-penumbra-color),
    0px 1px 5px 0px var(--jp-shadow-ambient-color);
  --jp-elevation-z4: 0px 2px 4px -1px var(--jp-shadow-umbra-color),
    0px 4px 5px 0px var(--jp-shadow-penumbra-color),
    0px 1px 10px 0px var(--jp-shadow-ambient-color);
  --jp-elevation-z6: 0px 3px 5px -1px var(--jp-shadow-umbra-color),
    0px 6px 10px 0px var(--jp-shadow-penumbra-color),
    0px 1px 18px 0px var(--jp-shadow-ambient-color);
  --jp-elevation-z8: 0px 5px 5px -3px var(--jp-shadow-umbra-color),
    0px 8px 10px 1px var(--jp-shadow-penumbra-color),
    0px 3px 14px 2px var(--jp-shadow-ambient-color);
  --jp-elevation-z12: 0px 7px 8px -4px var(--jp-shadow-umbra-color),
    0px 12px 17px 2px var(--jp-shadow-penumbra-color),
    0px 5px 22px 4px var(--jp-shadow-ambient-color);
  --jp-elevation-z16: 0px 8px 10px -5px var(--jp-shadow-umbra-color),
    0px 16px 24px 2px var(--jp-shadow-penumbra-color),
    0px 6px 30px 5px var(--jp-shadow-ambient-color);
  --jp-elevation-z20: 0px 10px 13px -6px var(--jp-shadow-umbra-color),
    0px 20px 31px 3px var(--jp-shadow-penumbra-color),
    0px 8px 38px 7px var(--jp-shadow-ambient-color);
  --jp-elevation-z24: 0px 11px 15px -7px var(--jp-shadow-umbra-color),
    0px 24px 38px 3px var(--jp-shadow-penumbra-color),
    0px 9px 46px 8px var(--jp-shadow-ambient-color);

  /* Borders
   *
   * The following variables, specify the visual styling of borders in JupyterLab.
   */

  --jp-border-width: 1px;
  --jp-border-color0: var(--md-grey-400);
  --jp-border-color1: var(--md-grey-400);
  --jp-border-color2: var(--md-grey-300);
  --jp-border-color3: var(--md-grey-200);
  --jp-inverse-border-color: var(--md-grey-600);
  --jp-border-radius: 2px;

  /* UI Fonts
   *
   * The UI font CSS variables are used for the typography all of the JupyterLab
   * user interface elements that are not directly user generated content.
   *
   * The font sizing here is done assuming that the body font size of --jp-ui-font-size1
   * is applied to a parent element. When children elements, such as headings, are sized
   * in em all things will be computed relative to that body size.
   */

  --jp-ui-font-scale-factor: 1.2;
  --jp-ui-font-size0: 0.83333em;
  --jp-ui-font-size1: 13px; /* Base font size */
  --jp-ui-font-size2: 1.2em;
  --jp-ui-font-size3: 1.44em;

  --jp-ui-font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica,
    Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol';

  /*
   * Use these font colors against the corresponding main layout colors.
   * In a light theme, these go from dark to light.
   */

  /* Defaults use Material Design specification */
  --jp-ui-font-color0: rgba(0, 0, 0, 1);
  --jp-ui-font-color1: rgba(0, 0, 0, 0.87);
  --jp-ui-font-color2: rgba(0, 0, 0, 0.54);
  --jp-ui-font-color3: rgba(0, 0, 0, 0.38);

  /*
   * Use these against the brand/accent/warn/error colors.
   * These will typically go from light to darker, in both a dark and light theme.
   */

  --jp-ui-inverse-font-color0: rgba(255, 255, 255, 1);
  --jp-ui-inverse-font-color1: rgba(255, 255, 255, 1);
  --jp-ui-inverse-font-color2: rgba(255, 255, 255, 0.7);
  --jp-ui-inverse-font-color3: rgba(255, 255, 255, 0.5);

  /* Content Fonts
   *
   * Content font variables are used for typography of user generated content.
   *
   * The font sizing here is done assuming that the body font size of --jp-content-font-size1
   * is applied to a parent element. When children elements, such as headings, are sized
   * in em all things will be computed relative to that body size.
   */

  --jp-content-line-height: 1.6;
  --jp-content-font-scale-factor: 1.2;
  --jp-content-font-size0: 0.83333em;
  --jp-content-font-size1: 14px; /* Base font size */
  --jp-content-font-size2: 1.2em;
  --jp-content-font-size3: 1.44em;
  --jp-content-font-size4: 1.728em;
  --jp-content-font-size5: 2.0736em;

  /* This gives a magnification of about 125% in presentation mode over normal. */
  --jp-content-presentation-font-size1: 17px;

  --jp-content-heading-line-height: 1;
  --jp-content-heading-margin-top: 1.2em;
  --jp-content-heading-margin-bottom: 0.8em;
  --jp-content-heading-font-weight: 500;

  /* Defaults use Material Design specification */
  --jp-content-font-color0: rgba(0, 0, 0, 1);
  --jp-content-font-color1: rgba(0, 0, 0, 0.87);
  --jp-content-font-color2: rgba(0, 0, 0, 0.54);
  --jp-content-font-color3: rgba(0, 0, 0, 0.38);

  --jp-content-link-color: var(--md-blue-700);

  --jp-content-font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI',
    Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',
    'Segoe UI Symbol';

  /*
   * Code Fonts
   *
   * Code font variables are used for typography of code and other monospaces content.
   */

  --jp-code-font-size: 13px;
  --jp-code-line-height: 1.3077; /* 17px for 13px base */
  --jp-code-padding: 5px; /* 5px for 13px base, codemirror highlighting needs integer px value */
  --jp-code-font-family-default: Menlo, Consolas, 'DejaVu Sans Mono', monospace;
  --jp-code-font-family: var(--jp-code-font-family-default);

  /* This gives a magnification of about 125% in presentation mode over normal. */
  --jp-code-presentation-font-size: 16px;

  /* may need to tweak cursor width if you change font size */
  --jp-code-cursor-width0: 1.4px;
  --jp-code-cursor-width1: 2px;
  --jp-code-cursor-width2: 4px;

  /* Layout
   *
   * The following are the main layout colors use in JupyterLab. In a light
   * theme these would go from light to dark.
   */

  --jp-layout-color0: white;
  --jp-layout-color1: white;
  --jp-layout-color2: var(--md-grey-200);
  --jp-layout-color3: var(--md-grey-400);
  --jp-layout-color4: var(--md-grey-600);

  /* Inverse Layout
   *
   * The following are the inverse layout colors use in JupyterLab. In a light
   * theme these would go from dark to light.
   */

  --jp-inverse-layout-color0: #111111;
  --jp-inverse-layout-color1: var(--md-grey-900);
  --jp-inverse-layout-color2: var(--md-grey-800);
  --jp-inverse-layout-color3: var(--md-grey-700);
  --jp-inverse-layout-color4: var(--md-grey-600);

  /* Brand/accent */

  --jp-brand-color0: var(--md-blue-900);
  --jp-brand-color1: var(--md-blue-700);
  --jp-brand-color2: var(--md-blue-300);
  --jp-brand-color3: var(--md-blue-100);
  --jp-brand-color4: var(--md-blue-50);

  --jp-accent-color0: var(--md-green-900);
  --jp-accent-color1: var(--md-green-700);
  --jp-accent-color2: var(--md-green-300);
  --jp-accent-color3: var(--md-green-100);

  /* State colors (warn, error, success, info) */

  --jp-warn-color0: var(--md-orange-900);
  --jp-warn-color1: var(--md-orange-700);
  --jp-warn-color2: var(--md-orange-300);
  --jp-warn-color3: var(--md-orange-100);

  --jp-error-color0: var(--md-red-900);
  --jp-error-color1: var(--md-red-700);
  --jp-error-color2: var(--md-red-300);
  --jp-error-color3: var(--md-red-100);

  --jp-success-color0: var(--md-green-900);
  --jp-success-color1: var(--md-green-700);
  --jp-success-color2: var(--md-green-300);
  --jp-success-color3: var(--md-green-100);

  --jp-info-color0: var(--md-cyan-900);
  --jp-info-color1: var(--md-cyan-700);
  --jp-info-color2: var(--md-cyan-300);
  --jp-info-color3: var(--md-cyan-100);

  /* Cell specific styles */

  --jp-cell-padding: 5px;

  --jp-cell-collapser-width: 8px;
  --jp-cell-collapser-min-height: 20px;
  --jp-cell-collapser-not-active-hover-opacity: 0.6;

  --jp-cell-editor-background: var(--md-grey-100);
  --jp-cell-editor-border-color: var(--md-grey-300);
  --jp-cell-editor-box-shadow: inset 0 0 2px var(--md-blue-300);
  --jp-cell-editor-active-background: var(--jp-layout-color0);
  --jp-cell-editor-active-border-color: var(--jp-brand-color1);

  --jp-cell-prompt-width: 64px;
  --jp-cell-prompt-font-family: var(--jp-code-font-family-default);
  --jp-cell-prompt-letter-spacing: 0px;
  --jp-cell-prompt-opacity: 1;
  --jp-cell-prompt-not-active-opacity: 0.5;
  --jp-cell-prompt-not-active-font-color: var(--md-grey-700);
  /* A custom blend of MD grey and blue 600
   * See https://meyerweb.com/eric/tools/color-blend/#546E7A:1E88E5:5:hex */
  --jp-cell-inprompt-font-color: #307fc1;
  /* A custom blend of MD grey and orange 600
   * https://meyerweb.com/eric/tools/color-blend/#546E7A:F4511E:5:hex */
  --jp-cell-outprompt-font-color: #bf5b3d;

  /* Notebook specific styles */

  --jp-notebook-padding: 10px;
  --jp-notebook-select-background: var(--jp-layout-color1);
  --jp-notebook-multiselected-color: var(--md-blue-50);

  /* The scroll padding is calculated to fill enough space at the bottom of the
  notebook to show one single-line cell (with appropriate padding) at the top
  when the notebook is scrolled all the way to the bottom. We also subtract one
  pixel so that no scrollbar appears if we have just one single-line cell in the
  notebook. This padding is to enable a 'scroll past end' feature in a notebook.
  */
  --jp-notebook-scroll-padding: calc(
    100% - var(--jp-code-font-size) * var(--jp-code-line-height) -
      var(--jp-code-padding) - var(--jp-cell-padding) - 1px
  );

  /* Rendermime styles */

  --jp-rendermime-error-background: #fdd;
  --jp-rendermime-table-row-background: var(--md-grey-100);
  --jp-rendermime-table-row-hover-background: var(--md-light-blue-50);

  /* Dialog specific styles */

  --jp-dialog-background: rgba(0, 0, 0, 0.25);

  /* Console specific styles */

  --jp-console-padding: 10px;

  /* Toolbar specific styles */

  --jp-toolbar-border-color: var(--jp-border-color1);
  --jp-toolbar-micro-height: 8px;
  --jp-toolbar-background: var(--jp-layout-color1);
  --jp-toolbar-box-shadow: 0px 0px 2px 0px rgba(0, 0, 0, 0.24);
  --jp-toolbar-header-margin: 4px 4px 0px 4px;
  --jp-toolbar-active-background: var(--md-grey-300);

  /* Statusbar specific styles */

  --jp-statusbar-height: 24px;

  /* Input field styles */

  --jp-input-box-shadow: inset 0 0 2px var(--md-blue-300);
  --jp-input-active-background: var(--jp-layout-color1);
  --jp-input-hover-background: var(--jp-layout-color1);
  --jp-input-background: var(--md-grey-100);
  --jp-input-border-color: var(--jp-inverse-border-color);
  --jp-input-active-border-color: var(--jp-brand-color1);
  --jp-input-active-box-shadow-color: rgba(19, 124, 189, 0.3);

  /* General editor styles */

  --jp-editor-selected-background: #d9d9d9;
  --jp-editor-selected-focused-background: #d7d4f0;
  --jp-editor-cursor-color: var(--jp-ui-font-color0);

  /* Code mirror specific styles */

  --jp-mirror-editor-keyword-color: #008000;
  --jp-mirror-editor-atom-color: #88f;
  --jp-mirror-editor-number-color: #080;
  --jp-mirror-editor-def-color: #00f;
  --jp-mirror-editor-variable-color: var(--md-grey-900);
  --jp-mirror-editor-variable-2-color: #05a;
  --jp-mirror-editor-variable-3-color: #085;
  --jp-mirror-editor-punctuation-color: #05a;
  --jp-mirror-editor-property-color: #05a;
  --jp-mirror-editor-operator-color: #aa22ff;
  --jp-mirror-editor-comment-color: #408080;
  --jp-mirror-editor-string-color: #ba2121;
  --jp-mirror-editor-string-2-color: #708;
  --jp-mirror-editor-meta-color: #aa22ff;
  --jp-mirror-editor-qualifier-color: #555;
  --jp-mirror-editor-builtin-color: #008000;
  --jp-mirror-editor-bracket-color: #997;
  --jp-mirror-editor-tag-color: #170;
  --jp-mirror-editor-attribute-color: #00c;
  --jp-mirror-editor-header-color: blue;
  --jp-mirror-editor-quote-color: #090;
  --jp-mirror-editor-link-color: #00c;
  --jp-mirror-editor-error-color: #f00;
  --jp-mirror-editor-hr-color: #999;

  /*
    RTC user specific colors.
    These colors are used for the cursor, username in the editor,
    and the icon of the user.
  */

  --jp-collaborator-color1: #ffad8e;
  --jp-collaborator-color2: #dac83d;
  --jp-collaborator-color3: #72dd76;
  --jp-collaborator-color4: #00e4d0;
  --jp-collaborator-color5: #45d4ff;
  --jp-collaborator-color6: #e2b1ff;
  --jp-collaborator-color7: #ff9de6;

  /* Vega extension styles */

  --jp-vega-background: white;

  /* Sidebar-related styles */

  --jp-sidebar-min-width: 250px;

  /* Search-related styles */

  --jp-search-toggle-off-opacity: 0.5;
  --jp-search-toggle-hover-opacity: 0.8;
  --jp-search-toggle-on-opacity: 1;
  --jp-search-selected-match-background-color: rgb(245, 200, 0);
  --jp-search-selected-match-color: black;
  --jp-search-unselected-match-background-color: var(
    --jp-inverse-layout-color0
  );
  --jp-search-unselected-match-color: var(--jp-ui-inverse-font-color0);

  /* Icon colors that work well with light or dark backgrounds */
  --jp-icon-contrast-color0: var(--md-purple-600);
  --jp-icon-contrast-color1: var(--md-green-600);
  --jp-icon-contrast-color2: var(--md-pink-600);
  --jp-icon-contrast-color3: var(--md-blue-600);

  /* File or activity icons and switch semantic variables */
  --jp-jupyter-icon-color: #f37626;
  --jp-notebook-icon-color: #f37626;
  --jp-json-icon-color: var(--md-orange-700);
  --jp-console-icon-background-color: var(--md-blue-700);
  --jp-console-icon-color: white;
  --jp-terminal-icon-background-color: var(--md-grey-800);
  --jp-terminal-icon-color: var(--md-grey-200);
  --jp-text-editor-icon-color: var(--md-grey-700);
  --jp-inspector-icon-color: var(--md-grey-700);
  --jp-switch-color: var(--md-grey-400);
  --jp-switch-true-position-color: var(--md-orange-900);
}
</style>

<style type="text/css">
/* Force rendering true colors when outputting to pdf */
* {
  -webkit-print-color-adjust: exact;
}

/* Misc */
a.anchor-link {
  display: none;
}

/* Input area styling */
.jp-InputArea {
  overflow: hidden;
}

.jp-InputArea-editor {
  overflow: hidden;
}

.CodeMirror.cm-s-jupyter .highlight pre {
/* weird, but --jp-code-padding defined to be 5px but 4px horizontal padding is hardcoded for pre.CodeMirror-line */
  padding: var(--jp-code-padding) 4px;
  margin: 0;

  font-family: inherit;
  font-size: inherit;
  line-height: inherit;
  color: inherit;

}

.jp-OutputArea-output pre {
  line-height: inherit;
  font-family: inherit;
}

.jp-RenderedText pre {
  color: var(--jp-content-font-color1);
  font-size: var(--jp-code-font-size);
}

/* Using table instead of flexbox so that we can use break-inside property */
/* CSS rules under this comment should not be required anymore after we move to the JupyterLab 4.0 CSS */


.jp-CodeCell.jp-mod-outputsScrolled .jp-OutputArea-prompt {
  min-width: calc(
    var(--jp-cell-prompt-width) - var(--jp-private-cell-scrolling-output-offset)
  );
}

.jp-OutputArea-child {
  display: table;
  width: 100%;
}

.jp-OutputPrompt {
  display: table-cell;
  vertical-align: top;
  min-width: var(--jp-cell-prompt-width);
}

body[data-format='mobile'] .jp-OutputPrompt {
  display: table-row;
}

.jp-OutputArea-output {
  display: table-cell;
  width: 100%;
}

body[data-format='mobile'] .jp-OutputArea-child .jp-OutputArea-output {
  display: table-row;
}

.jp-OutputArea-output.jp-OutputArea-executeResult {
  width: 100%;
}

/* Hiding the collapser by default */
.jp-Collapser {
  display: none;
}

@page {
    margin: 0.5in; /* Margin for each printed piece of paper */
}

@media print {
  .jp-Cell-inputWrapper,
  .jp-Cell-outputWrapper {
    display: block;
  }

  .jp-OutputArea-child {
    break-inside: avoid-page;
  }
}
</style>

<!-- Load mathjax -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/latest.js?config=TeX-AMS_CHTML-full,Safe"> </script>
    <!-- MathJax configuration -->
    <script type="text/x-mathjax-config">
    init_mathjax = function() {
        if (window.MathJax) {
        // MathJax loaded
            MathJax.Hub.Config({
                TeX: {
                    equationNumbers: {
                    autoNumber: "AMS",
                    useLabelIds: true
                    }
                },
                tex2jax: {
                    inlineMath: [ ['$','$'], ["\\(","\\)"] ],
                    displayMath: [ ['$$','$$'], ["\\[","\\]"] ],
                    processEscapes: true,
                    processEnvironments: true
                },
                displayAlign: 'center',
                CommonHTML: {
                    linebreaks: {
                    automatic: true
                    }
                }
            });

            MathJax.Hub.Queue(["Typeset", MathJax.Hub]);
        }
    }
    init_mathjax();
    </script>
    <!-- End of mathjax configuration --></head>
<body class="jp-Notebook" data-jp-theme-light="true" data-jp-theme-name="JupyterLab Light">
<div  class="jp-Cell jp-CodeCell jp-Notebook-cell jp-mod-noOutputs  ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[1]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-ipython3"><pre><span></span><span class="kn">import</span> <span class="nn">pandas</span> <span class="k">as</span> <span class="nn">pd</span>
<span class="kn">import</span> <span class="nn">glob</span>
<span class="kn">import</span> <span class="nn">numpy</span> <span class="k">as</span> <span class="nn">np</span>
<span class="kn">import</span> <span class="nn">re</span>
</pre></div>

     </div>
</div>
</div>
</div>

</div><div  class="jp-Cell jp-CodeCell jp-Notebook-cell jp-mod-noOutputs  ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[2]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-ipython3"><pre><span></span><span class="kn">import</span> <span class="nn">matplotlib</span>
<span class="n">matplotlib</span><span class="o">.</span><span class="n">rcParams</span><span class="p">[</span><span class="s2">&quot;svg.fonttype&quot;</span><span class="p">]</span> <span class="o">=</span> <span class="s2">&quot;none&quot;</span>
<span class="n">matplotlib</span><span class="o">.</span><span class="n">rcParams</span><span class="p">[</span><span class="s2">&quot;text.usetex&quot;</span><span class="p">]</span> <span class="o">=</span> <span class="kc">False</span>
<span class="kn">import</span> <span class="nn">matplotlib.pyplot</span> <span class="k">as</span> <span class="nn">plt</span>
</pre></div>

     </div>
</div>
</div>
</div>

</div>
<div  class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h1 id="Scenario-1:-return-a-list-most-similar-region-sets-and-their-similarity-score-to-a-query-metadata-label-(l2r)">Scenario 1: return a list most similar region sets and their similarity score to a query metadata label (l2r)<a class="anchor-link" href="#Scenario-1:-return-a-list-most-similar-region-sets-and-their-similarity-score-to-a-query-metadata-label-(l2r)">&#182;</a></h1>
</div>
</div>
</div>
</div><div  class="jp-Cell jp-CodeCell jp-Notebook-cell jp-mod-noOutputs  ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[3]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-ipython3"><pre><span></span><span class="c1"># Path to the pre-calculated distance file between label embedding and region set embeddings</span>
<span class="n">path_simfile</span> <span class="o">=</span> <span class="s1">&#39;./distance_l2r.csv&#39;</span>
<span class="n">distance</span> <span class="o">=</span> <span class="n">pd</span><span class="o">.</span><span class="n">read_csv</span><span class="p">(</span><span class="n">path_simfile</span><span class="p">)</span>
<span class="n">distance</span><span class="o">.</span><span class="n">file_label</span> <span class="o">=</span> <span class="n">distance</span><span class="o">.</span><span class="n">file_label</span><span class="o">.</span><span class="n">str</span><span class="o">.</span><span class="n">lower</span><span class="p">()</span>
<span class="n">distance</span><span class="o">.</span><span class="n">search_term</span> <span class="o">=</span> <span class="n">distance</span><span class="o">.</span><span class="n">search_term</span><span class="o">.</span><span class="n">str</span><span class="o">.</span><span class="n">lower</span><span class="p">()</span>
<span class="n">distance</span> <span class="o">=</span> <span class="n">distance</span><span class="o">.</span><span class="n">drop_duplicates</span><span class="p">()</span>
</pre></div>

     </div>
</div>
</div>
</div>

</div><div  class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[4]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-ipython3"><pre><span></span><span class="c1"># Print the search terms (labels)</span>
<span class="nb">print</span><span class="p">(</span><span class="n">distance</span><span class="o">.</span><span class="n">search_term</span><span class="o">.</span><span class="n">unique</span><span class="p">())</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">
<div class="jp-OutputArea-child">
    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>


<div class="jp-RenderedText jp-OutputArea-output" data-mime-type="text/plain">
<pre>[&#39;h3k4me3&#39; &#39;h3k27me3&#39; &#39;h3k27ac&#39; &#39;h3k4me1&#39; &#39;h3k9me3&#39; &#39;h3k4me2&#39; &#39;h3k9ac&#39;
 &#39;h3k79me2&#39; &#39;h4k20me1&#39; &#39;h3k9me2&#39; &#39;h3k9me1&#39;]
</pre>
</div>
</div>

</div>

</div>

</div><div  class="jp-Cell jp-CodeCell jp-Notebook-cell jp-mod-noOutputs  ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[5]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-ipython3"><pre><span></span><span class="k">def</span> <span class="nf">S1</span><span class="p">(</span><span class="n">searchterm</span><span class="p">,</span> <span class="n">distance</span><span class="p">):</span>
    <span class="n">nof</span> <span class="o">=</span> <span class="nb">len</span><span class="p">(</span><span class="n">distance</span><span class="p">[</span><span class="n">distance</span><span class="o">.</span><span class="n">file_label</span><span class="o">.</span><span class="n">str</span><span class="o">.</span><span class="n">contains</span><span class="p">(</span><span class="n">searchterm</span><span class="p">)])</span>
    <span class="n">df</span> <span class="o">=</span> <span class="n">distance</span><span class="p">[</span><span class="n">distance</span><span class="o">.</span><span class="n">search_term</span> <span class="o">==</span> <span class="n">searchterm</span><span class="p">]</span><span class="o">.</span><span class="n">sort_values</span><span class="p">(</span><span class="n">by</span><span class="o">=</span><span class="p">[</span><span class="s1">&#39;score&#39;</span><span class="p">],</span> <span class="n">ascending</span> <span class="o">=</span> <span class="kc">False</span><span class="p">)[</span><span class="mi">0</span><span class="p">:</span><span class="mi">10</span><span class="p">]</span>
    <span class="n">df</span> <span class="o">=</span> <span class="n">df</span><span class="o">.</span><span class="n">sort_values</span><span class="p">(</span><span class="n">by</span><span class="o">=</span><span class="p">[</span><span class="s1">&#39;score&#39;</span><span class="p">],</span> <span class="n">ascending</span><span class="o">=</span><span class="kc">True</span><span class="p">)</span>
    <span class="n">df</span><span class="p">[</span><span class="s1">&#39;color&#39;</span><span class="p">]</span><span class="o">=</span><span class="s1">&#39;gray&#39;</span>
    <span class="n">df</span><span class="o">.</span><span class="n">loc</span><span class="p">[</span><span class="n">df</span><span class="o">.</span><span class="n">file_label</span><span class="o">.</span><span class="n">str</span><span class="o">.</span><span class="n">contains</span><span class="p">(</span><span class="n">searchterm</span><span class="p">),</span> <span class="s1">&#39;color&#39;</span><span class="p">]</span> <span class="o">=</span> <span class="s1">&#39;green&#39;</span>
    <span class="k">if</span><span class="p">(</span><span class="nb">len</span><span class="p">(</span><span class="n">df</span><span class="p">[</span><span class="n">df</span><span class="o">.</span><span class="n">color</span> <span class="o">==</span> <span class="s1">&#39;green&#39;</span><span class="p">])</span> <span class="o">==</span> <span class="n">nof</span><span class="p">):</span>
        <span class="n">df</span><span class="o">.</span><span class="n">loc</span><span class="p">[(</span><span class="n">df</span><span class="o">.</span><span class="n">color</span><span class="o">!=</span><span class="s1">&#39;green&#39;</span><span class="p">),</span> <span class="s1">&#39;color&#39;</span><span class="p">]</span> <span class="o">=</span> <span class="s1">&#39;gray&#39;</span>
        
    <span class="n">plt</span><span class="o">=</span> <span class="n">df</span><span class="o">.</span><span class="n">plot</span><span class="o">.</span><span class="n">barh</span><span class="p">(</span><span class="n">x</span><span class="o">=</span><span class="s1">&#39;filename&#39;</span><span class="p">,</span> <span class="n">y</span><span class="o">=</span><span class="s1">&#39;score&#39;</span><span class="p">,</span> <span class="n">figsize</span><span class="o">=</span><span class="p">(</span><span class="mi">10</span><span class="p">,</span><span class="mi">7</span><span class="p">),</span> <span class="n">fontsize</span><span class="o">=</span><span class="mi">16</span><span class="p">,</span> <span class="n">color</span><span class="o">=</span><span class="nb">list</span><span class="p">(</span><span class="n">df</span><span class="p">[</span><span class="s1">&#39;color&#39;</span><span class="p">]))</span>
    <span class="n">plt</span><span class="o">.</span><span class="n">set_xlabel</span><span class="p">(</span><span class="s1">&#39;Search term:&#39;</span> <span class="o">+</span> <span class="n">searchterm</span><span class="p">,</span> <span class="n">fontsize</span><span class="o">=</span><span class="mi">15</span><span class="p">)</span>

    <span class="n">plt</span><span class="o">.</span><span class="n">axis</span><span class="p">(</span><span class="n">xmin</span><span class="o">=</span><span class="mf">0.5</span><span class="p">,</span> <span class="n">xmax</span><span class="o">=</span><span class="mf">1.01</span><span class="p">)</span>
</pre></div>

     </div>
</div>
</div>
</div>

</div><div  class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[6]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">S1</span><span class="p">(</span><span class="s1">&#39;h3k4me2&#39;</span><span class="p">,</span> <span class="n">distance</span><span class="p">)</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">
<div class="jp-OutputArea-child">
    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>




<div class="jp-RenderedImage jp-OutputArea-output ">
<img src="data:image/png;base64,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
"
class="
jp-needs-light-background
"
>
</div>

</div>

</div>

</div>

</div>
<div  class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h1 id="Scenario-2:-return-a-list-of-most-similar-labels-and-thier-similarity-score-to-a-query-region-set-(r2l)">Scenario 2: return a list of most similar labels and thier similarity score to a query region set (r2l)<a class="anchor-link" href="#Scenario-2:-return-a-list-of-most-similar-labels-and-thier-similarity-score-to-a-query-region-set-(r2l)">&#182;</a></h1>
</div>
</div>
</div>
</div><div  class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[7]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-ipython3"><pre><span></span><span class="c1"># Print a sample of filenames</span>

<span class="nb">print</span><span class="p">(</span><span class="nb">list</span><span class="p">(</span><span class="nb">set</span><span class="p">(</span><span class="n">distance</span><span class="o">.</span><span class="n">filename</span><span class="p">))[</span><span class="mi">0</span><span class="p">:</span><span class="mi">4</span><span class="p">])</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">
<div class="jp-OutputArea-child">
    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>


<div class="jp-RenderedText jp-OutputArea-output" data-mime-type="text/plain">
<pre>[&#39;gse124683/gsm3540312_k562_h3k4me2_rep1_20181202_icell8_21.bed.gz&#39;, &#39;gse175750/gsm5345532_kdm4a-oe.h3k9ac.ls.rep2.bed.gz&#39;, &#39;gse161624/gsm4911338_etv6_ncoa2_tm_hcd34_h3k27ac_vs_total_peaks.narrowpeak.gz&#39;, &#39;gse124690/gsm3540920_k562_h3k4me2_rep2_20181202_icell8_215.bed.gz&#39;]
</pre>
</div>
</div>

</div>

</div>

</div><div  class="jp-Cell jp-CodeCell jp-Notebook-cell jp-mod-noOutputs  ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[8]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-ipython3"><pre><span></span><span class="k">def</span> <span class="nf">S2</span><span class="p">(</span><span class="n">file</span><span class="p">,</span> <span class="n">distance</span><span class="p">):</span>
    <span class="n">df</span> <span class="o">=</span> <span class="n">distance</span><span class="p">[</span><span class="n">distance</span><span class="o">.</span><span class="n">filename</span> <span class="o">==</span> <span class="n">file</span><span class="p">]</span><span class="o">.</span><span class="n">sort_values</span><span class="p">(</span><span class="n">by</span><span class="o">=</span><span class="p">[</span><span class="s1">&#39;score&#39;</span><span class="p">],</span> <span class="n">ascending</span> <span class="o">=</span> <span class="kc">False</span><span class="p">)[</span><span class="mi">0</span><span class="p">:</span><span class="mi">10</span><span class="p">]</span>
    <span class="n">df</span><span class="o">=</span> <span class="n">df</span><span class="o">.</span><span class="n">sort_values</span><span class="p">(</span><span class="n">by</span><span class="o">=</span><span class="p">[</span><span class="s1">&#39;score&#39;</span><span class="p">],</span> <span class="n">ascending</span> <span class="o">=</span> <span class="kc">True</span><span class="p">)</span>
    <span class="n">df</span><span class="p">[</span><span class="s1">&#39;color&#39;</span><span class="p">]</span><span class="o">=</span><span class="s1">&#39;green&#39;</span>
    <span class="n">plt</span><span class="o">=</span> <span class="n">df</span><span class="o">.</span><span class="n">plot</span><span class="o">.</span><span class="n">barh</span><span class="p">(</span><span class="n">x</span><span class="o">=</span><span class="s1">&#39;search_term&#39;</span><span class="p">,</span> <span class="n">y</span><span class="o">=</span><span class="s1">&#39;score&#39;</span><span class="p">,</span> <span class="n">figsize</span><span class="o">=</span><span class="p">(</span><span class="mi">8</span><span class="p">,</span><span class="mi">5</span><span class="p">),</span> <span class="n">fontsize</span><span class="o">=</span><span class="mi">16</span><span class="p">,</span> <span class="n">color</span><span class="o">=</span><span class="nb">list</span><span class="p">(</span><span class="n">df</span><span class="p">[</span><span class="s1">&#39;color&#39;</span><span class="p">]))</span>
    <span class="n">plt</span><span class="o">.</span><span class="n">set_xticks</span><span class="p">(</span><span class="n">np</span><span class="o">.</span><span class="n">arange</span><span class="p">(</span><span class="mf">0.5</span><span class="p">,</span><span class="mf">1.1</span><span class="p">,</span> <span class="mf">0.1</span><span class="p">))</span>
    <span class="n">plt</span><span class="o">.</span><span class="n">set_ylabel</span><span class="p">(</span><span class="s1">&#39;Similarity&#39;</span><span class="p">,</span> <span class="n">fontsize</span><span class="o">=</span><span class="mi">15</span><span class="p">)</span>
    <span class="n">plt</span><span class="o">.</span><span class="n">set_xlabel</span><span class="p">(</span><span class="n">file</span><span class="p">,</span> <span class="n">fontsize</span><span class="o">=</span><span class="mi">15</span><span class="p">)</span>
    
</pre></div>

     </div>
</div>
</div>
</div>

</div><div  class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[9]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">S2</span><span class="p">(</span><span class="s1">&#39;gse156613/gsm4743940_t52-h3k27ac_peaks.bed.gz&#39;</span><span class="p">,</span> <span class="n">distance</span><span class="p">)</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">
<div class="jp-OutputArea-child">
    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>




<div class="jp-RenderedImage jp-OutputArea-output ">
<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAkkAAAFICAYAAABENGoMAAAAOXRFWHRTb2Z0d2FyZQBNYXRwbG90bGliIHZlcnNpb24zLjQuMiwgaHR0cHM6Ly9tYXRwbG90bGliLm9yZy8rg+JYAAAACXBIWXMAAAsTAAALEwEAmpwYAABRNElEQVR4nO3defxd073/8debIFFjDEXdSDrQKsUVSs1aQwZqKuGqearhV7e0qm2I6qgUV1W5ShpT3ZorA4KYWsPXVNRcoWkoiSGCjD6/P9Y6su3s8x1PvkPyfj4e53HO2XvttT/7fM/3nM9Za+21FRGYmZmZ2cct1tUBmJmZmXVHTpLMzMzMKjhJMjMzM6vgJMnMzMysgpMkMzMzswpOkszMzMwq9OrqAGzBWXnllaN///5dHYaZmVmnePjhh6dExCqNqs9J0kKsf//+NDU1dXUYZmZmnULSy42sz91tZmZmZhWcJJmZmZlVcJJkZmZmVsFjkszMzHqo2bNnM2nSJGbMmNHVoXSq3r17s+aaa7LEEkss0P04STIzM+uhJk2axLLLLkv//v2R1NXhdIqIYOrUqUyaNIkBAwYs0H05SVqIPTz5YXTaovFPY2a2KIlTA4AZM2YsUgkSgCRWWmkl3njjjQW+rx45JknSCEkhqW6SJ2ktSTdKelnSB5KmSJogaVCpXP9c12HN1LW4pBMl3SHp35LelfSIpEMlLVYqOzHXV3X7XceP3szMbJ5FKUGq6axjXphbkpYBpgA/AiYBywGHA2Mk7RkR17Whrj65nlHAucB0YDDwv8Dnge8Wyu4OLFXafo9c5qa2H4aZmZl1hYU2SYqIp4BDi8skjQZeAg4G2pIkfQB8OiLeLCy7XdKKwHGSTomID/J+Hy1vLOmnwGvALW07CjMzs9Zr9BCLWrdeZ5kzZw69enWf1KRHdrcVDJA0WtL03K12Srn7qygi5gDvALObq1TSypIekPS0pH4RMbeUINU8RGo1WrmZuvoB2wFXRMTcwvLPSrpM0ku5O/Afki7IiVe5jm0k3SbpHUnvSXpc0qHlcmZmZp3tvffeY8iQIWywwQast956XH311Tz00EN85StfYYMNNmDTTTfl3XffZcaMGRx88MGsv/76bLTRRtx5550AjBw5km984xvssssu7Ljjjrz33nsccsghbLLJJmy00UbceOONXXZs3Sdda5/rgUuBs4FdgNOAf+ZlAOSkaTFSInM4sDbw7XoVSupPavF5C9gyIqY2s/9tgLeBV5sp801AwB9Ky9cgdQMen/f1aeAHwBhg80I8XweuBe4DjiR1IX4RWKuZfZqZmXWKcePGscYaazB69GgA3nnnHTbaaCOuvvpqNtlkE6ZNm0afPn0499xzAXjiiSd45pln2HHHHXnuuecA+Otf/8rf/vY3+vbtyw9+8AO23357LrnkEt5++2023XRTvva1r/GJT3yi04+tpydJZ0VELSEaL2l7YF8KSRJwBnBCfjwdGBYRt1dVJmkDYCzwGLBXRLxfb8eSdgL2BobnFqp6vgk8GhFPFBdGxN3A3YX6/gK8ANwjaaOIeFRpZNq5OZ7tIuLD2rE2E9cRwBEALN9MVGZmZg2w/vrrc+KJJ3LSSScxdOhQVlhhBVZffXU22WQTAJZbbjkA7r33Xo477jgAPv/5z7PWWmt9lCTtsMMO9O3bF4Bbb72Vm266iTPPPBNIZ/C98sorfOELX+jsQ+vxSdLo0vMngY1Ky84B/gisBhwAXClpr4i4uVRua+BM0uDqQ5pLfCStC1wFTAB+2Uy5zYB1qGi5krQkcGKOaS2gd2H1OsCj+X4t4BeFBKlZEXERcBGA1lDndiabmdkiZ+211+bhhx9mzJgxnHzyyey4446VZ59F1P9KKrYSRQTXXnst66yzzgKJty16+pik8jihmXw82SAiJkVEU0TcHBF7A/eTkqGywaQz4i5sIUH6NHAbaQD4bi20Ih1AGv90VcW6nwMjgMuBIcCmpLPgKBzDSvl+UjP7MDMz6zKTJ09m6aWXZv/99+fEE0/k/vvvZ/LkyTz00EMAvPvuu8yZM4ett96aK664AoDnnnuOV155pTIR2mmnnTjvvPM+SqoefXS+86E6TU9vSWqPJtI4oLLhwI7AWEmDIuK+cgFJawK3A9OAnSNiWr2dSFoK2AcYExFVM14NA0ZFxE8K2yxTKjMl33+q/uGYmZl1nSeeeILvfve7LLbYYiyxxBJccMEFRATHHXccH3zwAX369GH8+PEcffTRHHXUUay//vr06tWLkSNHstRS5RlzYPjw4Rx//PF86UtfIiLo378/N99c7vzpHItUkpQHcW8JvFixejZpjNFVwDhJgyPinsK2qzBvLNAOdRKfol2Avsw/YLtmaeY/y+7g0vPngInAYZIuiubaKs3MbJHX2afsQ2r52WmnneZbfv/998+3bOTIkfMtO+iggzjooIM+et6nTx8uvPDCRobYbgttkiRpBClJuY80R9FqpHmTNgX2q9omImZLGgZcQWpRGhIRd0nqQzrjrT9wCLBmblWq+XtFq9IBwFTmHzdVMw44UNITpAHbewBfKcUTko4nzel0R56x+w3gC8CqEXFqS6+DmZmZtc9CmyQBj5C61YaRzvN6DXgc2KqqK60mIuZI2g+4jDQ791DS+KPagPArKjbbjjSIG/io1WkQ8LuImFVnV8eRpgb4aX4+hnRm3oOleG6UtAOpO/D3efGLpAHpZmZmtoDIPTgLr4EDB0ZTU1NXh2FmZgvI008/3SWnxncHVccu6eGIGNioffT0s9vMzMwWaYtiY0dnHbOTJDMzsx6qd+/eTJ06dZFKlCKCqVOn0rt375YLd9DCPCbJzMxsobbmmmsyadIk3nijpROuFy69e/dmzTXXbLlgBzlJMjMz66GWWGIJBgwY0NVhLLTc3WZmZmZWwUmSmZmZWQUnSWZmZmYVnCSZmZmZVXCSZGZmZlbBSZKZmZlZBSdJZmZmZhWcJJmZmZlVcJJkZmZmVkGL0vVeFjVaQ8GRXR2FmdmiI071d2pXkvRwRAxsVH0LdUuSpBGSQlLdy69IWkvSjZJelvSBpCmSJkgaVCrXP9d1WCv2+y1Jz0iaKekVSadLWqIRx2RmZmadY6FOklppGWAK8CNgMHAoMB0YI2mPtlYm6WTgfGA0MBQ4DzgBuKBRAZuZmdmCt8hf4DYiniIlRh+RNBp4CTgYuK61dUnqDfwAGBURJ+TFt0kK4AxJZ+f9mZmZWTe3qLQkDZA0WtL03K12iqS6xx4Rc4B3gNnNVSppZUkPSHpaUj9gPVLL1NhS0XGAgN0K224i6RpJk3I337OSfiapT8V+dpd0X45/mqQHJe3a6qM3MzOzNltUWpKuBy4FzgZ2AU4D/pmXAZCTpsWAlYHDgbWBb9erUFJ/4BbgLWDLiJgqaaW8elap+Mx8v15hWT/gMWAk8C7wReAU4NPAsMJ+jgP+B7gBOJDUFfifQP+WDtrMzMzab1FJks6KiFpCNF7S9sC+FJIk4AzS2CFIiciwiLi9qjJJG5Baix4D9oqI9/Oq54EPgc1IiVnN5vm+b21BRFxbqE/AfcA0YJSkY3LStRzwM+D6iCiOj7qlVUdtZmZm7baodLeNLj1/ktSSU3QOsAmppWkscKWkoRV1bQ3cBYwHdi0kSETEdOAS4FhJwyStIGk74OfAXFICBYCk5ST9UtKLpJam2cBlpG65z+ViXyF1313U2gOVdISkJklNvN9yeTMzM6u2qLQkvVl6PhPoXVwQEZOASfnpzZImAGcCN5e2HUxKXC7MY5fKTgBWAq4kJTwzSN1o3wNeLZS7FPhaXvcY8B6wKenMuFpste67SbRSRFxETqq0hjxhh5mZWTstKi1J7dEEfLZi+XDgz8BYSVuUV0bEtNw19kngS8CqwCjSWKd74aOz4L4O/Coizo2IuyKiCfigVN2UfP+pBhyPmZmZtYGTpAp5EPeWwIsVq2cDewO3AuMkbVVVR0S8ERFPRMS7wH+TEp4/5dVLAYsz/9lzB5We/4U0PuqIdhyGmZmZdcCi0t1Wl6QRpAHV9wGvAauR5k3aFNivapuImC1pGHAFqUVpSETclevbJ9f3LLAisDuwD7BnTpiIiHck3Q+cIOlVUgJ1CKUWo4h4N09OeZ6ka/P+3gU2BGZExHmNeh3MzMzs4xb5JAl4BDiedNr98qRE6XFgq4i4r95GETFH0n6kwdZjJA2NiDuBAI4GPgPMAe4Htq2oa1/SLNznk7rZ/o805cDHxkBFxG8kvQZ8l5QkzQaeBk7vwDGbmZlZC3yB24XYwIEDo6mpqavDMDMz6xS+wK2ZmZlZJ3CSZGZmZlbBSZKZmZlZBSdJZmZmZhWcJJmZmZlVcJJkZmZmVsFJkpmZmVkFJ0lmZmZmFZwkmZmZmVVwkmRmZmZWwUmSmZmZWQUnSWZmZmYVnCSZmZmZVVBEdHUMtoBoDQVHdnUUZmZdK07199yiQtLDETGwUfV125YkSSMkhaRezZRZS9KNkl6W9IGkKZImSBpUKtc/13VYG/a/gqTX8nZf68ixtIekZSX9n6QXJL0n6W1JD0jav7NjMTMzWxTVTUB6iGWAKcCPgEnAcsDhwBhJe0bEdR2o+5dAV/78WBKYA/wcmAgsBewDXCZplYg4uwtjMzMzW+j16CQpIp4CDi0ukzQaeAk4GGhXkiRpC2B/4Djg9x0Ms10iYiqwX2nxGElrA4cATpLMzMwWoG7b3VYwQNJoSdNzt9opkurGHRFzgHeA2c1VKmnl3H31tKR+heVLABcCvwD+UWfbkZImSRoo6S+5q+9ZSUPy+u9ImihpWu4OXKW0fS9JJ0t6RtJMSZMlnSWpdytej6ktHZuZmZl1XE9Ikq4H7gB2A24ATgMOLBaQtFhOPFaTNBxYGzi/XoWS+gP3kbrTtoyIVwqrv0fq6jqjhbiWA0YBFwO7A68D10o6C9gOOAY4Pj8ux3I5qYvwSmAIqUvtUOCKiliVj20lSUcAOwHntBCbmZmZdVBP6G47KyIuzY/HS9oe2Be4tFDmDOCE/Hg6MCwibq+qTNIGwFjgMWCviHi/sO6zpORl14iYKam5uJYFjoqIu/O2k4HHgaHAuhExNy9fDzhO0uIRMVfSVqSxRQdGxKjCcb0JXC5pw4h4rLCfY4Dz8uPZwLcL25mZmdkC0hNakkaXnj8J9CstOwfYBNiFlABdKWloRV1bA3cB40mJ0Pul9RcAN0bEba2I671agpQ9k+/H1xKkwvJewOr5+c7ALFKrU6/aDbi1EGPR1fnYBpFarc6TVPfEfklHSGqS1ET56MzMzKzVekJL0pul5zOBj43diYhJpLPbAG6WNAE4E7i5tO1g0hlxF+axSx+RtDewBTBQ0gp58TL5/hOSlo+IdwqbvF2KYVZueXqrtM9Z+b4W86qk7rzpVFupVO8bwBv56ThJSwNnSrokIuYbmxQRFwEXQZ4nyczMzNqlJyRJ7dFEGg9UNhzYERgraVBE3FdYty7QB3iqYrsbSIPBV2hAbFOBGcBWddZPbmH7JtKYrE8yLzE0MzOzBlvokqR85tuWwIsVq2cDewNXkVplBkfEPXndSGBCqfyGpFPtTwQeaFCI44CTgOXrjZtqwTakVqjXGxSPmZmZVejRSZKkEUBf0plqrwGrkc4S25T55xgCICJmSxpGOpNsrKQhEXFXREwkTdpYrL/28PGIuLcRMUfEBElXAddI+jXwIPAh0J/UHXhSRDyXxx1tRho/NYnUDbc3sBfw/YiYVVW/mZmZNUaPTpKAR0jdasOA5UmJ0uPAVqWutI+JiDmS9gMuI03QODQi7uyEeGtqE1UeAvyQNM5qInAL8O9c5gng66SxVX1JM4s/DQyNiPJgdjMzM2swX+B2IeYL3JqZ+QK3i5JGX+C2p7ckWTM2XmNjmk5t6uowzMzMeqSeME+SmZmZWadzkmRmZmZWwUmSmZmZWQUnSWZmZmYVnCSZmZmZVXCSZGZmZlbBSZKZmZlZBSdJZmZmZhWcJJmZmZlVcJJkZmZmVsFJkpmZmVkFJ0lmZmZmFRThqyMvrLSGgiO7Ogozs46LU/1dZS2T9HBEDGxUfd22JUnSCEkhqVczZdaSdKOklyV9IGmKpAmSBpXK9c91HdaG/a8g6bW83dc6ciztIWltSedK+puk6ZJelXSTpA06OxYzM7NFUbdNklppGWAK8CNgMHAoMB0YI2mPDtb9S6Arf7rsCGwH/AHYBTgaWAV4QNLGXRiXmZnZIqFuK01PEBFPkRKjj0gaDbwEHAxc1556JW0B7A8cB/y+g2G21x+B86PQHyrpDmAi8G3ggC6Ky8zMbJHQE1qSBkganbucXpZ0iqS6cUfEHOAdYHZzlUpaWdIDkp6W1K+wfAngQuAXwD/qbDtS0iRJAyX9JXf1PStpSF7/HUkTJU3L3YGrlLbvJelkSc9ImilpsqSzJPUuHMeUKA0Yi4h3gOeATzV3bGZmZtZxPSFJuh64A9gNuAE4DTiwWEDSYjnxWE3ScGBt4Px6FUrqD9xH6k7bMiJeKaz+HrAkcEYLcS0HjAIuBnYHXgeulXQWqZvsGOD4/Lgcy+WkLsIrgSHAz0ktYlc0t0NJfYH1gKdbiM3MzMw6qCd0t50VEZfmx+MlbQ/sC1xaKHMGcEJ+PB0YFhG3V1WWBz6PBR4D9oqI9wvrPktKXnaNiJmSmotrWeCoiLg7bzsZeBwYCqwbEXPz8vWA4yQtHhFzJW0F7AMcGBGjCsf1JnC5pA0j4rE6+zwPEHBOc4GZmZlZx/WElqTRpedPAv1Ky84BNiENcB4LXClpaEVdWwN3AeNJidD7pfUXADdGxG2tiOu9WoKUPZPvx9cSpMLyXsDq+fnOwCxSq1Ov2g24tRDjfCSdDOwHHBsRL9QLStIRkpokNVE+OjMzM2u1ntCS9Gbp+Uygd3FBREwCJuWnN0uaAJwJ3FzadjDpjLgL89ilj0jaG9gCGChphbx4mXz/CUnL5zFBNW+XYpiVW57eKu1zVr6vxbwqqTtvOtVWKi+QdBTwM+BHEXFJne1qcVwEXAR5niQzMzNrl56QJLVHE2k8UNlw0qn1YyUNioj7CuvWBfoAT1VsdwNpMPgKDYhtKjAD2KrO+snFJ5K+CfyW1O340wbs38zMzFphoUuS8plvWwIvVqyeDewNXAWMkzQ4Iu7J60YCE0rlNwTOBk4EHmhQiOOAk4Dl642bqpG0O2ns1cURcWKD9m9mZmat0KOTJEkjgL6kM9VeA1YjnSW2KWn8znwiYrakYaQzycZKGhIRd0XERNIcRMX6aw8fj4h7GxFzREyQdBVwjaRfAw8CHwL9Sd2BJ0XEc5K2JiVzfwNGStqsUM3MiHi0EfGYmZlZtR6dJAGPkLrVhgHLkxKlx4GtSl1pHxMRcyTtB1xGmp17aETc2Qnx1tQmqjwE+CFpnNVE4Bbg37nM9sBSwEakJLDoZVJSZWZmZguIL3C7EPMFbs1sYeEL3FprNPoCtz29JcmasfEaG9N0alNXh2FmZtYjtXqepDz3ztGSVlyQAZmZmZl1B22ZTPIp4JfAZElXS9pRLUxJbWZmZtZTtTpJiogDSWePHZPvxwGvSPqppM8toPjMzMzMukSbLksSEe9FxCURsQ3wOdIcPv8FPCPpbkkHFa9kb2ZmZtZTdeTabR8CtdMN5pIuvPpbYKKkHToamJmZmVlXalOSJGlpSQdKuhN4nnQ1+98C/xERWwFrAncAFzY8UjMzM7NO1Jaz235PmqzxfNJkhttFxOcj4oyI+DdARLwJnIsnOjQzM7Meri3zJK1PuobZVRHxbjPlngK261BUZmZmZl2sLUnSXsCrETG7vEJSL2CNiHglIqYDdzUqQDMzM7Ou0JYxSS+RriNWZYO83szMzGyh0JYkqbmJI3uTLtJqZmZmtlBotrtN0peADQuLBkv6fKlYb2Bv4LnGhmZmZmbWdRRR/8rKkk4FTs1Pg/qtSS8BR0bE+MaGZx2hNRQc2dVRmJm1LE6t/11k1lqSHo6IgY2qr6Xutp8BywLLkRKk7fPz4m2piPiMEyQzMzNbmDSbJEXE7HwpkukRsVhETMjPi7f5znZrBEkjJEU+c65embUk3SjpZUkfSJoiaYKkQaVy/XNdh7Vh/ytIei1v97WOHEt7SfqOpD9LejXHMaIr4jAzM1sUtTQmaV3gxYiYmR83KyL+3rDIWmcZYArwI2ASqcXrcGCMpD0j4roO1P1L5l12pascDkwDbgCO6tpQzMzMFi0tzZP0JLAZ8GB+XC9pUF63eONCa1lEPAUc+rFApNGkMVIHA+1KkiRtAewPHAf8voNhdsQXI+LD3JrmJMnMzKwTtTQmaTvg74XH29e51dYtCAMkjZY0PXernSKpbtwRMQd4B2i2G1DSypIekPS0pH6F5UuQrj33C+AfdbYdKWmSpIGS/pK7+p6VNCSv/46kiZKm5e7AVUrb95J0sqRnJM2UNFnSWZJ6l47lwxZeGzMzM1tAmm1Jioi7ACQtRbp47YMR8XxnBFZwPXApcDawC3Aa8M+8jBzfYqSEb2VSF9XawLfrVSipP3AL8BawZURMLaz+HrAkcAaweTNxLQeMAs4EJgM/BK6VdH7e/zHAJ4FzSNe727uw7eX5WH4J/AX4AnA66Zp3ezazTzMzM+skrbosSR6TdDGwM9DZSdJZEVFLiMZL2h7Yl0KSREpoTsiPpwPDIuL2qsokbQCMBR4D9oqI9wvrPksa37RrPubm4loWOCoi7s7bTgYeB4YC60bE3Lx8PeA4SYtHxFxJWwH7AAdGxKjCcb0JXC5pw4h4rMVXpQ5JRwBHALB8e2sxMzOztsy4/QSphaSzjS49fxLoV1p2DrAJqXVmLHClpKEVdW1Nuq7ceFIi9H5p/QXAjRFxWyvieq+WIGXP5PvxtQSpsLwXsHp+vjMwi9Tq1Kt2A24txNhuEXFRRAyMiIEs3ZGazMzMFm1tucDtfwMjJb0KjMtjfzrDm6XnM0mzfH8kIiaRzm4DuFnSBFI32M2lbQeTzoi7sBy/pL2BLYCBklbIi5fJ95+QtHxEvFPY5O1SDLNyy9NbpX3Oyve1mFcldedNp9pKdZabmZlZJ2pLknQDsDRwIxCS3qJ0tltErNq40DqkCTi+YvlwYEdgrKRBEXFfYd26QB/gqYrtbiANBl+hAbFNBWYAW9VZP7kB+zAzM7MOakuSdD5dP29Qi/Ig7i2BFytWzyYNoL4KGCdpcETck9eNBCaUym9IGjB+IvBAg0IcB5wELF9v3JSZmZl1vVYnSRExYgHG0S55Buq+wH3Aa8BqpHmTNgX2q9omImZLGgZcQWpRGhIRd0XERGBiqf7aw8cj4t5GxBwREyRdBVwj6dekOag+JJ3ZNhg4KSKey/sfmJfXxo6tK2mv/HhMxZgqMzMza5C2tCR1R4+QutWGkc7leo10htlWpa60j4mIOZL2Ay4jzc49NCLu7IR4a2oTVR5CmjpgJilBuwX4d6HcscCBheffyDeAAZSSOjMzM2scRbS+B03S5qSWmrUpDZ4GiIhNGxeaddTAgQOjqampq8MwMzPrFJIejoiBjaqv1VMASNoBuJs0qeSWwBukM7Q2IJ2R9WSjgjIzMzPram2ZJ+nHwLnAkPx8eERsT2pVms38g57NzMzMeqy2JEnrkiZq/JB0ltsnACLiZWAEaWyNmZmZ2UKhLUnSDGCxSIOYXgU+U1g3jdQNZ2ZmZrZQaMvZbY8D6wC3AbcDJ0v6F2lG6R+TLltiZmZmtlBoS0vSOcybTPIHwHukU9bvJF1q45iGRmZmZmbWhdoymeSYwuN/SdoY+CzpUh7PRMSsuhubmZmZ9TDtnkwyj016voGxmJmZmXUbzSZJko5uQ10RERd0MB4zMzOzbqGllqTftKGuAJwkmZmZ2UKh2SQpItoysNvMzMxsoeEkyMzMzKxCsxe4lbQu8GJEzMyPmxURf29kcNYxWkPBkV0dhbVHnNr6C0+bmVnS6AvctjQm6UlgM+DB/LjeJ7fyusUbFZiZmZlZV2qpu2074O+Fx9vXudXWtUjSCEkhqW6CJmktSTdKelnSB5KmSJogaVCpXP9c12Et7DOauX2/VHYvSY9KmiHpNUm/kbRsa46tkSStLunnkpokvSPpDUm3S9q6s2MxMzNbFLU0cPuuqsedYBlgCvAjYBKwHHA4MEbSnhFxXRvr27xi2THA/sCfawsk7QtcCfwB+D4wAPgp6XIsO7Rxnx21MbAPcClwP7AkcDQwQdKuEXFzJ8djZma2SGnXZJK5FWjJ8vKIeL/DEaV6ngIOLe1zNPAScDDQpiQpIu4vL5N0OdCU91VzOnBXRBxUKDcF+JOkwcVZxzvBvcDaETGnEMstwFPA9wAnSWZmZgtQq89uk7S8pN9KehWYAbxbcWuLAZJGS5qeu9VOkVQ3npwsvAPMbiHOlSU9IOlpSf3qlNkS+Aypxeij7fKysaXi4/L97oWytS7Dz0u6RdJ7kl6RdHBe/01Jz+Rju1PSZypiOFzS47lbb4qk30vqWzjet4sJUuE1eAz4VHOvgZmZmXVcW1qSRgLbAP8LvAB09Fpt15O6ks4GdgFOA/6ZlwGQk6bFgJVJ3W1rA9+uV6Gk/qSL7r4FbBkRU+sUPTDHf1Vh2dx8Xz6u2aRB6etV1PMn0utxJqkr7BJJnwO2JXXXLQGcS+rC+3Ihzl8AJwD/A3yXlPT8BFhP0lciYi4VJC1J6jr8W53jMjMzswZpS5L0VeDIiLiqxZKtc1ZE1BKi8ZK2B/alkCQBZ5CSCYDpwLCIuL2qMkkbkFqBHgP2qtf1J6k38A1gdDGJioi3JL1BOpuv6Muks/f6Mr9fRcSoXG8TKdk7EhgQEdPy8tWBcyWtFREv50Tuu8BpEfHjQlzPkbrYdgFuqIodGAGsCfxXnfVIOgI4AoDl65UyMzOzlrRlMslXgIaMOcpGl54/CZS7x84BNiElDmOBKyUNrahra+AuYDywawtjo3YjpQ8jK9adC+wl6VhJfSVtTLrUylzgw4ryH3XNRcRbwOvA/bUEKXsm3/9Hvt+B9LpfIalX7QY8AEzLxzIfSfuRWqdOj4h76h1cRFwUEQMjYiBL1ytlZmZmLWlLS9L3gNMkPRoRrzRg32+Wns8EehcXRMQk0tltADdLmkDq2ioPWh5MOiPuwvI4ngoHAG8w/9gjgF+RErVzgPOAOcD5wAekBKbsrdLzWXWWwbxjWzXfv1AnvpXKCyTtQkrqfh8Rp9bZzszMzBqo1UlSRIyR9DXgBUkTgbcrymzauNAqNQHHVywfDuwIjJU0KCLuq9pY0mq53G8iYr4B4BExCzhS0kmkZGkSaUD6FFIrUyPUuvh2ZP6Eqri+FvNXSWOfrgfPn21mZtZZWp0kSTqTlKA8RGMGbrdJHsS9JfBixerZwN6kgdjj8un6VV1S+5NmBf9DxbqPRMTb5CRQ0lHAUsAl7Y295DZS112/iLituYKSNgduBG4H9o+Iqi4/MzMzWwDa0t12GPDDiPj5ggqmRtII0kDp+4DXgNVI8yZtCuxXtU1EzJY0DLiC1KI0pGICzAOAJyLi0Tr73YF0FtuTpO6xHUlnrR0XERM7eFi1OF+U9EvgN5LWIY2lmkEas7QDcHFE3Cnp86RxW1NI3YAbSyrWM9/cT2ZmZtY4bUmS3gceXlCBlDxCarUaRhpk/RrwOLBVva40SPMI5QHOl5Fm5x4aEXcCSNoIWB84sZn9ziIlYZ8nDa5+DNgtIv7czDZtFhE/kPQ0adbvY0hTDPyT1GL0fC62GbBivt1ZUY0qlpmZmVmDKKJ1VxvP43Q2Ab4Rrd3IutTAgQOjqampq8MwMzPrFJIejoiBjaqvLS1JK5PmDHo2n2X2dml9RMRJDYrLzMzMrEu1JUnai3RK/BJUX+w1ACdJZmZmtlBoyxQAAxZkIGZmZmbdSVtm3DYzMzNbZDTbkiRpMHBvREzLj5sVEWMaFpmZmZlZF2qpu+1m0qnoD+bHQf1Tz4M0UaOZmZlZj9dSkjQAeLXw2MzMzGyR0GySFBEvVz02MzMzW9i1ZQqAj0hamnSZkM+TZsMe5STKzMzMFiYtDdw+C9glItYuLFuWdJHbz5GuYr88cIKkTSPiuQUZrJmZmVlnaWkKgO2Ay0vLTgTWBg6PiJWBNYCJwPCGR2dmZmbWRVpKkvoz/0Vt9wT+HhGXAETEG8BZwBYNj87MzMysi7SUJPUCZtSeSOoLfAG4o1RuIrBaQyMzMzMz60ItDdx+DtgWuD0/H5rvbymVWxV4s3FhWSM8PPlhdFq9aa2ss8Sp0dUhmJlZO7TUkvQb4PuS/kfSD4FfAS8Bt5bK7Qg82ZodShohKSTVTdAkrSXpRkkvS/pA0hRJEyQNKpXrn+s6rJm6Fpd0oqQ7JP1b0ruSHpF0qKTFSmUn5vqqbr9rzfE1kqRLJT0taZqk6ZIel3ScJE/aaWZmtoC1NE/SSEmrA8cAKwCPAMdExOxaGUmrAF8HTmtgXMsAU4AfAZOA5YDDgTGS9oyI69pQV59czyjgXGA6MBj4X9IUBt8tlN0dWKq0/R65zE1tP4wO6wOcB7xImtF8J9IxfBb4dhfEY2ZmtshQROd2BUgaAZwKLBERc9qwXS9SK9ZjEbFLXtY/Lzs8Ii6us93iwPIR8WZp+SXAfsCKEfFBM/u9HVgXWDMi5rY23gVF0lXA0IhYtsWyayg4shOCsma5u83MrHNIejgiBjaqvpa62xakAZJG526klyWdUu7+KsoJ1TvA7HplACStLOmB3E3VLyLmlhOk7CFSq9HKzdTVjzQNwhXFBKnQZfh5SbdIek/SK5IOzuu/KemZfGx3SvpMRd2H5+6zGbk78fd5YHxLpgKtTi7NzMysfboySbqedJbcbsANpO66A4sFJC0mqZek1SQNJ83PdH69CnPL0n2krqktI+KVZva/DfA2865NV+WbpAv6/qHO+j8Bo/MxPAxcIulnwLeA7wMHA+sAV5bi/AXwW2A8sCupO29nYGx5vJGSXpJWkLQn6TX6dTMxm5mZWQO067IkDXJWRFyaH4+XtD2wL3BpocwZwAn58XRgWETcTgVJGwBjgceAvSLi/Xo7lrQTsDcwvIUuv28Cj0bEE3XW/yoiRuU6m4BdgCOBARExLS9fHThX0loR8XJO5L4LnBYRPy7E9Bxwb67jhsI+hgB/zo8D+EVEnN7MsR0BHAGkudDNzMysXbqyJWl06fmTQL/SsnOATUiJw1jgSklDmd/WwF3klpkWEqR1gauACcAvmym3GakVaGQzxzC29iAi3gJeB+6vJUjZM/n+P/L9DqTX/YrcQtQrj7d6AJiWj6XoHtJr8DXgF8CJkn5aL6CIuCgiBkbEQJZuJnIzMzNrVle2JJXHCc0EehcXRMQk0tltADdLmgCcCdxc2nYw6Yy4C5trGZL0aeA20mDv3VpoRTqANP7pqmbKvFV6PqvOMph3bKvm+xfq1LlS8UlEvAM05ae3S5oFDJf024j4VzOxmZmZWQd0ZZLUHk3A8RXLh5PmahoraVBE3FcuIGlN0qSY04CdS6095bJLAfsAY/JlVxppar7fkfkTquL6eppILVEDACdJZmZmC0iPSZLymW9bkuYMKptNGmN0FTBO0uCIuKew7SqkrjiAHVqR+OwC9KX+gO2OuA34EOgXEbe1Y/ttSGOT/tHQqMzMzOxjumWSlOdS6ks6U+010nXhDgU2Jc1tNJ+ImC1pGHAFqUVpSETcJakP6TIq/YFDgDVzq1LN3ytalQ4gteiUx011WES8KOmXwG8krUMaSzWDNGZpB+DiiLhT0hDS2XF/Bl4BlgUGkQZlXxgRkxsdm5mZmc3TLZMk0szexwPDSOdovQY8DmxV1ZVWExFzJO0HXEaanXsoafzRRrnIFRWbbUcaxA181Oo0CPhdRMyqKN9hEfEDSU+TZjI/htQy9E9Sd+DzudiLpG61n5DGMb2d1x1A8+OkzMzMrAE6fcZt6zwDBw6MpqamlguamZktBBamGbfNzMzMui0nSWZmZmYVnCSZmZmZVXCSZGZmZlbBSZKZmZlZBSdJZmZmZhWcJJmZmZlVcJJkZmZmVsFJkpmZmVkFJ0lmZmZmFZwkmZmZmVVwkmRmZmZWwUmSmZmZWQVFRFfHYAuI1lBwZFdHseDFqX4Pm5kZSHo4IgY2qr5u25IkaYSkkNSrmTJrSbpR0suSPpA0RdIESYNK5frnug5rxX6/JekZSTMlvSLpdElLNOKY2krSdyT9WdKrOf4RXRGHmZnZoqjbJkmttAwwBfgRMBg4FJgOjJG0R1srk3QycD4wGhgKnAecAFzQqIDb6HBgVeCGLtq/mZnZIqtuK01PEBFPkRKjj0gaDbwEHAxc19q6JPUGfgCMiogT8uLbJAVwhqSz8/460xcj4sPcmnZUJ+/bzMxskdYTWpIGSBotaXruVjtFUt24I2IO8A4wu7lKJa0s6QFJT0vqB6xHapkaWyo6DhCwW2HbkZImSRoo6S+5q+9ZSUPy+u9ImihpWu4OXKW0716STi50602WdFZO1IrH8mGLr46ZmZktED0hSboeuIOUpNwAnAYcWCwgabGceKwmaTiwNqnbrJKk/sB9QABbRsQrwNy8elap+Mx8v15p+XLAKOBiYHfgdeBaSWcB2wHHAMfnx+VYLid1EV4JDAF+TmoRu6JezGZmZta5ekJ321kRcWl+PF7S9sC+wKWFMmeQxg5BGpM0LCJur6pM0gak1qLHgL0i4v286nngQ2AzUmJWs3m+71uqalngqIi4O9c7GXicNJZp3YiYm5evBxwnafGImCtpK2Af4MCIGFU4rjeByyVtGBGPtfSimJmZ2YLVE1qSRpeePwn0Ky07B9gE2IWUAF0paWhFXVsDdwHjgV0LCRIRMR24BDhW0jBJK0jajtTKM5eUQBW9V0uQsmfy/fhaglRY3gtYPT/fmdRadW1u/eqVxxzdWoix3SQdIalJUhPvt1zezMzMqvWElqQ3S89nAuWxO5OASfnpzZImAGcCN5e2HUwad3RhHrtUdgKwEqkbTMAM4BTge8CrpbJvl2KYJQngrVK5WvddLeZVgSVJLV5VVqqzvFUi4iLgIsjzJJmZmVm79IQkqT2aSOOByoYDOwJjJQ2KiPuKKyNiGrBHHmi9GjARWJrUnXdvg2KbSkq+tqqzfnKD9mNmZmYdsNAlSfnMty2BFytWzwb2Bq4CxkkaHBH3lAtFxBvAG7m+H5LmYvpTg0IcB5wELF9v3JSZmZl1vR6dJOUZqPuSzlR7jdT6cyiwKbBf1TYRMVvSMNKZZGMlDYmIu3J9++T6ngVWJJ21tg+wZ0S824iYI2KCpKuAayT9GniQNN6pP6k78KSIeC7HMzAvr40dW1fSXvnxmOKYKjMzM2usHp0kAY+QutWGAcuTEqXHga3KXWlFETFH0n7AZaTZuYdGxJ2kKQGOBj4DzAHuB7Ztrq522h84DjgE+CFpnNVE4Bbg34Vyx/Lx6Q6+kW8AA/I2ZmZmtgD4ArcLsYEDB0ZTU1NXh2FmZtYpFpkL3JqZmZl1JSdJZmZmZhWcJJmZmZlVcJJkZmZmVsFJkpmZmVkFJ0lmZmZmFZwkmZmZmVVwkmRmZmZWwUmSmZmZWQUnSWZmZmYVnCSZmZmZVXCSZGZmZlbBSZKZmZlZBUVEV8dgC4jWUHBk5+4zTvX7yczMuoakhyNiYKPq67YtSZJGSApJvZops5akGyW9LOkDSVMkTZA0qFSuf67rsFbs91uSnpE0U9Irkk6XtEQjjqktJC0r6f8kvSDpPUlvS3pA0v6dHYuZmdmiqNsmSa20DDAF+BEwGDgUmA6MkbRHWyuTdDJwPjAaGAqcB5wAXNCogNtgSWAO8HNgV2A/4BngMkn/3QXxmJmZLVLqttL0BBHxFCkx+oik0cBLwMHAda2tS1Jv4AfAqIg4IS++TVIAZ0g6O++vU0TEVFJiVDRG0trAIcDZnRWLmZnZoqgntCQNkDRa0vTcrXaKpLpxR8Qc4B1gdnOVSlo5d189LakfsB6pZWpsqeg4QMBuhW1HSpokaaCkv+SuvmclDcnrvyNpoqRpuTtwldK+e0k6udCtN1nSWTlRa8nUlo7NzMzMOq4nJEnXA3eQkpQbgNOAA4sFJC2WE4/VJA0H1iZ1m1WS1B+4Dwhgy4h4BZibV88qFZ+Z79crLV8OGAVcDOwOvA5cK+ksYDvgGOD4/Lgcy+WkLsIrgSGkLrVDgSsqYlU+tpUkHQHsBJxT79jMzMysMXpCd9tZEXFpfjxe0vbAvsClhTJnkMYOQRqTNCwibq+qTNIGpNaix4C9IuL9vOp54ENgM1JiVrN5vu9bqmpZ4KiIuDvXOxl4nDSWad2ImJuXrwccJ2nxiJgraStgH+DAiBhVOK43gcslbRgRjxX2cwxpbBSkFqRvF7YzMzOzBaQntCSNLj1/EuhXWnYOsAmwCykBulLS0Iq6tgbuAsYDuxYSJCJiOnAJcKykYZJWkLQdqZVnLimBKnqvliBlz+T78bUEqbC8F7B6fr4zqbXq2txC1CufwXdrIcaiq/OxDSK1Wp0nqe6J/ZKOkNQkqYn365UyMzOzlvSElqQ3S89nAh8buxMRk4BJ+enNkiYAZwI3l7YdTBp3dGEeu1R2ArASqRtMwAzgFOB7wKulsm+XYpglCeCtUrla910t5lVJZ65Nr9g/ef/Fet8A3shPx0laGjhT0iURMd/YpIi4CLgI8jxJZmZm1i49IUlqjybSeKCy4cCOwFhJgyLivuLKiJgG7JEHWq8GTASWJnXn3dug2KaSkq+t6qyf3ML2TaQxWZ9kXmJoZmZmDbbQJUn5zLctgRcrVs8G9gauIrXKDI6Ie8qFiq03kn5ImovpTw0KcRxwErB8vXFTLdiG1Ar1eoPiMTMzswo9OkmSNII0oPo+4DVS68+hwKbMP8cQABExW9Iw0plkYyUNiYi7cn375PqeBVYknbW2D7BnRLzbiJgjYoKkq4BrJP0aeJA03qk/qTvwpIh4Lo872ow0fmoSqRtub2Av4PsRUT4Lz8zMzBqoRydJwCOkbrVhwPKkROlxYKtyV1pRRMyRtB9wGWmCxqERcSdpSoCjgc+QZru+H9i2ubraaX/gONKkkD8kjbOaCNwC/DuXeQL4OmlsVV9Sa9bTwNCIKA9mNzMzswbzBW4XYr7ArZmZLUoafYHbnt6SZM3YeI2NaTq1qavDMDMz65F6wjxJZmZmZp3OSZKZmZlZBSdJZmZmZhWcJJmZmZlVcJJkZmZmVsFJkpmZmVkFJ0lmZmZmFZwkmZmZmVVwkmRmZmZWwUmSmZmZWQUnSWZmZmYVnCSZmZmZVVCEr9q+sNIaCo5svkyc6r+/mZktHCQ9HBEDG1Vft21JkjRCUkjq1UyZtSTdKOllSR9ImiJpgqRBpXL9c12HtWK/35L0jKSZkl6RdLqkJRpxTG0haW1J50r6m6Tpkl6VdJOkDTo7FjMzs0VRt02SWmkZYArwI2AwcCgwHRgjaY+2VibpZOB8YDQwFDgPOAG4oFEBt8GOwHbAH4BdgKOBVYAHJG3cBfGYmZktUuq20vQEEfEUKTH6iKTRwEvAwcB1ra1LUm/gB8CoiDghL75NUgBnSDo776+z/BE4Pwr9oZLuACYC3wYO6MRYzMzMFjk9oSVpgKTRucvpZUmnSKobd0TMAd4BZjdXqaSVJT0g6WlJ/YD1SC1TY0tFxwECditsO1LSJEkDJf0ld/U9K2lIXv8dSRMlTcvdgauU9t1L0smFbr3Jks7KiVrtOKZEacBYRLwDPAd8qrljMzMzs47rCUnS9cAdpCTlBuA04MBiAUmL5cRjNUnDgbVJ3WaVJPUH7gMC2DIiXgHm5tWzSsVn5vv1SsuXA0YBFwO7A68D10o6i9RNdgxwfH5cjuVyUhfhlcAQ4OekFrEr6sWc4+6b43i6uXJmZmbWcT2hu+2siLg0Px4vaXtgX+DSQpkzSGOHII1JGhYRt1dVlgc+jwUeA/aKiPfzqueBD4HNSIlZzeb5vm+pqmWBoyLi7lzvZOBx0limdSNibl6+HnCcpMUjYq6krYB9gAMjYlThuN4ELpe0YUQ8Vue1OI/UqnVOnfVmZmbWID2hJWl06fmTQL/SsnOATUgDnMcCV0oaWlHX1sBdwHhg10KCRERMBy4BjpU0TNIKkrYjtfLMJSVQRe/VEqTsmXw/vpYgFZb3AlbPz3cmtVZdm1u/euUz+G4txDifPKh8P+DYiHihqkwud4SkJklNvF+vlJmZmbWkJ7QkvVl6PhPoXVwQEZOASfnpzZImAGcCN5e2HUwad3RhHrtUdgKwEqkbTMAM4BTge8CrpbJvl2KYJQngrVK5WvddLeZVgSVJLV5VViovkHQU8DPgRxFxSZ3tanFcBFwEeZ4kMzMza5eekCS1RxNpPFDZcNKp9WMlDYqI+4orI2IasEceaL0a6UyypUndefc2KLappORrqzrrJxefSPom8FtSt+NPGxSDmZmZtWChS5LymW9bAi9WrJ4N7A1cBYyTNDgi7ikXiog3gDdyfT8kzcX0pwaFOA44CVi+3ripGkm7k8ZeXRwRJzZo/2ZmZtYKPTpJkjSCNKD6PuA1UuvPocCmpPE784mI2ZKGkc4kGytpSETclevbJ9f3LLAi6ay1fYA9I+LdRsQcERMkXQVcI+nXwIOk8U79Sd2BJ0XEc5K2JiVzfwNGStqsUM3MiHi0EfGYmZlZtR6dJAGPkLrVhgHLkxKlx4Gtyl1pRRExR9J+wGWk2bmHRsSdpCkBjgY+A8wB7ge2ba6udtofOA44BPghaZzVROAW4N+5zPbAUsBGpCSw6GVSUmVmZmYLiC9wuxDzBW7NzGxR0ugL3Pb0liRrxsZrbEzTqU1dHYaZmVmP1BPmSTIzMzPrdE6SzMzMzCo4STIzMzOr4CTJzMzMrIKTJDMzM7MKTpLMzMzMKniepIWYpDdIE0+aWfNWJl1+qLvq7vFB94+xu8cHjrER1omIZRtVmedJWohFxCpdHYNZTyCpqZET0DVad48Pun+M3T0+cIyNIKmhkwO6u83MzMysgpMkMzMzswpOkszM4KKuDqAF3T0+6P4xdvf4wDE2QkPj88BtMzMzswpuSTIzMzOr4CTJzBZKkv5D0jWS3pE0TdJ1kvq1ctuoc9uwu8SYt/+CpD9JmiLpA0nPSvp2V8cnaUQzr+GMRsXXkRjztv0k/UHSK5Lel/ScpJ9I+kQ3iW9A3vZtSe9JulNSw88sk7SmpPMk/TW/DiGpfyu37S3pV5Jeze/Bv0rauhvF9zNJt0qamrc7qC37dpJkZgsdSUsDdwCfBw4Evgl8DrizDV+AI4HNS7fnukuM+cvyAWAp4DBgMHAWsHg3iO9i5n/tvgbMAW5qRHwdjTGvHw9sDQwHhuS4TwAu6QbxrQTcC6wHHAkMy6vulPSFRsRX8Flgb+At4J42bvt74HDgFGAo8CpwS4N/UHQkvuOAPsDN7dpzRPjmm2++LVQ34NvAXOCzhWUDSF/S32nF9gH8pLvGSPqB+xRwfXeMr05938yv65DuECOwY45nx9LyX+Ttl+7i+H6UyxW3/QTwb+D/Gvy3Xqzw+LD8uvRvxXYb5LIHF5b1Ap4Fburq+IrbkhKtAA5qy77dkmRmC6Ndgfsj4oXagoh4CbgP+HqXRfVxHYlxW2Bd4NcLLLrGv4YHkr7gb2lMeEDHYlwy308rLX+blISqi+PbDHi+tO17pJaUoZIaNhl0RHzYzk13BWYDVxfqmgP8EdhJ0lINCK8j8XVoW3B3m5ktnL4IPFmx/ClSctEa35I0M4+BuEPSVo0LD+hYjFvm+96S7pc0W9Lrkv5HUp9uEN/HSFoT2A64In+JNkpHYhwPPA/8UtK6kpaRtD2p9ed3OSHpyvjmArMqls8kdR99pmOhNcQXgZci4v3S8qdISehnOz+kxnKSZGYLo76k8QtlbwIrtmL7y4GjSeNojgBWAu6QtG2D4oOOxbhGvr8auBXYATiD1BVxZTeIr+ybpO+bP3Q0qJJ2xxgRM0jJZq3r8l3gdtLYlWO7Oj5Sl9Xn8tgkACQtBmxaqLurNXd8tfU9mq/dZmYLq6pJ4FrVhRIR3yw8vUfSjaQWgZ8wrxWnEdobY+0H7uURcUp+PEHS4sAvJK0bEX/vwvjKDgAejYi/dTCeKu2KUVJvUpK5KimJe4WUgJxCGgv0ra6MD/gd8P+AUZL+H/A+8EPSmCaADnUjNYho3HukW3JLkpktjN6i+lfsilT/8m1WRLwLjAY26WBcRR2JcWq+v620/NZ8v2H7w/pIQ15DSZuSzu5qdCsSdCzGQ0ljuwZHxOURcXdEnEk6u+0oSRt0ZXwR8Q/gv4CNgReAyaSzBM/ORV5tQHwd9Sb1j6+2vkdzkmRmC6OnSOMlytYF2tvCUu9Xc3t1JMan8n05ntov+Ea0MjTqNTyQ1DLTqG7Aoo7EuD7wVkS8WFr+YL5vxGn2HXoNI+Ja4FO5/GcjYmNgGeCfEfFKA+LrqKeAAXmqg6J1SeOpXph/k57FSZKZLYxuAjaT9Onagjz53Ba0Y54eScuR5tF5oFEB0rEYx5IG8O5cWr5Tvm/q4vhq5Zckze8zJiLeaEBMjYzxNWBFSeXBxV/O9//q4vgAiIi5EfF0RLwoaQ1gH+CCBsTWCDcBSwDfqC3IZ93tA9waETO7KrCGaeRcC7755ptv3eFGmk/mBeAJ0qnWuwKPA/8AlimUW4vUynFKYdmJwP8C+5G6Yw7M9cwCtuoOMeblp+blPyMNMP8+8AEwsjvEl9ftQWrt2qMb/p37k07/fy7/jbcDvpuXNVGYm6eL4luC1LW2G7A9aVLEyaQpAJZcAK/lXvl2Qf6bfSs/36aF9+EfSV2HhwFfBa4BZgD/2U3i2yaXOzZv95taXa3a74J44/rmm2++dfUN6Adcm7/03gVuoDQBXf6iDGBEYdkupHlsppDmgJlK+sW8aXeJMS8X8J38JTwLeBn4MbBEd4gvr7sxv34N/1Jv0Gu4LvB/wD9JCeZzwJnAil0dH+nEqptJc0vNBF4knTjQ4Uku68QZdW4TWngN+5Dm63qNlBw9AGzbjeKbUG/b1uxXuRIzMzMzK/CYJDMzM7MKTpLMzMzMKjhJMjMzM6vgJMnMzMysgpMkMzMzswpOkszMzMwqOEmyHkPSDpKukjRRUkgaUVGmf15Xvv2xouxKki6U9JqkDyQ9I+mAinJ7SHool5kqaZykT7Qxri/m7SZLminpFUkXS1q9zrH+VtLVbX2NFjRJG0maK2lKaflBdV73kHRhG+taTdKN+TWaIelVSX+S9LmKOg6X9Fx+TZ+WtH8L8d+QY5rvKu+StpD0QP47v5QvKtpqko6QtFvF8pF1XpfPF8psIulSSS9Iel/Ss5JOzRdhbWm/tdd+mRbKHS2pSdJbeR9P5GUqlNk217VeM/V8TdLVkl7O9Twp6Vili+vWytT7PwxJz7Z0TD1Za/8e7ai38n3bwPqvkTRhQdXfU/Xq6gDM2mBn4EvA7aRLHTTnRNKEgDXlL+LlgLuB6aSZbKeQJpZbslTuMNIMrWeQZuNdkTT7bfF/pzVxLQ+8BIwizZo7gDRj8saSNomIOaXyg0lXI+828pfpb4A3mP+zYzTp4ptFXwbOIV1Coy11LU2awXc4aYLE1YAfAHdIWj8i3s517AtcSPrb3AEMIl0x/b2IuL5inzsCm9U5ts8Ct5Am7zuZdDX4X0t6PyIurtqmwhHAk6TJAsueAQ4uLZtYeLwP8Bngl8DzpPfT6fl+z1buvyUrAtcDfyNdUf6rpL/B0qQJFFvriLzNj0iTMG4JnEV6T5+Qy7zK/O+HPqQL8M73fjDrthbULKi++dboG4XLBJCSmhEVZfqTZlMd2kJdvyDNVNynmTIrk2bIPbyjcdXZbocc63+Wlq8HzAVW7erXvBTXN/Nr9jNgSivKnw+8DSzVgLo+R+nyFsCzwKhSueuAJyu2XwJ4mnTl9wCOLa2/kDTbcq/Cst+SkgC18vVpouKSIMBIoKmFbVepWHZEjnWtFrY9KJdbpjVxlra9Avhb4fm2ua71mtlm5YplPyPNWD3f37pQ5hu57i939Xt5Qd468vdood753rcNrv8a8uzVvs27ubvNGiI3t/9T0nu5S+OruXl427z+UElP5a6MKZLukvTFwva9JZ2R65gp6XFJg4v7iIhGXNm85mDg9xHxQTNl9s73f2iuog7ENTXfL1laPgR4KCJeB5C0lKQLJL2t1N33K0nHS/pounxJS0g6M3dRzVTq1rte6QKjxS6A/5Q0IXeTPJaffyJ39bwj6R+5heZjJC1LauU4kXQJjGblrpe9gOuidJHLttZV9VopXXX8c8D4UrlbgS8qXUS06NukL/FL69Q/KMdabNH7I7AmKWltVu6m2Bg4sNCtdFBL29VE9cVfH833q7aymgGSbsv/g89I2qMV20xl/vffx0gaJmmWpKNyrFMqij0K9AaWa6aqfYGXIuKjiwRL+rykP+b/+/fzZ8Txkj723aR5XeOvKnXBPivp+FYcH5JG5M+cLSQ9krd/TNKWFWUPyzHMzN2J3yut31zSTfn/671cz3+1Iobv5v3ump/Xut/fzPU8LemYVhzOkpLOzdu9Lem82v94YV/98mv6Zn5Nb5G0TqnMf0gakz+PJyq1mLdIyemSXpc0TdIl+f0Rtf851e9entCafXQ3TpKswyTtDpxHur7V7qTm/N8X1m8N/A64nPRldAjwF1IXVM01pF9gPyNdO+sh4CZJG7YzrEuVxru8KunXkvoU4hlA+uJ5O39QzJL0Ri5X/MD5Mqm14lBJkyTNVhqz8pV2xoSkxSQtmT+0fkE6zgdLxYaQuq9qziC9NqcB/0W6FtQJpW1OzuuGk1qojgfeARYvlfsDcBWpC0ek1/33pC7AvUjXXRolac3SdqcAT0fEDa081K+SXuOrKta1qq78Wi0haS3gXFLXW+11WSrHX06yaglZcbzPaqTX5fiqhFZpfNl/kLrEip4u19WMo/P2Y0jdTJvz8b/huvlLZaakeyVt04o6vwJ8SHoPtsaVzPsffB74Y8XfEUm9JC0jaRBwAKnFr1JO9EYBR0TE71qIdUqdZK/WvT2I+d8PnyId39GkLub/Jb3PTyps24d0/a3dSF2Qg0nde2s0E0/Z0qTPn9+RWrTeBsbm90ZtP98lXTz1BmBofny6Pj4OaC1SN/5hpM+pa0mfNfP9sCjUOzwf09cj4qa8+CZSa/H+pIvengcs24rjOIGUuP8X6TpuRwA/LeyrL3AvsA5wFOmH3ieA8bXPQEkiXVNvPVLL6ndIPyLK3aNVjid1ff+O9HnxAenzqeh05v0PbE56P84gtdT2PF3dlOVbz7+RvuhHl5b9ltQ8vC2pxeDhZrb/ai67TWn53cCf6mxTr7ttddI4i13zvkeQ/pFvLJTZPO/vXdKH8vbAf+dyZxTK3ZLL/Iv0obQzaezLNOCTbYmrsH4c8y6w2ESpS400bmQOuQsOWCnH9d1CGQFPUbhAI2kszVnN7PegvM8DC8sG52WXFJYtT7qo67cKy9YhjWFZPz8fQQtdZMAlpAtzLl5a3uq6SB/EtdfqReBzpfVTy8fMvCuE71dYNgr4v8Lzj3VbkL6oA9itVFevvPyIVv4f1Otu+zbpiuXbkL5Y/kpK7upeMJc0Duv1qvqa+dseUli2Un4fHVVRb/Ein6eX1m+bl69H+pKdCQxrYf/r5vdoc+/7A3K96zdTRvk1/wHwj8LyI0nJ4oat+TtU1Dui4j2xDPAm8Iv8fDnS+MRTS9v+mHTh1sWbifdC4I6Kv8cypB9971K44CupG7/Z16LOcQQpES927/8w/z/1zc9Pz/8XfQtlViT9YDomP6/933+5UGat/H6Z0Mz+FyeNNTu/tHxMrq9/xTZLkJK2J4FPtOfv19W3Lg/At559y/84s4EjS8t3Zl6S9LX8IXc2sDWlK4IDP8//fL1Kt1NJzfNV+23L2J9v5Vg2zM+3yM/vL5U7hfSLZ+n8/LZcbudCmeVIg4pPb09cpC6iL5N+QT4DPAz0LqwfRmrVqV18etscwzqlen7Bx5Okn+QPx++RBvuqVL72wb1mYdnaedn+pbKTgZ8Uno8Dflt4PoJmkiRS981bwG8q1rW6LlKL2SakxOJ+0sD3TxbW/5T0xbYH6Ytg3/w8gH1ymc1JXyJrFbarlyR9vbT/WpLU7Ji0QvnKJKmiXJ98LDc08/rdDfyDwtXoSS3/xf+Pxer9bav+joVjGsi8HxAzgJMK62vvt4vyut1bOJYVSS1uD1D6vy6VG0v1WLHepFaWF0iJYzGB65XLXE0zP7Ja8XqPyPX1KS2/mpzcADvlMuuWXuPa67FW4Xj/h9SqOacQ66SK/7WLSC1WXyntdzHgFVKL1D60cuxhrvOXpWVfyMu3zs//SuomLn+W3gFcWng9Xquo/wGaT5L6533tVFp+FPWTpAvya/C51hxjd7y5u806ahXSP2G5mf2j5xExnjQGaGtSs/kUpVPca6fRr0z6hTu7dBtB6gbpqGvy/X/m+zfz/Z2lcneQunE+Uyo3oVYgIqaREpt12xNIRDwfEQ9ExOWkD+aNgP0KRYYAYyJ/wpBeF2jm9c1+Quo2ORp4HPinpG9XhPB24fGsimW15b0BcpfMFqQzvVaQtEJep/x8qYp9DAJWoNS10ta6IuKViHgoIq4Bdsx1Fsdt/JT0K/Za0t/qN6T3DKRWLEhn110IvFPYJ0AfScuXjr+2rmbF0vqGiDQObgzz3o8fyV0ho4AvAoMj4q3C6lP4+P9H+ezHcpwf/R0L+54TEU0RMSEiRpBaOkYojfEq2pOUuJTHfBVj7U3qtlkK2DUiKseXSVqJ9EOpquu1NjbtIlILxyak9zKF2Fci/YjqiOkx//jD10ktz5A+gyC10BZf49pnRO1zaCQpsfkV6T25CanVtGqqhj1JnxUf606P1OW7I6mF6hLgNUn3SNqoFcfxep3nxePYh/k/S7crHMNqzF9PVd1lrf0sAtI4VFIr4Dcj4vkW6u62PAWAddQbpF9Uq5SWf+x5RPwB+IOkVUi//M8mdVt9n/QF9y/SmIMFIUr3L1I9YLg2X0xt3MrTeRtVlOvwIPKIeFnSm8CnIY3BIbXAHVEo9lq+X4V5SVvtebGuGaQvzVOU5hM6CjhH0rMRMa4DYa5D6jao+pB7izTW5yel5cNIv5T/0oC6gJScSnqR/FrlZe8De0v6JOn1eIE0lmQW8Ehhn5uSxlIUnUFqwewVEe9J+ifzjz2qPS+PVWqUqFh2NvB1YIeIKO/3IlK3as3kBsTwCOkLfg3S61fzX6RWgD9LGlROMJQG5l9JSua+EhH/pr69SN81881VRhofdF5EfDSuRdKQUpmpwGdbdzh1LSOpT+k4VmVe8lX73xrKvAS76NmcFA4htUJ+ND5LpUHmBUNJf69RkvaPwni4/LfdU9ISwFakZHG0pDWj+RNByoP4a8+Lx3ETqdut7N18/1pFPbW6mjuRpfhZVFR+jqQvk360nR4Rf26mzm7PLUnWIRExF3iM9MFetGud8m9ExIXAPcxrjbmd9Ctlev6V+7FbA8LcK98/nGOYRepK275U7qukrpnal8XNpIRou1qB3PqwMam1pkPy4O2VSF0vkLrhluPjv96fIHV7fL2wnUiDRivlX20nksaTtKvFq+Aa0vEXb38gJbjbAZcVC+cWiV2APxZaw9pVV6nelUkJz0vldRHx74h4kpQcHQVck1v8IH1RlfcJqcvkq4VqxgK7qzAhIukX+T9J4ylaY76WmzrH0ofU2vZwafnJpDm79o+Ie8vbRcTk0v9GI5KkLUjvk3Jdk0ivz+eAa/KXedFvSQn9LhHR0sDyfYEHI+LFinV9mDfYvpZ8lecaux3YSNKXWthPS3Yv7GcZ0gkOtVaev5IShDWqPoMi4l1Si9nipXiXpc5nHel/dxDpPVg56D0iZkfEHcCvSa1BK7RwDF8vJWV75Lhr79HbSYnrUxXHUPs7PQR8MicytePoR0XLZsk/SYlSs5/1eTD8taTPsREt1NntuSXJGuFnwHWSfkP6FbMF6RcXwIeSTgP6krvaSF1M25BakSAlLLcAt0n6JanJezlgQ9J4nZMB8llOm+RtliSdMbQX8F5EjM1lRpDOErmP9OW7NWkSyOsi4m+FmH8M3CvpUlI3wJdyPKdHPmU9Ipok3Qj8XtL3c+zfIzVff3RGUCvjOpPU4vYAqVvkC7muF5n3C3sIcHf+QCbHMFXS/wKnSZpNat06OL8+HyUhkq4nfek+SvrQrP16v5sOiIhJpC/MjyhN6zA7IiZUbLIr6Wya+bpWWluXpBNIExPeTeoCGEAaWD+T1HVWKzeUNOD0adKv4MNJrT8HFvY5X7KRckyej4i7Cot/RWo9uSy/3puQugq+VZHs1fMMsJOknUitHy+R/uY3k86seoHUHfLfpHFQtSkmkLQf6f9oJPAvScVJL1+MOmeNtYWkh0hJ6bOkAbU7AMeSBr+/Xy4fEf+Q9DXS3+FySftGxIeSfkBq7fw56f+7GOvfCwkqktYgtZSUz8asuQ04RtILpFaQY0jJSNGovPzW/P/9LOk9sXZEfJ/W+QD4aU6OJpN+RCxJOmuSiHg7131u/n++m9SIsDawXUTsHhHv5NfwFEnTSK3J3ycNiq6c+iAiHszv03GSpkXEiTnZO5M0JuofpG7dk4DHI+LN/LqdApwSEeXv6GWBP+X36BdJrce/qW1HSrb2J028eh6phf6TpM/beyPiKlJX7+O5npNIP8J+TKm7TekMzNuBr0bEXRExV9KvgF9JeoP0GbsrsH7epNYCNirH+Rvgy5o3ofu0iPh71evUrS2IgU6+LXo30i/gSaSWmDHMmzhuQ9IvqdtJXXMzSB9y36cwuJj0wVgcwPkaaZDvkEKZg/j4wM7abWKhzDDSANp3cj0vkD4AqiY03InU3TCT9CtpOIUzR3KZZUjdDlNJH7TjKZ2V0oa47iN9EbxP+kI9i8LEfKQE5/iKOHvnGN4hdUv9D+kX2tuFMt8tHPe7pGTs6xUxLlNY1p+KiTdJM0Gf2czfegT1B1vfADzThvfNfHWRxq/cUXi/vABcDPQrlduZebNHv0lKzPq1Yp8fG7hdWL4lqWVhRn4N/l8b/wc+nd8f7+R9HJT/dtfl99fMvG4csFlp25F13kMBHNTCfuf721b9HUlncj6XX68ppNaT/fn4/+G2lCaTJP2oeZs0VYRIP3bqxbptKYbjSae6r1En9k+SZgGfRurmOoOU7Jbfqyvl+F/Pf59nWvv3qb3HSMnaY/nv8Dh5sHOp7P6kHxsfkP7XHgC+U1j/2fzefI/Upfw9Su/hqr8H6b06k3QyyqqkVtN/5GN5jdJ7N9cZFe/b75CSj7fye+l8Sp9tpK7TS/PrOTO/Dy4Hvlgo04/0PvyANAj9SEqTSRbeC9sWlonUlfcG6XPmCuadGLNC4X1X9d6YUO9v1J1vtTNozBpK0o9Ip6f2jeYnbDRA0qdISeba0YpBjpLGA0tExDYLPDizHiy3EB0bESu3VNbaTtLFpDF0a3V1LAuCu9usw/Jg7JNJZ4K8T/rFdhItz2htWUT8i/kHiAMgaTvSeKVHSN0k+5DGi3yj0wI0s0We0oWP9yGdlPEhaczVwRQm/1zYOEmyRphFGgtyAGkywldJff3DuzKohch00pl/J5O6b54ndcFc09xG1jh5QHFlEgvp1PpODMeyPIi5uROQ5nZWLIuI90jd0seSxh6+TEqQzurKoBYkd7eZmbVA6bpTdbs2I6JuAmULTu5KO7WZIttF9QkGZq3iJMnMrAV5uoa619aKxkxVYW2Uz55r7hpuz0bhbFGztnKSZGZmZlbBk0mamZmZVXCSZGZmZlbBSZKZmZlZBSdJZmZmZhWcJJmZmZlV+P8iVZ7Lgg9YjAAAAABJRU5ErkJggg==
"
class="
jp-needs-light-background
"
>
</div>

</div>

</div>

</div>

</div>
<div  class="jp-Cell jp-MarkdownCell jp-Notebook-cell">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea"><div class="jp-InputPrompt jp-InputArea-prompt">
</div><div class="jp-RenderedHTMLCommon jp-RenderedMarkdown jp-MarkdownOutput " data-mime-type="text/markdown">
<h1 id="Scenario-3:-return-a-list-of-most-similar-region-sets-and-their-similarity-scores-to-a-query-region-set-(r2r)">Scenario 3: return a list of most similar region sets and their similarity scores to a query region set (r2r)<a class="anchor-link" href="#Scenario-3:-return-a-list-of-most-similar-region-sets-and-their-similarity-scores-to-a-query-region-set-(r2r)">&#182;</a></h1>
</div>
</div>
</div>
</div><div  class="jp-Cell jp-CodeCell jp-Notebook-cell jp-mod-noOutputs  ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[11]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">file_name</span> <span class="o">=</span> <span class="s1">&#39;./distance_r2r.csv&#39;</span>
<span class="n">distance_s3</span> <span class="o">=</span> <span class="n">pd</span><span class="o">.</span><span class="n">read_csv</span><span class="p">(</span><span class="n">file_name</span><span class="p">)</span>
<span class="n">distance_s3</span><span class="o">.</span><span class="n">score</span> <span class="o">=</span> <span class="mi">1</span> <span class="o">-</span> <span class="n">distance_s3</span><span class="o">.</span><span class="n">score</span>
</pre></div>

     </div>
</div>
</div>
</div>

</div><div  class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[12]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-ipython3"><pre><span></span><span class="c1"># print sample query region set</span>
<span class="nb">list</span><span class="p">(</span><span class="nb">set</span><span class="p">(</span><span class="n">distance_s3</span><span class="o">.</span><span class="n">test_file</span><span class="p">))[</span><span class="mi">0</span><span class="p">:</span><span class="mi">10</span><span class="p">]</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">
<div class="jp-OutputArea-child jp-OutputArea-executeResult">
    
    <div class="jp-OutputPrompt jp-OutputArea-prompt">Out[12]:</div>




<div class="jp-RenderedText jp-OutputArea-output jp-OutputArea-executeResult" data-mime-type="text/plain">
<pre>[&#39;ENCFF538OAF.bed.gz,h3k4me1&#39;,
 &#39;ENCFF494ASP.bed.gz,h3k27me3&#39;,
 &#39;ENCFF292YSJ.bed.gz,h3k4me3&#39;,
 &#39;ENCFF001WUM.bed.gz,h3k4me3&#39;,
 &#39;ENCFF701ENX.bed.gz,h3k27ac&#39;,
 &#39;ENCFF727GSV.bed.gz,h3k27ac&#39;,
 &#39;ENCFF787BOJ.bed.gz,h3k27me3&#39;,
 &#39;ENCFF526BJR.bed.gz,h3k27ac&#39;,
 &#39;ENCFF908TKC.bed.gz,h3k9me3&#39;,
 &#39;ENCFF099WAJ.bed.gz,h4k20me1&#39;]</pre>
</div>

</div>

</div>

</div>

</div><div  class="jp-Cell jp-CodeCell jp-Notebook-cell jp-mod-noOutputs  ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[13]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-ipython3"><pre><span></span><span class="k">def</span> <span class="nf">S3</span><span class="p">(</span><span class="n">query_file</span><span class="p">,</span> <span class="n">distance_s3</span><span class="p">):</span>
    
    <span class="n">df</span> <span class="o">=</span> <span class="n">distance_s3</span><span class="p">[</span><span class="n">distance_s3</span><span class="o">.</span><span class="n">test_file</span><span class="o">==</span><span class="n">query_file</span><span class="p">]</span><span class="o">.</span><span class="n">sort_values</span><span class="p">(</span><span class="n">by</span> <span class="o">=</span><span class="s1">&#39;score&#39;</span><span class="p">,</span> <span class="n">ascending</span> <span class="o">=</span> <span class="kc">False</span><span class="p">)[[</span><span class="s1">&#39;test_file&#39;</span><span class="p">,</span> <span class="s1">&#39;train_file&#39;</span><span class="p">,</span> <span class="s1">&#39;score&#39;</span><span class="p">]]</span>
    <span class="n">df</span><span class="p">[</span><span class="s1">&#39;label_test&#39;</span><span class="p">]</span> <span class="o">=</span> <span class="n">df</span><span class="o">.</span><span class="n">test_file</span><span class="o">.</span><span class="n">str</span><span class="o">.</span><span class="n">split</span><span class="p">(</span><span class="s1">&#39;,&#39;</span><span class="p">,</span> <span class="n">expand</span> <span class="o">=</span> <span class="kc">True</span><span class="p">)[</span><span class="mi">1</span><span class="p">]</span>
    <span class="n">df</span><span class="p">[</span><span class="s1">&#39;label_train&#39;</span><span class="p">]</span> <span class="o">=</span> <span class="n">df</span><span class="o">.</span><span class="n">train_file</span><span class="o">.</span><span class="n">str</span><span class="o">.</span><span class="n">split</span><span class="p">(</span><span class="s1">&#39;,&#39;</span><span class="p">,</span> <span class="n">expand</span> <span class="o">=</span> <span class="kc">True</span><span class="p">)[</span><span class="mi">1</span><span class="p">]</span>
    
    <span class="n">nof</span> <span class="o">=</span> <span class="nb">len</span><span class="p">(</span><span class="n">df</span><span class="p">[</span><span class="n">df</span><span class="o">.</span><span class="n">label_test</span><span class="o">==</span><span class="n">df</span><span class="o">.</span><span class="n">label_train</span><span class="p">])</span>
    <span class="n">df</span> <span class="o">=</span> <span class="n">df</span><span class="p">[</span><span class="mi">0</span><span class="p">:</span><span class="mi">10</span><span class="p">]</span>
    

    <span class="n">df</span><span class="o">=</span><span class="n">df</span><span class="o">.</span><span class="n">sort_values</span><span class="p">(</span><span class="n">by</span><span class="o">=</span><span class="p">[</span><span class="s1">&#39;score&#39;</span><span class="p">])</span>
    <span class="n">df</span><span class="p">[</span><span class="s1">&#39;color&#39;</span><span class="p">]</span><span class="o">=</span><span class="s1">&#39;gray&#39;</span>
    <span class="n">df</span><span class="o">.</span><span class="n">loc</span><span class="p">[</span><span class="n">df</span><span class="o">.</span><span class="n">label_test</span><span class="o">==</span><span class="n">df</span><span class="o">.</span><span class="n">label_train</span><span class="p">,</span> <span class="s1">&#39;color&#39;</span><span class="p">]</span> <span class="o">=</span> <span class="s1">&#39;green&#39;</span>
    
    <span class="k">if</span><span class="p">(</span><span class="nb">len</span><span class="p">(</span><span class="n">df</span><span class="p">[</span><span class="n">df</span><span class="o">.</span><span class="n">color</span><span class="o">==</span><span class="s1">&#39;green&#39;</span><span class="p">])</span> <span class="o">==</span><span class="n">nof</span><span class="p">):</span>

        <span class="n">df</span><span class="o">.</span><span class="n">loc</span><span class="p">[(</span><span class="n">df</span><span class="o">.</span><span class="n">color</span><span class="o">!=</span><span class="s1">&#39;green&#39;</span><span class="p">),</span> <span class="s1">&#39;color&#39;</span><span class="p">]</span> <span class="o">=</span> <span class="s1">&#39;gray&#39;</span>
  
    <span class="n">plt</span><span class="o">=</span> <span class="n">df</span><span class="o">.</span><span class="n">plot</span><span class="o">.</span><span class="n">barh</span><span class="p">(</span><span class="n">x</span><span class="o">=</span><span class="s1">&#39;train_file&#39;</span><span class="p">,</span> <span class="n">y</span><span class="o">=</span><span class="s1">&#39;score&#39;</span><span class="p">,</span> <span class="n">figsize</span><span class="o">=</span><span class="p">(</span><span class="mi">10</span><span class="p">,</span><span class="mi">7</span><span class="p">),</span> <span class="n">fontsize</span><span class="o">=</span><span class="mi">16</span><span class="p">,</span> <span class="n">color</span><span class="o">=</span><span class="nb">list</span><span class="p">(</span><span class="n">df</span><span class="p">[</span><span class="s1">&#39;color&#39;</span><span class="p">]))</span>
    <span class="n">plt</span><span class="o">.</span><span class="n">axis</span><span class="p">(</span><span class="n">xmin</span><span class="o">=</span><span class="mf">0.7</span><span class="p">,</span><span class="n">xmax</span><span class="o">=</span><span class="mf">1.01</span><span class="p">)</span>
    
    <span class="n">plt</span><span class="o">.</span><span class="n">set_ylabel</span><span class="p">(</span><span class="s1">&#39;Similarity&#39;</span><span class="p">,</span> <span class="n">fontsize</span><span class="o">=</span><span class="mi">15</span><span class="p">)</span>
    <span class="n">plt</span><span class="o">.</span><span class="n">set_xlabel</span><span class="p">(</span><span class="n">query_file</span><span class="p">,</span> <span class="n">fontsize</span><span class="o">=</span><span class="mi">15</span><span class="p">)</span>
</pre></div>

     </div>
</div>
</div>
</div>

</div><div  class="jp-Cell jp-CodeCell jp-Notebook-cell   ">
<div class="jp-Cell-inputWrapper">
<div class="jp-Collapser jp-InputCollapser jp-Cell-inputCollapser">
</div>
<div class="jp-InputArea jp-Cell-inputArea">
<div class="jp-InputPrompt jp-InputArea-prompt">In&nbsp;[16]:</div>
<div class="jp-CodeMirrorEditor jp-Editor jp-InputArea-editor" data-type="inline">
     <div class="CodeMirror cm-s-jupyter">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">S3</span><span class="p">(</span><span class="s1">&#39;ENCFF168GCU.bed.gz,h3k4me1&#39;</span><span class="p">,</span> <span class="n">distance_s3</span><span class="p">)</span>
</pre></div>

     </div>
</div>
</div>
</div>

<div class="jp-Cell-outputWrapper">
<div class="jp-Collapser jp-OutputCollapser jp-Cell-outputCollapser">
</div>


<div class="jp-OutputArea jp-Cell-outputArea">
<div class="jp-OutputArea-child">
    
    <div class="jp-OutputPrompt jp-OutputArea-prompt"></div>




<div class="jp-RenderedImage jp-OutputArea-output ">
<img src="data:image/png;base64,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
"
class="
jp-needs-light-background
"
>
</div>

</div>

</div>

</div>

</div>
</body>







</html>
