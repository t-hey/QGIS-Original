/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/processing/qgsprocessingprovider.h                          *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/




class QgsProcessingProvider : QObject
{
%Docstring
 Abstract base class for processing providers. An algorithm provider is a set of
 related algorithms, typically from the same external application or related
 to a common area of analysis.
.. versionadded:: 3.0
%End

%TypeHeaderCode
#include "qgsprocessingprovider.h"
%End
  public:

    QgsProcessingProvider( QObject *parent /TransferThis/ = 0 );
%Docstring
 Constructor for QgsProcessingProvider.
%End

    virtual ~QgsProcessingProvider();


    virtual QIcon icon() const;
%Docstring
 Returns an icon for the provider.
.. seealso:: svgIconPath()
 :rtype: QIcon
%End

    virtual QString svgIconPath() const;
%Docstring
 Returns a path to an SVG version of the provider's icon.
.. seealso:: icon()
 :rtype: str
%End

    virtual QString id() const = 0;
%Docstring
 Returns the unique provider id, used for identifying the provider. This string
 should be a unique, short, character only string, eg "qgis" or "gdal". This
 string should not be localised.
.. seealso:: name()
 :rtype: str
%End

    virtual QString name() const = 0;
%Docstring
 Returns the provider name, which is used to describe the provider within the GUI.
 This string should be short (e.g. "Lastools") and localised.
.. seealso:: longName()
.. seealso:: id()
 :rtype: str
%End

    virtual QString longName() const;
%Docstring
 Returns the a longer version of the provider name, which can include extra details
 such as version numbers. E.g. "Lastools LIDAR tools (version 2.2.1)".
 This string should be localised.

 The default implementation returns the same string as name().

.. seealso:: name()
.. seealso:: id()
 :rtype: str
%End

    virtual bool canBeActivated() const;
%Docstring
 Returns true if the provider can be activated, or false if it cannot be activated (e.g. due to
 missing external dependencies).
.. seealso:: isActive()
 :rtype: bool
%End

    virtual bool isActive() const;
%Docstring
 Returns true if the provider is active and able to run algorithms.
 :rtype: bool
%End

    virtual QStringList supportedOutputRasterLayerExtensions() const;
%Docstring
 Returns a list of the raster format file extensions supported by this provider.
.. seealso:: supportedOutputVectorLayerExtensions()
 :rtype: list of str
%End

    virtual QStringList supportedOutputVectorLayerExtensions() const;
%Docstring
 Returns a list of the vector format file extensions supported by this provider.
.. seealso:: defaultVectorFileExtension()
.. seealso:: supportedOutputRasterLayerExtensions()
.. seealso:: supportsNonFileBasedOutput()
 :rtype: list of str
%End

    virtual QString defaultVectorFileExtension( bool hasGeometry = true ) const;
%Docstring
 Returns the default file extension to use for vector outputs created by the
 provider.

 If ``hasGeometry`` is true then the output file format must have support for
 geometry. If ``hasGeometry`` is false then non-spatial formats can be used.

 The default implementation returns the user's default Processing vector output format
 setting, if it's supported by the provider (see supportedOutputVectorLayerExtensions()).
 Otherwise the first reported supported vector format will be used.

.. seealso:: supportedOutputVectorLayerExtensions()
.. seealso:: defaultRasterFileExtension()
 :rtype: str
%End

    virtual QString defaultRasterFileExtension() const;
%Docstring
 Returns the default file extension to use for raster outputs created by the
 provider.

 The default implementation returns the user's default Processing raster output format
 setting, if it's supported by the provider (see supportedOutputRasterLayerExtensions()).
 Otherwise the first reported supported raster format will be used.

.. seealso:: supportedOutputRasterLayerExtensions()
.. seealso:: defaultVectorFileExtension()
 :rtype: str
%End

    virtual bool supportsNonFileBasedOutput() const;
%Docstring
 Returns true if the provider supports non-file based outputs (such as memory layers
 or direct database outputs).
.. seealso:: supportedOutputVectorLayerExtensions()
 :rtype: bool
%End

    virtual bool load();
%Docstring
 Loads the provider. This will be called when the plugin is being loaded, and any general
 setup actions should occur in an overridden version of this method.
 Subclasses should not individually load any algorithms in their load() implementations, as that must
 occur within the loadAlgorithms() method. Instead, subclasses should call refreshAlgorithms()
 from any overloaded load() method to trigger an initial load of the provider's algorithms.
 :return: true if provider could be successfully loaded
.. seealso:: unload()
 :rtype: bool
%End

    virtual void unload();
%Docstring
 Unloads the provider. Any tear-down steps required by the provider should be implemented here.
.. seealso:: load()
%End

    void refreshAlgorithms();
%Docstring
 Refreshes the algorithms available from the provider, causing it to re-populate with all associated algorithms.
%End

    QList< const QgsProcessingAlgorithm * > algorithms() const;
%Docstring
 Returns a list of algorithms supplied by this provider.
.. seealso:: algorithm()
 :rtype: list of const QgsProcessingAlgorithm
%End

    const QgsProcessingAlgorithm *algorithm( const QString &name ) const;
%Docstring
 Returns the matching algorithm by ``name``, or a None if no matching
 algorithm is contained by this provider.
.. seealso:: algorithms()
 :rtype: QgsProcessingAlgorithm
%End

  signals:

    void algorithmsLoaded();
%Docstring
 Emitted when the provider has loaded (or refreshed) its list of available
 algorithms.
.. seealso:: refreshAlgorithms()
%End

  protected:

    virtual void loadAlgorithms() = 0;
%Docstring
 Loads all algorithms belonging to this provider. Subclasses should implement this, calling
 addAlgorithm() to register all their associated algorithms.
%End

    bool addAlgorithm( QgsProcessingAlgorithm *algorithm /Transfer/ );
%Docstring
 Adds an ``algorithm`` to the provider. Ownership of the algorithm is transferred to the provider.
 :rtype: bool
%End

  private:
    QgsProcessingProvider( const QgsProcessingProvider &other );
};



/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * src/core/processing/qgsprocessingprovider.h                          *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/
