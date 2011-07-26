/***
  BEGIN LICENSE
	
  Copyright (C) 2011 Mario Guerriero <mefrio.g@gmail.com>	
  This program is free software: you can redistribute it and/or modify it	
  under the terms of the GNU Lesser General Public License version 3, as published	
  by the Free Software Foundation.
	
  This program is distributed in the hope that it will be useful, but	
  WITHOUT ANY WARRANTY; without even the implied warranties of	
  MERCHANTABILITY, SATISFACTORY QUALITY, or FITNESS FOR A PARTICULAR	
  PURPOSE.  See the GNU General Public License for more details.
	
  You should have received a copy of the GNU General Public License along	
  with this program.  If not, see <http://www.gnu.org/licenses/>	
  
  END LICENSE	
***/

using Gtk;
using Pango;
using GtkSource;

namespace Scratch.Widgets {

    public class Tab : ScrolledWindow {

        public View text_view;
//        public Label label;
        public string filename;
        
        public Tab() {
            
            set_policy (PolicyType.AUTOMATIC, PolicyType.AUTOMATIC);
            
            text_view = new View ();
            text_view.set_highlight_current_line (true);
            text_view.set_show_line_numbers (true);            
            
            add (text_view);
//            label = new Label ("New file");
            filename = null;
            show_all();

        }

    }
    /*
    public class TabLabel : HBox {

        public HBox tablabel;
        public Label label;
        public Button close;
        
        public TabLabel(string label) {
            
            this.label = new Label (label);
            
            var image = new Image.from_stock(Stock.CLOSE, IconSize.MENU);
            this.close = new Button ();
            this.close.clicked.connect (on_close_clicked);
            this.close.set_relief (ReliefStyle.NONE);
            this.close.set_image (image);
            
            this.hbox.pack_start (this.label, false, false, 0);
            this.hbox.pack_start (this.close, false, false, 0);
            
            this.show_all ();		
        }
        
        public void on_close_clicked() {
            
            return;	
            
        }
        
        public void change_label(string label) {
            
            this.label.set_text (label);
            
        }
        
    }
    */
    public class ScratchNotebook : Notebook {

        //widgets for the label
        public HBox tablabel;
        public Label label;
        public Button close;

        public int add_tab(string tabtext="New file") {
            
            //tab label
            this.tablabel = new HBox (false, 0);
            
            this.label = new Label (tabtext);
            
            var image = new Image.from_stock(Stock.CLOSE, IconSize.MENU);
            this.close = new Button ();
            this.close.clicked.connect (on_close_clicked);
            this.close.set_relief (ReliefStyle.NONE);
            this.close.set_image (image);
            
            this.tablabel.pack_start (this.label, false, false, 0);
            this.tablabel.pack_start (this.close, false, false, 0);
            
            this.tablabel.show_all ();	
            
            //create the tab
            var new_tab = new Tab();
            this.set_tab_reorderable (new_tab, true);
            return this.append_page (new_tab, this.tablabel);
        }
        
        public void change_label(string label) {
            
            this.label.set_text (label);
            
        }

        //events
        public void on_close_clicked () {
            
            return;	
            
        }

        public ScratchNotebook() {
            this.set_scrollable (true);
        }


    }
} // Namespace
