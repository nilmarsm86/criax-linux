/*******************************************************************************
 * 
 * Copyright: 2010 Simply Notes, Germany, http://www.simply-notes.de
 * 
 * License: LGPL: http://www.gnu.org/licenses/lgpl.html EPL:
 * http://www.eclipse.org/org/documents/epl-v10.php See the LICENSE file in the
 * project's top-level directory for details.
 * 
 * Authors: Raimund Mann
 * 
 ******************************************************************************/

/**
 * This is the main class of contribution "accordion"
 * @asset(accordion/*)
 */
qx.Class.define("accordion.Accordion", {
			extend : qx.ui.container.Composite,

			/**
			 * metodo de inicializacion de la clase
			 * 
			 * @constructor
			 * @public
			 * @param parentWindow
			 *            {}: Ventana que contendra el accordion
			 * 
			 */
			
			construct : function(parentWindow) {

				this.base(arguments);
				this._win = parentWindow;
				this.setLayout(new qx.ui.layout.VBox());

				// Array for the buttons of the accordion
				this.BtnArray = new Array();
				// Array for the objects associated with a button
				this.ObjArray = new Array();
				// Array for the functions associated with a button
				this.FuncArray = new Array();

			},

			/**
			 * @property
			 */
			properties : {
				/**
				 * number of buttons in accordion
				 * 
				 * @name btnCount
				 * @public
				 * @type Number
				 * 
				 */
				btnCount : {
					check : "Number",
					init : 0
				},

				/**
				 * idx of button selected
				 * 
				 * @name btnSelected
				 * @public
				 * @type Number
				 * 
				 */
				btnSelected : {
					check : "Number",
					init : 0
				},

				/**
				 * height of button used in accordion required for calculating
				 * the available space
				 * 
				 * @name btnHeight
				 * @public
				 * @type Number
				 * 
				 */
				btnHeight : {
					check : "Number",
					init : 24
				},

				/**
				 * ...
				 * 
				 * @name offsetHeight
				 * @public
				 * @type Number
				 * 
				 */
				offsetHeight : {
					check : "Number",
					init : 78
				}

			},

			/**
			 * @method
			 */
			members : {
				
				/**
				 * metodo para ...
				 * 
				 * @method __naviBtnClicked
				 * @private
				 * @param i {}: ...
				 * 
				 */

				__naviBtnClicked : function(i) {
					this.setBtnSelected(this.BtnArray[i]["id"]);
					this.updateAccordion();
				},

				/**
				 * resets all accordion arrays
				 * 
				 * @method clearArray
				 * @public
				 * 
				 */
				
				clearArray : function() {
					// Array for the buttons of the accordion
					this.BtnArray.splice(1, this.BtnArray.length);
					// Array for the objects associated with a button
					this.ObjArray.splice(1, this.ObjArray.length);
					// Array for the functions associated with a button
					this.FuncArray.splice(1, this.FuncArray.length);
					this.setBtnCount(0);
					this.setBtnSelected(0);
				},
				
				/**
				 * metodo para ...
				 * 
				 * @method addBtn
				 * @public
				 * @param pos {Integer}: pocision
				 * @param caption {String}: testo del boton
				 * 
				 */
				
				addBtn : function(pos, caption) {

					var curBtnCount = this.getBtnCount();
					if (curBtnCount == 0) {
						// first Button is the selected as well
						if (this.getBtnSelected() == 0) {
							this.setBtnSelected(1);
						}
					}

					this.setBtnCount(curBtnCount + 1);
					curBtnCount = this.getBtnCount();

					if (pos > curBtnCount) {
						pos = curBtnCount;
					}
					if (pos == curBtnCount) {
						// no special action required
					}
					if (pos < curBtnCount) {
						// Re-order buttons - shift array
						var i = curBtnCount;
						do {
							this.BtnArray[i - 1].removeListener("execute",
									function(e) {
									}, this);

							this.BtnArray[i] = this.BtnArray[i - 1];
							this.BtnArray[i]["id"] = i

							// Add an event listener
							this.BtnArray[i].addListener("execute",
									function(e) {
										this.__naviBtnClicked(i);
									}, this);

							i--;
						} while (i > pos);
					}

					this.BtnArray[pos] = new qx.ui.form.Button(caption);
					this.BtnArray[pos]["id"] = pos;

					// Set button location
					this.add(this.BtnArray[pos]);

					// Add an event listener
					this.BtnArray[pos].addListener("execute", function(e) {
								this.__naviBtnClicked(pos);
							}, this);
				},
				
				/**
				 * metodo para ...
				 * 
				 * @method addObject
				 * @public
				 * @param pos {Integer}: posicion
				 * @param object {Object}: ...
				 * @param adjust {} ...
				 * 
				 */
				
				addObject : function(pos, object, adjust) {

					var curBtnCount = this.getBtnCount();

					if (pos > curBtnCount) {
						pos = curBtnCount;
					}
					if (pos == curBtnCount) {
						// no special action required
					}
					if (pos < curBtnCount) {
						// Re-order buttons - shift array
						var i = curBtnCount;
						do {
							this.ObjArray[i] = this.ObjArray[i - 1];
							this.ObjArray[i]["id"] = i;
							i--;
						} while (i > pos);
					}

					this.ObjArray[pos] = object;
					this.ObjArray[pos]["id"] = pos;
					this.ObjArray[pos]["adjust"] = adjust;

					this.add(this.ObjArray[pos]);

				},
				
				/**
				 * metodo para ...
				 * 
				 * @method updateAccordion
				 * @public
				 * 
				 */
				
				updateAccordion : function() {

					var curBtnCount = this.getBtnCount();
					var selectedBtn = this.getBtnSelected();

					// get updated height
					var headerHeight = 50; // headerHeight of Window Title bar
					// statusbar Height if enabled
					if (this._win.getShowStatusbar()) {
						var sBarHeight = 20;
					} else {
						var sBarHeight = 0;
					}

					var footerHeight = 0;
					var winHeight = this._win.getHeight();
					if (winHeight == null) {
						winHeight = this._win.getMinHeight();
					}
					winHeight = winHeight - sBarHeight;
					var btnHeight = this.getBtnHeight();
					var areaHeight = winHeight
							- (headerHeight + (btnHeight * (curBtnCount - 1)));
					var totalHeight = winHeight
							- (footerHeight + (btnHeight * (curBtnCount - 1)));

					// clear all widgets
					this.removeAll();

					// re-add the widgets
					var i = 1;
					while (i <= selectedBtn) {
						this.add(this.BtnArray[i]);

						if (i == selectedBtn) {
							try {
								this.add(this.ObjArray[i]);
								if (this.ObjArray[i]["adjust"] == 1) {
									this.ObjArray[i].setHeight(areaHeight);
								};
								totalHeight = totalHeight
										- this.ObjArray[i].getHeight();
							} catch (ex) {
								// catch errors if ObjArray is undefined - no
								// action
							}
						}
						i++;
					};

					// Add the remaining buttons
					while (i <= curBtnCount) {
						// set position
						this.add(this.BtnArray[i]);
						i++;
					};
				}
			},

			/**
			 * destructor de clases
			 * 
			 * @destruct
			 * @public
			 * 
			 */
			
			destruct : function() {

			}

		});