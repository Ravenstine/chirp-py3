class ChirpPy3 < Formula
  version "0.0.1"
  desc "Tool for programming amateur radio - Unofficial Python 3 version"
  homepage "https://github.com/ravenstine/chirp-py3"

  stable do
    url "https://github.com/kk7ds/chirp", using: :git, branch: "py3", revision: "dd17ff66ba406c086f4d494a79a8a1f2419b6ad5"
    patch :DATA
  end

  head do
    url "https://github.com/kk7ds/chirp", using: :git, branch: "py3"
    patch :DATA
  end

  depends_on "git"
  depends_on "gtk+3"
  depends_on "pygobject3"

  def install
    system "python3", "-m", "ensurepip"
    system "pip3", "install", "six", "future", "serial", "pyserial", "pycairo"
    system "2to3", "-W", "-n", "./chirp/", "./locale/", "./chirpw", "./chirpc", "./rpttool"

    inreplace "./chirpw", "#!/usr/bin/env python", "#!/usr/bin/env python3"
    inreplace "./chirpc", "#!/usr/bin/env python", "#!/usr/bin/env python3"
    inreplace "./rpttool", "#!/usr/bin/env python", "#!/usr/bin/env python3"

    libexec.install buildpath.children

    bin.install_symlink libexec/"chirpw"
    bin.install_symlink libexec/"chirpc"
    bin.install_symlink libexec/"rpttool"
  end
end

__END__
diff --git a/chirp/ui/clone.py b/chirp/ui/clone.py
index aea00c28..b31a7cf9 100644
--- a/chirp/ui/clone.py
+++ b/chirp/ui/clone.py
@@ -155,7 +155,7 @@ class CloneSettingsDialog(gtk.Dialog):
                             buttons=buttons,
                             flags=gtk.DIALOG_MODAL)
         self.set_default_response(gtk.RESPONSE_OK)
