using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Com.Reactlibrary.RNUmengSocial
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNUmengSocialModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNUmengSocialModule"/>.
        /// </summary>
        internal RNUmengSocialModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNUmengSocial";
            }
        }
    }
}
