#include "impl.h"

#include <Cocoa/Cocoa.h>

namespace impl {

std::string GetAccessibilityDocument(char* handle, size_t size) {
  if (size != sizeof(NSView*))
    return "";
  NSView* view = *reinterpret_cast<NSView**>(handle);
  if (![view isKindOfClass:[NSView class]])
    return "";
  NSWindow* window = [view window];
  if (!window)
    return "";
  NSString* axDoc = [window accessibilityDocument];
  if (!axDoc)
    return "";
  return std::string([axDoc UTF8String]);
}

}  // namespace impl