-        self.set_alternative_button_order([gtk.RESPONSE_OK,
+        self.set_alternative_button_order_from_array([gtk.RESPONSE_OK,
                                            gtk.RESPONSE_CANCEL])
         self.__make_ui(settings)

diff --git a/chirp/ui/importdialog.py b/chirp/ui/importdialog.py
index 548b4e21..39933f16 100644
--- a/chirp/ui/importdialog.py
+++ b/chirp/ui/importdialog.py
@@ -583,7 +583,7 @@ class ImportDialog(gtk.Dialog):
                             title=self.TITLE,
                             parent=parent)
         self.set_default_response(gtk.RESPONSE_OK)
-        self.set_alternative_button_order([gtk.RESPONSE_OK,
+        self.set_alternative_button_order_from_array([gtk.RESPONSE_OK,
                                            gtk.RESPONSE_CANCEL])
         self.col_import = 0
         self.col_nloc = 1
diff --git a/chirp/ui/inputdialog.py b/chirp/ui/inputdialog.py
index 74362dc0..4ff36090 100644
--- a/chirp/ui/inputdialog.py
+++ b/chirp/ui/inputdialog.py
@@ -56,7 +56,7 @@ class ChoiceDialog(gtk.Dialog):
         gtk.Dialog.__init__(self, buttons=buttons, **args)

         self.set_default_response(gtk.RESPONSE_OK)
-        self.set_alternative_button_order([gtk.RESPONSE_OK,
+        self.set_alternative_button_order_from_array([gtk.RESPONSE_OK,
                                            gtk.RESPONSE_CANCEL])

         self.label = gtk.Label()
@@ -110,7 +110,7 @@ class FieldDialog(gtk.Dialog):
         gtk.Dialog.__init__(self, buttons=buttons, **args)

         self.set_default_response(gtk.RESPONSE_OK)
-        self.set_alternative_button_order([gtk.RESPONSE_OK,
+        self.set_alternative_button_order_from_array([gtk.RESPONSE_OK,
                                            gtk.RESPONSE_CANCEL])

         self.__fields = {}
@@ -148,7 +148,7 @@ class OverwriteDialog(gtk.MessageDialog):
         buttons = (gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL,
                    gtk.STOCK_OK, gtk.RESPONSE_OK)
         gtk.Dialog.__init__(self, buttons=buttons)
-        self.set_alternative_button_order([gtk.RESPONSE_OK,
+        self.set_alternative_button_order_from_array([gtk.RESPONSE_OK,
                                            gtk.RESPONSE_CANCEL])

         self.set_property("text", _("File Exists"))
diff --git a/chirp/ui/mainapp.py b/chirp/ui/mainapp.py
index 29736463..095dd862 100644
--- a/chirp/ui/mainapp.py
+++ b/chirp/ui/mainapp.py
@@ -166,7 +166,7 @@ class ChirpMain(gtk.Window):
                        buttons=buttons,
                        parent=self)
         d.set_default_response(gtk.RESPONSE_OK)
-        d.set_alternative_button_order([gtk.RESPONSE_OK,
+        d.set_alternative_button_order_from_array([gtk.RESPONSE_OK,
                                         gtk.RESPONSE_CANCEL])

         label = gtk.Label("")
@@ -303,7 +303,7 @@ of file.
         d = gtk.Dialog(title="Detection Failed",
                        buttons=buttons)
         d.set_default_response(gtk.RESPONSE_OK)
-        d.set_alternative_button_order([gtk.RESPONSE_OK,
+        d.set_alternative_button_order_from_array([gtk.RESPONSE_OK,
                                         gtk.RESPONSE_CANCEL])
         d.vbox.pack_start(lab, 0, 0, 0)
         d.vbox.pack_start(choice, 0, 0, 0)
@@ -842,7 +842,7 @@ of file.
                 title=_("Save Changes?"), parent=self,
                 buttons=buttons)
             dlg.set_default_response(gtk.RESPONSE_YES)
-            dlg.set_alternative_button_order([gtk.RESPONSE_YES,
+            dlg.set_alternative_button_order_from_array([gtk.RESPONSE_YES,
                                               gtk.RESPONSE_NO,
                                               gtk.RESPONSE_CANCEL])
             dlg.set_text(_("File is modified, save changes before closing?"))
@@ -1651,7 +1651,7 @@ of file.
                        parent=self,
                        buttons=buttons)
         d.set_default_response(gtk.RESPONSE_OK)
-        d.set_alternative_button_order([gtk.RESPONSE_OK,
+        d.set_alternative_button_order_from_array([gtk.RESPONSE_OK,
                                         gtk.RESPONSE_CANCEL])

         vbox = gtk.VBox()
diff --git a/chirp/ui/memdetail.py b/chirp/ui/memdetail.py
index abbe8c49..0446e9c8 100644
--- a/chirp/ui/memdetail.py
+++ b/chirp/ui/memdetail.py
@@ -327,7 +327,7 @@ class MemoryDetailEditor(gtk.Dialog):
                             parent=parent,
                             buttons=buttons)
         self.set_default_response(gtk.RESPONSE_OK)
-        self.set_alternative_button_order([gtk.RESPONSE_OK,
+        self.set_alternative_button_order_from_array([gtk.RESPONSE_OK,
                                            gtk.RESPONSE_CANCEL])
         self.set_size_request(-1, 500)
         self._tips = compat.CompatTooltips()
diff --git a/chirp/ui/memedit.py b/chirp/ui/memedit.py
index 3cc20599..62e827ad 100644
--- a/chirp/ui/memedit.py
+++ b/chirp/ui/memedit.py
@@ -1535,7 +1535,7 @@ class MemoryEditor(common.Editor):
                                             parent=None,
                                             buttons=buttons)
                 d.set_default_response(gtk.RESPONSE_YES)
-                d.set_alternative_button_order([gtk.RESPONSE_YES,
+                d.set_alternative_button_order_from_array([gtk.RESPONSE_YES,
                                                 gtk.RESPONSE_ACCEPT,
                                                 gtk.RESPONSE_NO,
                                                 gtk.RESPONSE_CANCEL])
@@ -1570,7 +1570,7 @@ class MemoryEditor(common.Editor):
                     d = miscwidgets.YesNoDialog(title=_("Incompatible Memory"),
                                                 buttons=buttons)
                     d.set_default_response(gtk.RESPONSE_OK)
-                    d.set_alternative_button_order([gtk.RESPONSE_OK,
+                    d.set_alternative_button_order_from_array([gtk.RESPONSE_OK,
                                                     gtk.RESPONSE_CANCEL])
                     d.set_text(
                         _("Pasted memory {number} is not compatible with "
diff --git a/chirpc b/chirpc
index c7aa2cfc..ddb2696e 100644
--- a/chirpc
+++ b/chirpc
@@ -196,13 +196,13 @@ if __name__ == "__main__":
     logger.handle_options(options)

     if options.list_radios:
-        print("Supported Radios:\n\t", "\n\t".join(sorted(RADIOS.keys())))
+        print(("Supported Radios:\n\t", "\n\t".join(sorted(RADIOS.keys()))))
         sys.exit(0)

     if options.id:
         from chirp import detect
         md = detect.detect_icom_radio(options.serial)
-        print("Model:\n%s" % md.MODEL)
+        print(("Model:\n%s" % md.MODEL))
         sys.exit(0)

     if not options.radio:
@@ -232,7 +232,7 @@ if __name__ == "__main__":
     radio = rclass(s)

     if options.list_settings:
-        print(radio.get_settings())
+        print((radio.get_settings()))
         sys.exit(0)

     if options.list_mem:
@@ -283,8 +283,8 @@ if __name__ == "__main__":
         data = radio.get_raw_memory(memnum)
         for i in data:
             if ord(i) > 0x7F:
-                print("Memory location %s (%i):\n%s" %
-                      (memnum, len(data), util.hexprint(data)))
+                print(("Memory location %s (%i):\n%s" %
+                      (memnum, len(data), util.hexprint(data))))
                 sys.exit(0)
         print(data)
         sys.exit(0)
diff --git a/chirpw b/chirpw
index 481dd32b..2c63aba8 100755
--- a/chirpw
+++ b/chirpw
@@ -25,7 +25,7 @@ import locale
 import gettext
 import argparse
 import logging
-import urllib
+import urllib.request, urllib.parse, urllib.error

 if six.PY3:
     from gi import pygtkcompat
@@ -102,7 +102,7 @@ lang = gettext.translation("CHIRP", localepath, languages=langs,
 class CompatStr(str):
     def format(self, **kwargs):
         base = lang.gettext(self)
-        for k, v in kwargs.items():
+        for k, v in list(kwargs.items()):
             base = base.replace("{%s}" % k, str(v))
         return base

@@ -116,11 +116,11 @@ except:

 if int(vmaj) == 2 and int(vmin) < 6:
     # Python <2.6, emulate str.format()
-    import __builtin__
+    import builtins

     def lang_with_format(string):
         return CompatStr(string)
-    __builtin__._ = lang_with_format
+    builtins._ = lang_with_format
 else:
     # Python >=2.6, use normal gettext behavior
     lang.install()
diff --git a/setup.py b/setup.py
index e403d91b..1430fbaa 100644
--- a/setup.py
+++ b/setup.py
@@ -87,8 +87,8 @@ def macos_build():

     APP = ['chirp-%s.py' % CHIRP_VERSION]
     shutil.copy("chirpw", APP[0])
-    DATA_FILES = [('../Frameworks', ['/opt/local/lib/libpangox-1.0.dylib']),
-                  ('../Resources/', ['/opt/local/lib/pango']),
+    DATA_FILES = [('../Frameworks', []),
+                  ('../Resources/', []),
                   ]
     OPTIONS = {'argv_emulation': True, "includes": "gtk,atk,pangocairo,cairo"}

@@ -98,7 +98,7 @@ def macos_build():
         options={'py2app': OPTIONS},
         setup_requires=['py2app'],
         )
-
+    return
     EXEC = 'bash ./build/macos/make_pango.sh ' + \
            '/opt/local dist/chirp-%s.app' % CHIRP_VERSION
     # print "exec string: %s" % EXEC
diff --git a/chirp/drivers/uv5r.py b/chirp/drivers/uv5r.py
index 5cb94234..2576ed29 100644
--- a/chirp/drivers/uv5r.py
+++ b/chirp/drivers/uv5r.py
@@ -602,7 +602,7 @@ def _do_download(radio):
             data += _read_block(radio, i, 0x40, False)

     if append_model:
-        data += radio.MODEL.ljust(8)
+        data += radio.MODEL.ljust(8).encode('utf-8')

     LOG.debug("done.")
     return memmap.MemoryMapBytes(data)
